using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RefereeMatchCard
{
    public partial class CurrentMatchEditPlayers : System.Web.UI.Page
    {

        /*****************************************************************************************************************
         ON PAGE LOAD, CALL SESSIONS AND POPULATE LABELS
         ****************************************************************************************************************/

        protected void Page_Load(object sender, EventArgs e)
        {
            HomeTeamNameLabel.Text = (string)Session["homeTeamName"];
            AwayTeamNameLabel.Text = (string)Session["awayTeamName"];
            var homeTeamID = (string)Session["homeTeamID"];
            var awayTeamID = (string)Session["awayTeamID"];
            int fixtureID = (int)Session["fixtureID"];
        }

        /*****************************************************************************************************************
                 HOME BUTTON
         ****************************************************************************************************************/

        protected void homeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx", true);
        }

        /*****************************************************************************************************************
                FINISH MATCH BUTTON
        ****************************************************************************************************************/

        protected void FinishMatchCardButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("FinishMatchCard.aspx", true);
        }

        
    }
}
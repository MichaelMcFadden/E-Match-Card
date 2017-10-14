using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace RefereeMatchCard
{
    public partial class CurrentMatch : System.Web.UI.Page
    {
        /*****************************************************************************************************************
                 CREATE CONNECTION
         ****************************************************************************************************************/
        SqlConnection conn = new SqlConnection("Data Source=tcp:league.database.windows.net,1433;Initial Catalog=leagueFixture;Persist Security Info=False;User ID=l00105787;Password=Rbsted.73;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

        /*****************************************************************************************************************
                 ON PAGE LOAD, CALL SESSIONS AND POPULATE LABELS
         ****************************************************************************************************************/
        protected void Page_Load(object sender, EventArgs e)
        {
            HomeTeamNameLabel.Text = (string)Session["homeTeamName"];
            AwayTeamNameLabel.Text = (string)Session["awayTeamName"];
            var homeTeamID = (string)Session["homeTeamID"];
            var awayTeamID = (string)Session["awayTeamID"];
        }

        /*****************************************************************************************************************
                 HOME BUTTON
         ****************************************************************************************************************/
        protected void homeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx", true);
        }

        /*****************************************************************************************************************
                 CREATE METHOD TO INSERT PLAYERS INTO DATABASE
         ****************************************************************************************************************/
        private void HomePlayersRecordInserted(List<string> li)
        {
            int fixtureID = (int)Session["fixtureID"];
            var homeTeamID = (string)Session["homeTeamID"];
            StringBuilder stringhi = new StringBuilder(string.Empty);
            foreach (string item in li)
            {
                const string qry = "Insert into [FixturePlayer](Name, FixtureID, TeamID) values";
                stringhi.AppendFormat("{0}('{1}', '{2}', '{3}');", qry, item, fixtureID, homeTeamID);
            }
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = stringhi.ToString();
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        /*****************************************************************************************************************
                CREATE STRINGBUILDER METHOD TO INSERT PLAYERS TO DATABASE
        ****************************************************************************************************************/
        private void AwayPlayersRecordInserted(List<string> li)
        {
            int fixtureID = (int)Session["fixtureID"];
            var awayTeamID = (string)Session["awayTeamID"];
            StringBuilder stringhi = new StringBuilder(string.Empty);
            foreach (string item in li)
            {
                const string qry = "Insert into [FixturePlayer](Name, FixtureID, TeamID) values";
                stringhi.AppendFormat("{0}('{1}', '{2}', '{3}');", qry, item, fixtureID, awayTeamID);
            }
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = stringhi.ToString();
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        /*****************************************************************************************************************
                SAVE BUTTON THAT CALLS STRINGBUILDER INSERT METHOD
        ****************************************************************************************************************/
        protected void saveButton_Click(object sender, EventArgs e)
        {
            List<string> li = new List<string>();
            List<string> lo = new List<string>();
            foreach (ListItem item in HomeTeamPlayersCheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    li.Add(item.Text);
                }
            }
            HomePlayersRecordInserted(li);
            HomeTeamPlayersCheckBoxList1.ClearSelection();
            HomeTeamNameLabel.Text = "";
            foreach (ListItem item1 in AwayTeamPlayersCheckBoxList1.Items)
            {
                if (item1.Selected)
                {
                    lo.Add(item1.Text);
                }
            }
            AwayPlayersRecordInserted(lo);
            AwayTeamPlayersCheckBoxList1.ClearSelection();
            AwayTeamNameLabel.Text = "";
            Response.Write("<script>alert('Data inserted successfully')</script>");
            Server.Transfer("CurrentMatchEditPlayers.aspx", true);
        }

        /*****************************************************************************************************************
                SELECT ALL PLAYERS IN CHECKBOX
        ****************************************************************************************************************/
        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in HomeTeamPlayersCheckBoxList1.Items)
            {
                item.Selected = true;
                item.Enabled = true;
            }
        }

        /*****************************************************************************************************************
                SELECT ALL PLAYERS IN CHECKBOX
        ****************************************************************************************************************/
        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in AwayTeamPlayersCheckBoxList1.Items)
            {
                item.Selected = true;
                item.Enabled = true;
            }
        }
    }
}
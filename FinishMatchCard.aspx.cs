using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RefereeMatchCard
{
    public partial class FinishMatchCard : System.Web.UI.Page
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
            int fixtureID = (int)Session["fixtureID"];
        }


        /*****************************************************************************************************************
                FINISH MATCH CARD BUTTON, SAVE DATA TO DATABASE
         ****************************************************************************************************************/
        protected void FinishMatchCardButton1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile.FileName != "")
            {
                // initiate session
                int fixtureID = (int)Session["fixtureID"];

                // home image
                byte[] imageHome;
                Stream h = FileUpload1.PostedFile.InputStream;
                BinaryReader ht = new BinaryReader(h);
                imageHome = ht.ReadBytes((Int32)h.Length);

                // away image
                byte[] imageAway;
                Stream a = FileUpload2.PostedFile.InputStream;
                BinaryReader at = new BinaryReader(a);
                imageAway = at.ReadBytes((Int32)a.Length);

                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;

                comm.CommandText = "UPDATE  [Fixture] SET HomeScore = @HomeScore, AwayScore = @AwayScore, ImageHome = @ImageHome ,ImageAway = @ImageAway, Report = @Report  WHERE ([FixtureID] = @FixtureID)";
                comm.Parameters.AddWithValue("@HomeScore", HomeTeamScoreTextBox.Text);
                comm.Parameters.AddWithValue("@AwayScore", AwayTeamScoreTextBox.Text);
                comm.Parameters.AddWithValue("@ImageHome", imageHome);
                comm.Parameters.AddWithValue("@ImageAway", imageAway);
                comm.Parameters.AddWithValue("@Report", ReportTextBox2.Text);
                comm.Parameters.AddWithValue("@FixtureID", fixtureID);
                conn.Open();
                Int32 id = comm.ExecuteNonQuery();
                conn.Close();

                if (id > 0)
                {
                    Response.Write("<script>alert('Data inserted successfully')</script>");
                    Server.Transfer("Home.aspx", true);
                }
                else Response.Write("<script>alert('Data NOT inserted successfully')</script>");
            }
            else Response.Write("<script>alert('Data NOT inserted successfully')</script>");
        }

        /*****************************************************************************************************************
                HOME BUTTON
         ****************************************************************************************************************/
        protected void homeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx", true);
        }
    }
}

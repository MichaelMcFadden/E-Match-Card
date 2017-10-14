using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;



namespace RefereeMatchCard
{
    public partial class CreateNewMatch : System.Web.UI.Page
    {
        /*****************************************************************************************************************
                 CREATE CONNECTION
          ****************************************************************************************************************/
        SqlConnection conn = new SqlConnection("Data Source=tcp:league.database.windows.net,1433;Initial Catalog=leagueFixture;Persist Security Info=False;User ID=l00105787;Password=Rbsted.73;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

        /*****************************************************************************************************************
                ON PAGE LOAD BIND DROPDOWN BOX WITH LEAGUE DATA
         ****************************************************************************************************************/
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string query = "select LeagueID, Name from League";
                BindDropDownList(LeagueDropDown, query, "Name", "LeagueID", "Select League");
                HomeTeamDropDown.Enabled = false;
                AwayTeamDropDown.Enabled = false;
                HomeTeamDropDown.Items.Insert(0, new ListItem("Select TeamName", "0"));
                AwayTeamDropDown.Items.Insert(0, new ListItem("Select TeamName", "0"));
            }
        }

        /*****************************************************************************************************************
                CREATE HOME BUTTON
         ****************************************************************************************************************/
        protected void homeButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx", true);
        }

        /*****************************************************************************************************************
                 SAVE MATCH DETAILS TO FIXTURE TABLE
         ****************************************************************************************************************/
        protected void SaveButton_Click(object sender, EventArgs e)
        {

            int refereeID = (int)Session["RefereeID"];
            DateTime matchDate = Convert.ToDateTime(MatchDateTextBox.Text);
            using (SqlCommand comm = new SqlCommand("Insert into Fixture (LeagueID, VenueID, HomeTeamID, AwayTeamID, Date, RefereeID ) output INSERTED.FixtureID values(@LeagueID, @VenueID, @HomeTeamID, @AwayTeamID ,@Date, @RefereeID)", conn))
            {
                comm.Parameters.AddWithValue("@LeagueID", LeagueDropDown.SelectedValue);
                comm.Parameters.AddWithValue("@VenueID", VenueDropDown.SelectedValue);
                comm.Parameters.AddWithValue("@HomeTeamID", HomeTeamDropDown.SelectedValue);
                comm.Parameters.AddWithValue("@AwayTeamID", AwayTeamDropDown.SelectedValue);
                comm.Parameters.AddWithValue("@Date", matchDate);
                comm.Parameters.AddWithValue("@RefereeID", refereeID);
                conn.Open();

                int fixtureId = (int)comm.ExecuteScalar();
                if (conn.State == System.Data.ConnectionState.Open)
                    conn.Close();

                // create a session to pass data to another page
                Session["homeTeamName"] = HomeTeamDropDown.SelectedItem.Text;
                Session["awayTeamName"] = AwayTeamDropDown.SelectedItem.Text;
                Session["homeTeamID"] = HomeTeamDropDown.SelectedValue;
                Session["awayTeamID"] = AwayTeamDropDown.SelectedValue;
                Session["fixtureID"] = fixtureId;

                Response.Write("<script>alert('Data inserted successfully')</script>");
                Server.Transfer("CurrentMatch.aspx", true);
            }
        }

        /*****************************************************************************************************************
                 CANCEL BUTTON
         ****************************************************************************************************************/
        protected void CancelButton_Click(object sender, EventArgs e)
        {

        }
        /*****************************************************************************************************************
                 BIND DROPDOWN LIST
         ****************************************************************************************************************/
        private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
        {
            string conString = "Data Source=tcp:league.database.windows.net,1433;Initial Catalog=leagueFixture;Persist Security Info=False;User ID=l00105787;Password=Rbsted.73;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection conn = new SqlConnection(conString)) ;
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = conn;
                    conn.Open();
                    ddl.DataSource = cmd.ExecuteReader();
                    ddl.DataTextField = text;
                    ddl.DataValueField = value;
                    ddl.DataBind();
                    conn.Close();
                }
            }
            ddl.Items.Insert(0, new ListItem(defaultText, "0"));
        }

        /*****************************************************************************************************************
                 ON SELECTING LEAGUE POPULATE AND ENABLE HOME DROPDOWN LIST
         ****************************************************************************************************************/
        protected void LeagueDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            HomeTeamDropDown.Enabled = false;
            AwayTeamDropDown.Enabled = false;
            HomeTeamDropDown.Items.Clear();
            HomeTeamDropDown.Items.Insert(0, new ListItem("Select TeamName", "0"));
            int leagueID = int.Parse(LeagueDropDown.SelectedItem.Value);
            if (leagueID > 0)
            {
                string query = string.Format("select  TeamID, TeamName from Team where LeagueID = {0}", leagueID);
                BindDropDownList(HomeTeamDropDown, query, "TeamName", "TeamID", "Select TeamName");
                HomeTeamDropDown.Enabled = true;
            }
        }

        /*****************************************************************************************************************
                 ON SELECTING HOMETEAM POPULATE AND ENABLE AWAY DROPDOWN LIST
         ****************************************************************************************************************/
        protected void HomeTeamDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            AwayTeamDropDown.Enabled = false;
            AwayTeamDropDown.Items.Clear();
            AwayTeamDropDown.Items.Insert(0, new ListItem("Select TeamName", "0"));
            string teamName = HomeTeamDropDown.SelectedItem.Value;
            int leagueID = int.Parse(LeagueDropDown.SelectedItem.Value);
            if (teamName != null && leagueID > 0)
            {
                string query = string.Format("select TeamID, TeamName from Team where TeamID != {0} and LeagueID = {1}", teamName, leagueID);
                BindDropDownList(AwayTeamDropDown, query, "TeamName", "TeamID", "Select TeamName");
                AwayTeamDropDown.Enabled = true;
            }
        }
    }
}





















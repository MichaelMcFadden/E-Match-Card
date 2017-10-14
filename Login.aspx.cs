using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RefereeMatchCard
{
    public partial class Login : System.Web.UI.Page
    {
        /*****************************************************************************************************************
                CREATE CONNECTION
         ****************************************************************************************************************/
        SqlConnection con = new SqlConnection("Data Source=tcp:league.database.windows.net,1433;Initial Catalog=leagueFixture;Persist Security Info=False;User ID=l00105787;Password=Rbsted.73;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        /*****************************************************************************************************************
                CREATE CLEAR METHOD TO CLEAR TEXTBOXES
         ****************************************************************************************************************/
        public void clear()
        {
            
            usernameTextBox.Text = "";
            passwordTextBox.Text = "";

        }
        /*****************************************************************************************************************
                SUBIT BUTTON TO EXECUTE SELECT STATEMENT
         ****************************************************************************************************************/
        protected void submitButton_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select RefereeID from Referee where Username='" + usernameTextBox.Text + "'and Password='" + passwordTextBox.Text + "'",con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                int refID = (int)cmd.ExecuteScalar();
                Session["RefereeID"] = refID;
                Response.Redirect("Home.aspx? Parameter =" + usernameTextBox.Text);
            }
            else
            {
                Response.Write("<script>alert('Please enter valid Username and Password')</script>");
                clear();
            }
        }
        /*****************************************************************************************************************
                REGISTER BUTTON TO REDIRECT USER TO REGISTERATION PAGE
        ****************************************************************************************************************/
        protected void registerButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("Registeration.aspx", true);
        }
    }
}
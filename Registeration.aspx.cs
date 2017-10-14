using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RefereeMatchCard
{
    public partial class Registeration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=tcp:league.database.windows.net,1433;Initial Catalog=leagueFixture;Persist Security Info=False;User ID=l00105787;Password=Rbsted.73;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
        protected void Page_Load(object sender, EventArgs e)
        {

        } 

        public void clear()
        {
            firstnameTextBox.Text = "";
            lastnameTextBox.Text = "";
            phoneTextBox.Text = "";
            emailTextBox.Text = "";
            usernameTextBox.Text = "";
            passwordTextBox.Text = "";
        
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into Referee(FirstName,LastName,Phone,Email,Username,Password) values('" + firstnameTextBox.Text + "','" + lastnameTextBox.Text + "','" + phoneTextBox.Text + "','" + emailTextBox.Text + "','" + usernameTextBox.Text + "','" + passwordTextBox.Text + "')", con);
            cmd.CommandType = CommandType.Text;
            try
            {
                //Icon.open();
                con.Open();
                cmd.ExecuteNonQuery();
                Literal1.Text = "Data inserted successfully";
                con.Close();
                clear();
                Response.Write("<script>alert('You are now registered')</script>");
                Server.Transfer("login.aspx", true);
            }
            catch (Exception ex)
            {
                Literal1.Text = ex.Message;
            }
        }

        protected void clearButton_Click(object sender, EventArgs e)
        {
            //Response.Redirect(Request.Url.PathAndQuery, true); //this directs to the itsown page so it clears
            clear();
            Literal1.Text = "";

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("login.aspx", true);
        }

        protected void HomeButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx", true);
        }
    }
}
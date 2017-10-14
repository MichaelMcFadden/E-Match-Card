<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldMatch.aspx.cs" Inherits="RefereeMatchCard.OldMatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1 {
            color: #FF0066;
            text-decoration: underline;
            font-weight: bold;
        }

        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <!--<p>This is the home page</p>
    <a href="Registeration.aspx">Registeration</a>
    <a href="Login.aspx">Login</a>-->

    <form id="form1" runat="server">
        <div>

            <table align="center" cellpadding="4" cellspacing="2" style="border: 1px solid #999999; font-family: Century">

                <!-- APP NAME HEADER THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">E Match Card</td>
                </tr>

                <!-- PAGE NAME THIS IS ON EVERY PAGE  -->
                <tr>
                    <td colspan="3" style="text-align: center;">Old Matches</td>
                </tr>

                <!--ADD IMAGE TO TABLE THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/whistle2.png" /></td>
                </tr>

                <!--HOME BUTTON   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="homeButton" runat="server" Text="Home" Width="150px" OnClick="homeButton_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

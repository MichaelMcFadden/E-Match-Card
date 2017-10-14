<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RefereeMatchCard.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
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

    <form id="form1" runat="server">
        <div>
            <table align="center" cellpadding="4" cellspacing="2" style="border: 1px solid #999999; font-family: Century">

                <!-- APP NAME HEADER THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">E Match Card</td>
                </tr>

                <!-- PAGE NAME THIS IS ON EVERY PAGE  -->
                <tr>
                    <td colspan="3" style="text-align: center;" class="auto-style2">Home</td>
                </tr>

                <!--ADD IMAGE TO TABLE THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/whistle2.png" /></td>
                </tr>

                <!-- CREATE NEW MATCH BUTTON  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="createNewMatchButton" runat="server" Text="CREATE NEW MATCH" Width="150px" OnClick="createNewMatchButton_Click" /></td>
                </tr>

                <!-- CREATE CURRENT MATCH BUTTON  -->
                <<tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="currentMatchButton" runat="server" Text="CURRENT MATCH" CssClass="auto-style1" Width="150px" OnClick="currentMatchButton_Click" /></td>
                </tr>

                <!-- CREATE ARCHIVE BUTTON  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="oldMatchesButton" runat="server" Text="ARCHIVE" Width="150px" OnClick="oldMatchesButton_Click" /></td>
                </tr>


                <!-- CREATE SETTINGS BUTTON  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="settingsButton" runat="server" Text="SETTINGS" Width="150px" OnClick="settingsButton_Click" /></td>
                </tr>

                <!-- CREATE LOGOUT BUTTON  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="LogOutButton1" runat="server" Text="LOGOUT" Width="150px" OnClick="LogOutButton1_Click" />
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

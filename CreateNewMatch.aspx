<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateNewMatch.aspx.cs" Inherits="RefereeMatchCard.CreateNewMatch" %>

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
    <form id="form1" runat="server">
        <div>
            <table align="center" cellpadding="4" cellspacing="2" style="border: 1px solid #999999; font-family: Century">

                <!-- APP NAME HEADER THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">E Match Card</td>
                </tr>

                <!-- PAGE NAME THIS IS ON EVERY PAGE  -->
                <tr>
                    <td colspan="3" style="text-align: center;">Create New Match</td>
                </tr>

                <!--ADD IMAGE TO TABLE THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/whistle2.png" /></td>
                </tr>

                <!-- ADD CALENDER   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Label ID="MatchDateLabel" runat="server" Text="Match Date & Time" />
                        <asp:TextBox ID="MatchDateTextBox" runat="server" TextMode="DateTimeLocal" placeholder=" Enter Date & Time"></asp:TextBox>
                    </td>
                </tr>

                <!--  ADD DROP DOWN LIST FOR LEAGUE  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Label ID="LeagueLabel" runat="server" Text="League">
                        </asp:Label>
                        <asp:DropDownList ID="LeagueDropDown" runat="server" DataTextField="Name" DataValueField="LeagueID" OnSelectedIndexChanged="LeagueDropDown_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </td>
                </tr>

                <!--  ADD DROP DOWN LIST FOR VENUE  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Label ID="VenueLabel" runat="server" Text="Venue">
                        </asp:Label>
                        <asp:DropDownList ID="VenueDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="VenueID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:leagueFixtureConnectionString %>" SelectCommand="SELECT [VenueID], [Name] FROM [Venue]"></asp:SqlDataSource>
                    </td>
                </tr>

                <!-- HOME TEAM-->

                <!-- ADD DROP DOWN LIST FOR HOME TEAM   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Label ID="HomeTeamLabel" runat="server" Text="Home Team"></asp:Label>
                        <asp:DropDownList ID="HomeTeamDropDown" runat="server" DataTextField="TeamName" DataValueField="TeamID" OnSelectedIndexChanged="HomeTeamDropDown_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </td>
                </tr>

                <!-- AWAY TEAM-->

                <!--   ADD DROP DOWN LIST FOR AWAY TEAM -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Label ID="AwayTeamLabel" runat="server" Text="Away Team">
                        </asp:Label>
                        <asp:DropDownList ID="AwayTeamDropDown" runat="server" DataTextField="TeamName" DataValueField="TeamID"></asp:DropDownList>
                        <!-- <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:leagueFixtureConnectionString %>" SelectCommand="SELECT DISTINCT [TeamName] FROM [Team]"></asp:SqlDataSource>-->
                    </td>
                </tr>

                <!--  SAVE BUTTON  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="SaveButton" runat="server" Text="Save" Width="150px" OnClick="SaveButton_Click" />
                    </td>
                </tr>

                <!--   LABEL ERROR ON UPLOADOF IMAGE -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>

                <!--  CANCEL BUTTON  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="CancelButton" runat="server" Text="Cancel" Width="150px" OnClick="CancelButton_Click" />
                    </td>
                </tr>

                <!--  HOME BUTTON  -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="homeButton" runat="server" Text="Home" Width="150px" OnClick="homeButton_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

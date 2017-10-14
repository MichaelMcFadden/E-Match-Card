<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentMatch.aspx.cs" Inherits="RefereeMatchCard.CurrentMatch" %>

<%@ PreviousPageType VirtualPath="~/CreateNewMatch.aspx" %>
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

        .TableCSS {
            border-style: none;
            background-color: #3BA0D8;
            width: 70%;
        }

        .TableHeader {
            background-color: #66CCFF;
            color: #0066FF;
            font-size: medium;
            font-family: Verdana;
        }

        .TableData {
            background-color: #82C13E;
            color: #fff;
            font-family: Courier New;
            font-size: small;
            font-weight: bold;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <div id='container' style='width: 100%;'>
            <table align="center" width="70%" cellpadding="4" cellspacing="2" style="border: 1px solid #999999; font-family: Century">

                 <!-- APP NAME HEADER THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">E Match Card</td>
                </tr>

                <!-- PAGE NAME THIS IS ON EVERY PAGE  -->
                <tr>
                    <td colspan="3" style="text-align: center;">Current Match</td>
                </tr>

                 <!--ADD IMAGE TO TABLE THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/whistle2.png" Width="30%" Height="30%" /></td>
                </tr>

                <!--  SET UP TWO COLUMNS FOR HOME & AWAY TEAMS -->
                <tr>
                    <td width="50%" style="text-align: center;">Home Team</td>
                    <td width="5px" rowspan="8" style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999"></td>
                    <td width="50%" style="text-align: center;">Away Team</td>

                </tr>

                <!-- HOME & AWAY TEAM LABELS ROW  -->
                <tr>
                    <td width="50%" style="text-align: center;">
                        <asp:Label ID="HomeTeamNameLabel" runat="server" Text="Name of Away Team from previous page"></asp:Label>
                    </td>
                    <td width="50%" style="text-align: center;">
                        <asp:Label ID="AwayTeamNameLabel" runat="server" Text="Name of Away Team from previous page"></asp:Label>
                    </td>
                </tr>

                <!-- HOME & AWAY TEAM CHECKBOXLIST ROW  -->
                <tr>
                    <!-- home team list of players  -->
                    <td width="50%" style="text-align: center;">
                        <asp:CheckBoxList ID="HomeTeamPlayersCheckBoxList1" runat="server" DataSourceID="SqlDataSource1_HomeTeamCkeckboxList" DataTextField="Name" DataValueField="Name"></asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource1_HomeTeamCkeckboxList" runat="server" ConnectionString="<%$ ConnectionStrings:leagueFixtureConnectionString %>" SelectCommand="SELECT [Name] FROM [Player] WHERE ([TeamID] = @TeamID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="TeamID" SessionField="homeTeamID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>

                    <!-- away team list of players -->
                    <td width="50%" style="text-align: center;">
                        <asp:CheckBoxList ID="AwayTeamPlayersCheckBoxList1" runat="server" DataSourceID="SqlDataSource1_AwayTeamCkeckboxList" DataTextField="Name" DataValueField="Name"></asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource1_AwayTeamCkeckboxList" runat="server" ConnectionString="<%$ ConnectionStrings:leagueFixtureConnectionString %>" SelectCommand="SELECT [Name] FROM [Player] WHERE ([TeamID] = @TeamID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="TeamID" SessionField="awayTeamID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

                <!--SELECT ALL PLAYERS -->

                <!--HOME TEAM PLAYERS-->
                <tr>
                    <td width="50%" style="text-align: center;">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SELECT ALL" />
                    </td>

                <!--HOME TEAM PLAYERS-->
                    <td width="50%" style="text-align: center;">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="SELECT ALL" />
                    </td>
                </tr>

                <!--save button -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="saveButton" runat="server" Text="SAVE PLAYERS" OnClick="saveButton_Click" />
                    </td>
                </tr>

                <!--home button -->
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

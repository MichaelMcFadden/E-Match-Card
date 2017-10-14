<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentMatchEditPlayers.aspx.cs" Inherits="RefereeMatchCard.CurrentMatchEditPlayers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        li {
            border-style: solid;
            border-width: 1px;
        }

        ul li {
            text-align: left;
            font-size: large;
            margin: 5px;
        }

        .auto-style1 {
            width: 50%;
        }

        .auto-style2 {
            font-size: large;
            font-weight: 400;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div>

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
                    <td style="text-align: center;" class="auto-style1">Home Team</td>
                    <td width="5px" rowspan="8" style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999"></td>
                    <td width="50%" style="text-align: center;">Away Team</td>
                </tr>

                <!-- HOME & AWAY TEAM LABELS ROW  -->
                <tr>
                    <td style="text-align: center;" class="auto-style1">
                        <asp:Label ID="HomeTeamNameLabel" runat="server" Text="Name of Home Team from previous page"></asp:Label>
                    </td>
                    <td width="50%" style="text-align: center;">
                        <asp:Label ID="AwayTeamNameLabel" runat="server" Text="Name of Away Team from previous page"></asp:Label>
                    </td>
                </tr>

                <!-- HOME & AWAY TEAM LISTVIEW ROW  -->
                <tr>

                    <!-- home team list of players selected -->
                    <td style="text-align: center;" class="auto-style1">
                        <asp:ListView ID="HomePlayersSelectedListView1" runat="server" DataKeyNames="FixturePlayerID" DataSourceID="SqlDataSource1_HomePlayersSelected">
                            <AlternatingItemTemplate>
                                <li style="background-color: #FFF8DC;">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    <br />
                                    Number:
                            <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                                    <br />
                                    Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:Label ID="YellowCardLabel" runat="server" Text='<%# Eval("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:Label ID="RedCardLabel" runat="server" Text='<%# Eval("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:Label ID="GoalLabel" runat="server" Text='<%# Eval("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </li>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <li style="background-color: #008A8C; color: #FFFFFF;">Name:
                            <asp:TextBox ID="NameTextBox" Font-Size="XX-Large" Font-Bold="true" runat="server" Text='<%# Bind("Name") %>' Enabled="False" ReadOnly="True" />
                                    <br />
                                    Number:
                            <asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' />
                                    <br />
                                    Status:
                            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:TextBox ID="YellowCardTextBox" runat="server" Text='<%# Bind("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:TextBox ID="RedCardTextBox" runat="server" Text='<%# Bind("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:TextBox ID="GoalTextBox" runat="server" Text='<%# Bind("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel1" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </li>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                No data was returned.
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <li style="">Name:
                            <asp:TextBox ID="NameTextBox" Font-Size="XX-Large" Font-Bold="true" runat="server" Text='<%# Bind("Name") %>' />
                                    <br />
                                    Number:
                            <asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' />
                                    <br />
                                    Status:
                            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:TextBox ID="YellowCardTextBox" runat="server" Text='<%# Bind("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:TextBox ID="RedCardTextBox" runat="server" Text='<%# Bind("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:TextBox ID="GoalTextBox" runat="server" Text='<%# Bind("Goal") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </li>
                            </InsertItemTemplate>
                            <ItemSeparatorTemplate>
                                <br />
                            </ItemSeparatorTemplate>
                            <ItemTemplate>
                                <li style="background-color: #DCDCDC; color: #000000;">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    <br />
                                    Number:
                            <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                                    <br />
                                    Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:Label ID="YellowCardLabel" runat="server" Text='<%# Eval("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:Label ID="RedCardLabel" runat="server" Text='<%# Eval("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:Label ID="GoalLabel" runat="server" Text='<%# Eval("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <li runat="server" id="itemPlaceholder" />
                                </ul>
                                <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                </div>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <li style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    <br />
                                    Number:
                            <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                                    <br />
                                    Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:Label ID="YellowCardLabel" runat="server" Text='<%# Eval("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:Label ID="RedCardLabel" runat="server" Text='<%# Eval("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:Label ID="GoalLabel" runat="server" Text='<%# Eval("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </li>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1_HomePlayersSelected" runat="server" ConnectionString="<%$ ConnectionStrings:leagueFixtureConnectionString %>" DeleteCommand="DELETE FROM [FixturePlayer] WHERE [FixturePlayerID] = @FixturePlayerID" InsertCommand="INSERT INTO [FixturePlayer] ([Name], [Number], [Status], [YellowCard], [RedCard], [Goal]) VALUES (@Name, @Number, @Status, @YellowCard, @RedCard, @Goal)" SelectCommand="SELECT [Name], [Number], [Status], [YellowCard], [RedCard], [Goal], [FixturePlayerID] FROM [FixturePlayer] WHERE (([TeamID] = @TeamID) AND ([FixtureID] = @FixtureID))" UpdateCommand="UPDATE [FixturePlayer] SET [Name] = @Name, [Number] = @Number, [Status] = @Status, [YellowCard] = @YellowCard, [RedCard] = @RedCard, [Goal] = @Goal WHERE [FixturePlayerID] = @FixturePlayerID">
                            <DeleteParameters>
                                <asp:Parameter Name="FixturePlayerID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Number" Type="Int32" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="YellowCard" Type="Int32" />
                                <asp:Parameter Name="RedCard" Type="Int32" />
                                <asp:Parameter Name="Goal" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="TeamID" SessionField="homeTeamID" Type="Int32" />
                                <asp:SessionParameter Name="FixtureID" SessionField="fixtureID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Number" Type="Int32" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="YellowCard" Type="Int32" />
                                <asp:Parameter Name="RedCard" Type="Int32" />
                                <asp:Parameter Name="Goal" Type="Int32" />
                                <asp:Parameter Name="FixturePlayerID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>

                    <!-- away team list of players selected -->
                    <td width="50%" style="text-align: center;">
                        <asp:ListView ID="AwayPlayersSelectedListView1" runat="server" DataKeyNames="FixturePlayerID" DataSourceID="SqlDataSource1_AwayPlayersSelected">
                            <AlternatingItemTemplate>
                                <li style="background-color: #FFF8DC;">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    <br />
                                    Number:
                            <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                                    <br />
                                    Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:Label ID="YellowCardLabel" runat="server" Text='<%# Eval("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:Label ID="RedCardLabel" runat="server" Text='<%# Eval("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:Label ID="GoalLabel" runat="server" Text='<%# Eval("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </li>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <li style="background-color: #008A8C; color: #FFFFFF;">Name:
                            <asp:TextBox ID="NameTextBox" Font-Size="X-Large" Font-Bold="true" runat="server" Text='<%# Bind("Name") %>' Enabled="False" ReadOnly="True" />
                                    <br />
                                    Number:
                            <asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' />
                                    <br />
                                    Status:
                            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:TextBox ID="YellowCardTextBox" runat="server" Text='<%# Bind("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:TextBox ID="RedCardTextBox" runat="server" Text='<%# Bind("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:TextBox ID="GoalTextBox" runat="server" Text='<%# Bind("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel1" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </li>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                No data was returned.
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <li style="">Name:
                            <asp:TextBox ID="NameTextBox" Font-Size="X-Large" Font-Bold="true" runat="server" Text='<%# Bind("Name") %>' />
                                    <br />
                                    Number:
                            <asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' />
                                    <br />
                                    Status:
                            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:TextBox ID="YellowCardTextBox" runat="server" Text='<%# Bind("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:TextBox ID="RedCardTextBox" runat="server" Text='<%# Bind("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:TextBox ID="GoalTextBox" runat="server" Text='<%# Bind("Goal") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </li>
                            </InsertItemTemplate>
                            <ItemSeparatorTemplate>
                                <br />
                            </ItemSeparatorTemplate>
                            <ItemTemplate>
                                <li style="background-color: #DCDCDC; color: #000000;">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    <br />
                                    Number:
                            <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                                    <br />
                                    Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:Label ID="YellowCardLabel" runat="server" Text='<%# Eval("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:Label ID="RedCardLabel" runat="server" Text='<%# Eval("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:Label ID="GoalLabel" runat="server" Text='<%# Eval("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <li runat="server" id="itemPlaceholder" />
                                </ul>
                                <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                </div>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <li style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">Name:
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                    <br />
                                    Number:
                            <asp:Label ID="NumberLabel" runat="server" Text='<%# Eval("Number") %>' />
                                    <br />
                                    Status:
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                                    <br />
                                    YellowCard:
                            <asp:Label ID="YellowCardLabel" runat="server" Text='<%# Eval("YellowCard") %>' />
                                    <br />
                                    RedCard:
                            <asp:Label ID="RedCardLabel" runat="server" Text='<%# Eval("RedCard") %>' />
                                    <br />
                                    Goal:
                            <asp:Label ID="GoalLabel" runat="server" Text='<%# Eval("Goal") %>' />
                                    <br />
                                    FixturePlayerID:
                            <asp:Label ID="FixturePlayerIDLabel" runat="server" Text='<%# Eval("FixturePlayerID") %>' />
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </li>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1_AwayPlayersSelected" runat="server" ConnectionString="<%$ ConnectionStrings:leagueFixtureConnectionString %>" DeleteCommand="DELETE FROM [FixturePlayer] WHERE [FixturePlayerID] = @FixturePlayerID" InsertCommand="INSERT INTO [FixturePlayer] ([Name], [Number], [Status], [YellowCard], [RedCard], [Goal]) VALUES (@Name, @Number, @Status, @YellowCard, @RedCard, @Goal)" SelectCommand="SELECT [Name], [Number], [Status], [YellowCard], [RedCard], [Goal], [FixturePlayerID] FROM [FixturePlayer] WHERE (([TeamID] = @TeamID) AND ([FixtureID] = @FixtureID))" UpdateCommand="UPDATE [FixturePlayer] SET [Name] = @Name, [Number] = @Number, [Status] = @Status, [YellowCard] = @YellowCard, [RedCard] = @RedCard, [Goal] = @Goal WHERE [FixturePlayerID] = @FixturePlayerID">
                            <DeleteParameters>
                                <asp:Parameter Name="FixturePlayerID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Number" Type="Int32" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="YellowCard" Type="Int32" />
                                <asp:Parameter Name="RedCard" Type="Int32" />
                                <asp:Parameter Name="Goal" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="TeamID" SessionField="awayTeamID" Type="Int32" />
                                <asp:SessionParameter Name="FixtureID" SessionField="fixtureID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="Number" Type="Int32" />
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="YellowCard" Type="Int32" />
                                <asp:Parameter Name="RedCard" Type="Int32" />
                                <asp:Parameter Name="Goal" Type="Int32" />
                                <asp:Parameter Name="FixturePlayerID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

                <!--save button -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="FinishMatchCardButton1" Height="50px" BackColor="#33cc33" runat="server" Text="FINISH MATCH CARD" Width="40%" OnClick="FinishMatchCardButton1_Click" />
                    </td>
                </tr>

                <!--home button -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="homeButton" Height="50px" runat="server" Text="HOME" BackColor="#9966ff" Width="40%" OnClick="homeButton_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

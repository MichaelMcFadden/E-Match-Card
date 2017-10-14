<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinishMatchCard.aspx.cs" Inherits="RefereeMatchCard.FinishMatchCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 40px;
        }

        .auto-style2 {
            height: 69px;
            background-color: chartreuse;
            font-size: large;
            font-weight: 600;
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
                    <td colspan="3" style="text-align: center;" class="auto-style2">Finish Match Card</td>
                </tr>

                <!--ADD IMAGE TO TABLE THIS IS ON EVERY PAGE   -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/whistle2.png" Width="33%" Height="30%" /></td>
                </tr>

                <!--  SET UP TWO COLUMNS FOR HOME & AWAY TEAMS -->
                <tr>
                    <td width="50%" style="text-align: center;" class="auto-style1">Home Team</td>
                    <td width="5px" rowspan="8" style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999"></td>
                    <td width="50%" style="text-align: center;" class="auto-style1">Away Team</td>
                </tr>

                <!-- HOME & AWAY TEAM LABELS ROW  -->
                <tr>
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:Label ID="HomeTeamNameLabel" runat="server" Text="Name of Home Team from previous page"></asp:Label>
                    </td>
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:Label ID="AwayTeamNameLabel" runat="server" Text="Name of Away Team from previous page"></asp:Label>
                    </td>
                </tr>

                <!-- ADD LABEL & TEXTBOX FOR HOME TEAM SCORE  -->
                <tr>
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:Label ID="HomeTeamScoreLabel" runat="server" Text="Home Team Score"></asp:Label>
                        <asp:TextBox type="number" pattern="[0-9]" ID="HomeTeamScoreTextBox" runat="server" placeholder=" Home Score 0-50"></asp:TextBox>
                    </td>

                    <!-- ADD LABEL & TEXTBOX FOR AWAY TEAM SCORE  -->
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:Label ID="AwayTeamScoreLabel" runat="server" Text="Away Team Score"></asp:Label>
                        <asp:TextBox type="number" pattern="[0-9]" ID="AwayTeamScoreTextBox" runat="server" placeholder=" Away Score"></asp:TextBox>
                    </td>
                </tr>

                <!-- ADD VALIDATION FOR HOME TEAM SCORE  -->
                <tr>
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:RangeValidator runat="server" Type="Integer"
                            MinimumValue="0" MaximumValue="50" ControlToValidate="HomeTeamScoreTextBox"
                            ErrorMessage="Enter 0 to 50" />
                    </td>

                    <!-- ADD VALIDATION FOR AWAY TEAM SCORE  -->
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:RangeValidator runat="server" Type="Integer"
                            MinimumValue="0" MaximumValue="50" ControlToValidate="AwayTeamScoreTextBox"
                            ErrorMessage="Enter 0 to 50" />
                    </td>
                </tr>

                <!--   BROWSE BUTTON TO SEARCH FOR IMAGES ON DEVICE -->
                <tr>
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:FileUpload ID="FileUpload1" runat="server" Height="70px" Width="220px" />
                    </td>
                    <td width="50%" style="text-align: center;" class="auto-style1">
                        <asp:FileUpload ID="FileUpload2" runat="server" Height="70px" Width="220px" />
                    </td>
                </tr>

                <!--   ADDING A MATCH REPORT -->
                <tr>
                    <td colspan="3" style="text-align: center;" class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Match Report"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;" class="auto-style1">
                        <asp:TextBox ID="ReportTextBox2" runat="server" placeholder=" Enter Match Report Here" Height="41px" Width="281px"></asp:TextBox>
                    </td>
                </tr>

                <!--save button -->
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="FinishMatchCardButton1" Height="50px" BackColor="#33cc33" runat="server" Text="SAVE MATCH CARD" Width="40%" OnClick="FinishMatchCardButton1_Click" />
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

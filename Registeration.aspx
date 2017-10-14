<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="RefereeMatchCard.Registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registeration Page</title>
    <style type="text/css">
        .style1 {
            color: #FF0066;
            text-decoration: underline;
            font-weight: bold;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <table align="center" cellpadding="4" cellspacing="2" style="border: 1px solid #999999; font-family: Century">

            <!-- APP NAME HEADER THIS IS ON EVERY PAGE   -->
            <tr>
                <td colspan="3" style="text-align: center;">E Match Card</td>
            </tr>
            <tr>

                <!-- PAGE NAME THIS IS ON EVERY PAGE  -->
                <tr>
                    <td colspan="3" style="text-align: center;">Registeration Form</td>
                </tr>

                <!--ADD IMAGE TO TABLE THIS IS ON EVERY PAGE   -->
                <td colspan="3" style="text-align: center;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/whistle2.png" /></td>
            </tr>

            <!--REGISTERATION DETAILS  -->
            <tr>
                <td width="150px">First Name</td>
                <td width="5px" rowspan="8" style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999"></td>
                <td width="200px">
                    <asp:TextBox ID="firstnameTextBox" Text="" runat="server" placeholder=" Enter First Name" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="firstnameTextBox" runat="server" />
                </td>
            </tr>

            <tr>
                <td>Last Name</td>
                <td>
                    <asp:TextBox ID="lastnameTextBox" Text="" runat="server" placeholder=" Enter Last Name" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="lastnameTextBox" runat="server" />
                </td>
            </tr>

            <tr>
                <td>Phone</td>
                <td>
                    <asp:TextBox ID="phoneTextBox" Text="" runat="server" placeholder=" Enter Phone Number" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="phoneTextBox" runat="server" />
                </td>
            </tr>

            <tr>
                <td>E-mail</td>
                <td>
                    <asp:TextBox ID="emailTextBox" Text="" runat="server" placeholder=" Enter Email" />
                </td>
            </tr>

            <tr>
                <td>Username </td>
                <td>
                    <asp:TextBox ID="usernameTextBox" Text="" runat="server" placeholder=" Enter Username" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="usernameTextBox"
                        runat="server" />
                </td>
            </tr>

            <tr>
                <td>Password </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" Text="" runat="server" placeholder=" Enter Password" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="passwordTextBox"
                        runat="server" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </td>
            </tr>


            <!--REGISTERATION, CLEAR AND HOME BUTTONS   -->
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="registerButton" Text="REGISTER" runat="server" OnClick="registerButton_Click" Width="80px" />
                    <asp:Button ID="clearButton" Text="CLEAR" runat="server" OnClick="clearButton_Click" Style="margin-left: 31px" Width="80px" />
                    <asp:Button ID="HomeButton1" runat="server" Text="HOME" OnClick="HomeButton1_Click" Style="margin-left: 31px" Width="80px" />
                </td>
            </tr>
        </table>
    </form>
</body>

</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RefereeMatchCard.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
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

            <!-- PAGE NAME THIS IS ON EVERY PAGE  -->
            <tr>
                <td colspan="3" style="text-align: center;" class="auto-style2">Login</td>
            </tr>

            <!--ADD IMAGE TO TABLE THIS IS ON EVERY PAGE   -->
            <tr>
                <td colspan="3" style="text-align: center;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/whistle2.png" /></td>
            </tr>

            <!--USERNAME TEXTBOX AND VALIDATOR   -->
            <tr>
                <td width="100px">Username</td>
                <td width="5px" rowspan="8" style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999"></td>
                <td width="200px">
                    <asp:TextBox ID="usernameTextBox" Text="" runat="server" placeholder=" Enter Username" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlToValidate="usernameTextBox"
                        Display="Dynamic"
                        ForeColor="Red"
                        ErrorMessage="Cannot be empty."
                        runat="server" />
                </td>
            </tr>

            <!--PASSWORD TEXTBOX AND VALIDATOR   -->
            <tr>
                <td>Password </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" TextMode="Password" Text="" runat="server" placeholder=" Enter Passworde" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        ControlToValidate="passwordTextBox"
                        ForeColor="Red"
                        ErrorMessage="Cannot be empty."
                        runat="server" />
                </td>
            </tr>

            <!--LOGIN BUTTON  -->
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="submitButton" Width="100px" Text="LOG IN" runat="server" OnClick="submitButton_Click" />

                </td>
            </tr>

            <!--REGISTERATION BUTTON  -->
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="registerButton" Text="REGISTER" runat="server" OnClick="registerButton_Click" />

                </td>
            </tr>
        </table>
    </form>
</body>
</html>

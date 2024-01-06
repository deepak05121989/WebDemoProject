<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.Master" CodeBehind="Register.aspx.cs" Inherits="WebDemoProject.Register" %>

<asp:Content ID="ContentHeader" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
    .auto-style1 {
        width: 100%;
        border: 2px solid #66FF33;
        background-color: #C0C0C0;
    }
    .auto-style2 {
        height: 51px;
            margin-left: 40px;
        }
        .auto-style3 {
            height: 112px;
        }
</style>
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
       <div>

    <table cellpadding="11" cellspacing="8" class="auto-style1">
        <tr>
            <td>First Nme</td>
            <td>
                <asp:TextBox ID="textFirstName" runat="server" Height="32px" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textFirstName" ErrorMessage="First name can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td>
                <asp:TextBox ID="textLastName" runat="server" Height="32px" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textLastName" ErrorMessage="Last name can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>User Id</td>
            <td>
                <asp:TextBox ID="textUserId" runat="server" Height="32px" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textUserId" ErrorMessage="User Id can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:TextBox ID="textPssword" runat="server" Height="32px" TextMode="Password" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="textPssword" ErrorMessage="Password can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td>
                <asp:TextBox ID="textConfirmPssword" runat="server" Height="32px" TextMode="Password" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="textConfirmPssword" ErrorMessage="Confirm Password can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="textPssword" ControlToValidate="textConfirmPssword" ErrorMessage="Password not match" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>Email Id</td>
            <td>
                <asp:TextBox ID="textEmail" runat="server" Height="32px" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="textEmail" ErrorMessage="Email can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="email Id not in correct format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Mobile</td>
            <td>
                <asp:TextBox ID="textMobile" runat="server" Height="32px" Width="381px" OnTextChanged="textMobile_TextChanged"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="textMobile" ErrorMessage="Mobile can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textMobile" ErrorMessage="Mobole no should be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Address</td>
            <td class="auto-style3">
                <asp:TextBox ID="textAddress" runat="server" Height="76px" TextMode="MultiLine" Width="452px"></asp:TextBox>
            </td>
            <td class="auto-style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="textAddress" ErrorMessage="Address can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>Pin Code</td>
            <td>
                <asp:TextBox ID="textPinCode" runat="server" Height="32px" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="textPinCode" ErrorMessage="Pin code can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="textPinCode" ErrorMessage="Pin no should be 6 digit" ForeColor="Red" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">State</td>
            <td class="auto-style2">
                <asp:DropDownList ID="dropState" runat="server" Height="30px" Width="217px">
                    <asp:ListItem>====Select State====</asp:ListItem>
                    <asp:ListItem>Delhi</asp:ListItem>
                    <asp:ListItem>Utterpradesh</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td>City</td>
            <td>
                <asp:DropDownList ID="dropCity" runat="server" Height="30px" Width="217px">
                    <asp:ListItem>====Select City====</asp:ListItem>
                    <asp:ListItem>Laxminagar</asp:ListItem>
                    <asp:ListItem>Ghaziabad</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <asp:RadioButtonList ID="radioGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Age</td>
            <td>
                <asp:TextBox ID="textAge" runat="server" Height="32px" Width="381px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="textAge" ErrorMessage="Age can't be empty" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="textAge" ErrorMessage="Age should b e18 to 60" ForeColor="Red" MaximumValue="60" MinimumValue="18" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" BackColor="#66FF33" Height="29px" Text="Register" Width="89px" OnClick="Button1_Click" />
            </td>
            <td>
                <asp:Label ID="lblErrorMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            </td>
        </tr>
    </table>

</div>
</asp:Content>



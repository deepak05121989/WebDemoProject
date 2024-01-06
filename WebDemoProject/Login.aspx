<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.Master" CodeBehind="Login.aspx.cs" Inherits="WebDemoProject.Login" %>

<asp:Content ID="ContentHeader" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style3 {
            width: 50%;
            border: 2px solid #00ff00;
            background-color: #c0c0c0;
        }
        .auto-style4 {
            height: 48px;
        }
</style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>


    <table cellpadding="11" cellspacing="11" class="auto-style3">
        <tr>
            <td colspan="2" style="text-align: center; font-size: xx-large; text-decoration: underline; color: #808000;">Login </td>
        </tr>
        <tr>
            <td class="auto-style4">User Id</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox1" runat="server" Height="24px" Width="130px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Pasword</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="24px" Width="130px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="Button1" runat="server" BackColor="#66FF33" Height="29px" Text="Login" Width="89px" OnClick="Button1_Click" /></td>
            <td><asp:Label ID="lblErrorMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="text-align: right">
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Register.aspx">Click Here for Registration</asp:LinkButton>
            </td>
        </tr>
    </table>
</div>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebDemoProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
    <asp:Image ID="Image1" runat="server" Height="166px" ImageUrl="~/images/eshopping.jpg" Width="1263px" />
</div>
<div>

    <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Medium" ForeColor="#284E98" Height="21px" Orientation="Horizontal" RenderingMode="Table" StaticSubMenuIndent="10px" Width="305px">
        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicMenuStyle BackColor="#B5C7DE" />
        <DynamicSelectedStyle BackColor="#507CD1" />
        <Items>
            <asp:MenuItem NavigateUrl="~/Home.aspx" Text="Home" Value="Home"></asp:MenuItem>
            <asp:MenuItem Text="About" Value="About" NavigateUrl="~/About.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Contact" Value="Contact" NavigateUrl="~/Contact.aspx"></asp:MenuItem>
            <asp:MenuItem Text="Login" Value="Login" NavigateUrl="~/Login.aspx"></asp:MenuItem>
        </Items>
        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticSelectedStyle BackColor="#507CD1" />
    </asp:Menu>

</div>
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
<div style="height: 53px; background-color: #000000; color: #FFFFFF;">

    Foooter</div>
        </div>
    </form>
</body>
</html>

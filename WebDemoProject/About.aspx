<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebDemoProject.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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

       <h1>Welcome to About Page</h1>

     </div>
     <div style="height: 53px; background-color: #000000; color: #FFFFFF;">

         Foooter</div>
 </form>
</body>
</html>

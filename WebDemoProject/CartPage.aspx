<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="WebDemoProject.CartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <div>

            <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>

        </div>

    </div>
</asp:Content>

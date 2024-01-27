<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WebDemoProject.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 2px solid #00ff00;
            background-color: #c0c0c0;
        }
        .auto-style2 {
            width: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <table cellpadding="11" cellspacing="15" class="auto-style1">
            <tr>
                <td rowspan="6" class="auto-style2">
                    <asp:Image ID="Image1" runat="server" Height="272px" Width="388px" />
                </td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td>
                    <asp:Label ID="lblProName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Product MRP</td>
                <td>
                    <asp:Label ID="lblProMrp" runat="server" Font-Strikeout="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Product Price</td>
                <td>
                    <asp:Label ID="lblProPrice" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Product Description</td>
                <td>
                    <asp:Label ID="lblProDesc" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:Button ID="Button1" runat="server" BackColor="Yellow" BorderColor="#CCCC00" Height="38px" Text="Add To Cart" Width="101px" OnClick="Button1_Click" /></td>
                <td>
                    <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>

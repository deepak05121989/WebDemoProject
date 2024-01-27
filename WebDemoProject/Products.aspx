<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebDemoProject.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 4px solid #00FFFF;
            background-color: #c0c0c0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>

        <asp:DataList ID="DataList1" runat="server" DataKeyField="pro_id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <table cellpadding="10" cellspacing="18" class="auto-style1">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="123px" ImageUrl='<%# Eval("pro_image") %>'
                                PostBackUrl='<%# Eval("pro_id","ProductDetails.aspx?ProId={0}") %>' Width="188px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("pro_name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>MRP:
                            <asp:Label ID="Label2" runat="server" Font-Strikeout="True" Text='<%# Eval("pro_mrp") %>'></asp:Label>
                            &nbsp;Price:<asp:Label ID="Label3" runat="server" Text='<%# Eval("pro_price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" BackColor="Yellow" BorderColor="#CCCC00" Height="38px" Text="Add To Cart" Width="101px" PostBackUrl='<%# Eval("pro_id","CartPage.aspx?ProId={0}") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestDBConnection %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>

    </div>
</asp:Content>

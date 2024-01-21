<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="WebDemoProject.Admin.ManageProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 3px solid #000080;
            background-color: #c0c0c0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="6" cellspacing="11" class="auto-style1">
                <tr>
                    <td>Product Name</td>
                    <td>
                        <asp:TextBox ID="txtProductName" runat="server" Height="32px" Width="313px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Product Category</td>
                    <td>
                        <asp:TextBox ID="txtProductCatg" runat="server" Height="32px" Width="313px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Product MRP</td>
                    <td>
                        <asp:TextBox ID="txtProductMrp" runat="server" Height="32px" Width="313px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Product Price</td>
                    <td>
                        <asp:TextBox ID="txtProductPrice" runat="server" Height="32px" Width="313px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Product Description</td>
                    <td>
                        <asp:TextBox ID="txtProductDesc" runat="server" Height="77px" TextMode="MultiLine" Width="351px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Product Image</td>
                    <td>
                        <asp:FileUpload ID="fileUploadroductImg" runat="server" Height="38px" Width="348px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Product" />
                    </td>
                    <td>
                        <asp:Label ID="lblErrormessage" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gridViewProductDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pro_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="pro_id" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="pro_id" />
                                <asp:BoundField DataField="pro_name" HeaderText="pro_name" SortExpression="pro_name" />
                                <asp:BoundField DataField="pro_catg" HeaderText="pro_catg" SortExpression="pro_catg" />
                                <asp:BoundField DataField="pro_mrp" HeaderText="pro_mrp" SortExpression="pro_mrp" />
                                <asp:BoundField DataField="pro_price" HeaderText="pro_price" SortExpression="pro_price" />
                                <asp:BoundField DataField="pro_desc" HeaderText="pro_desc" SortExpression="pro_desc" />
                                <asp:TemplateField HeaderText="Product Image" SortExpression="pro_image">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pro_image") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="image1" runat="server" ImageUrl='<%# Bind("pro_image") %>' Height="100px" Width="100px"></asp:Image>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TestDBConnection %>" DeleteCommand="DELETE FROM [Products] WHERE [pro_id] = @pro_id" InsertCommand="INSERT INTO [Products] ([pro_name], [pro_catg], [pro_mrp], [pro_price], [pro_desc], [pro_image]) VALUES (@pro_name, @pro_catg, @pro_mrp, @pro_price, @pro_desc, @pro_image)" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [pro_name] = @pro_name, [pro_catg] = @pro_catg, [pro_mrp] = @pro_mrp, [pro_price] = @pro_price, [pro_desc] = @pro_desc, [pro_image] = @pro_image WHERE [pro_id] = @pro_id">
                            <DeleteParameters>
                                <asp:Parameter Name="pro_id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="pro_name" Type="String" />
                                <asp:Parameter Name="pro_catg" Type="String" />
                                <asp:Parameter Name="pro_mrp" Type="Decimal" />
                                <asp:Parameter Name="pro_price" Type="Decimal" />
                                <asp:Parameter Name="pro_desc" Type="String" />
                                <asp:Parameter Name="pro_image" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="pro_name" Type="String" />
                                <asp:Parameter Name="pro_catg" Type="String" />
                                <asp:Parameter Name="pro_mrp" Type="Decimal" />
                                <asp:Parameter Name="pro_price" Type="Decimal" />
                                <asp:Parameter Name="pro_desc" Type="String" />
                                <asp:Parameter Name="pro_image" Type="String" />
                                <asp:Parameter Name="pro_id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>

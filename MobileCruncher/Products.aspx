<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MobileCruncher.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="ProductTiles" runat="server" DataSourceID="ProductsList" OnItemCommand="ProductTiles_ItemCommand">
        <ItemTemplate>
            <div>
                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>'>></asp:Label>
                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'>></asp:Label>
                <asp:Label ID="lblManufacturer" runat="server" Text='<%# Eval("manufacturer") %>'>></asp:Label>
                <asp:Label ID="lblOS" runat="server" Text='<%# Eval("os") %>'>></asp:Label>
                <asp:Label ID="lblImage" runat="server" Text='<%# Eval("image_path") %>'>></asp:Label>
                <asp:Button ID="btnView" runat="server" Text="View" CommandArgument='<%# Eval("Id") %>' /></div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="ProductsList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT p.*, pd.ram, pd.storage_capacity,
        m.name AS manufacturer, os.name AS OS 
        FROM products p JOIN product_details pd ON p.id = pd.product_id 
        JOIN manufacturers m ON pd.manufacturer_id = m.id 
        JOIN operating_systems os ON os.id = pd.os_id"></asp:SqlDataSource>
</asp:Content>

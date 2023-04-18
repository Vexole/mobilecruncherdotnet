<%@ Page Title="MobileCrunchers - Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="MobileCruncher.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <h2 id="title" class="text-center mb-3 mc-color-primary"><%: Title %></h2>
            <div class="container-fluid d-flex flex-wrap">

            <asp:Repeater ID="ProductTiles" runat="server" DataSourceID="ProductsList" OnItemCommand="ProductTiles_ItemCommand">
            <ItemTemplate>
                <div class='py-5 col-4'>
                    <div class='container'>
                        <div>
                            <div class='card p-3 text-wrap d-flex flex-column align-items-center'>
                            <h3 class='text-center mc-color-secondary'>
                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>'>></asp:Label>
                            </h3>
                            <div class='mb-3'>
                                <span class='me-4 badge mc-bg-info'>
                                   <asp:Label ID="lblManufacturer" runat="server" Text='<%# Eval("manufacturer") %>'>></asp:Label>
                                </span>
                                <span class='badge mc-bg-info'>
                                   <asp:Label ID="lblOS" runat="server" Text='<%# Eval("os") %>'>></asp:Label>
                                </span>
                            </div>
                            <asp:Image ID="lblImage" CssClass="lblImage" runat="server" style="height: 200px;" src='<%#"Images/" +Eval("image_path") %>'/>
                             <asp:Label ID="lblPrice" runat="server" CssClass="h4 mc-color-primary mt-3" Text='<%# Eval("price", "{0:C}") %>'>></asp:Label>
                            <div class='d-grid col-6 mx-auto'>
                               <asp:Button ID="btnView" runat="server" Text="View Details" CssClass="btn btn-primary mt-2" CommandArgument='<%# Eval("Id") %>' /></div>
                            </div>
                        </div>
                     </div>
                </div>
            </ItemTemplate>
           </asp:Repeater>


        </div>
        
    <asp:SqlDataSource ID="ProductsList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT p.*, pd.ram, pd.storage_capacity,
        m.name AS manufacturer, os.name AS OS 
        FROM products p JOIN product_details pd ON p.id = pd.product_id 
        JOIN manufacturers m ON pd.manufacturer_id = m.id 
        JOIN operating_systems os ON os.id = pd.os_id"></asp:SqlDataSource>
</asp:Content>

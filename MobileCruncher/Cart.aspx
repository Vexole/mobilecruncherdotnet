<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MobileCruncher.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center my-4">MobileCrunchers - Your Cart</h1>

    <asp:GridView ID="grdViewCartItems" runat="server" class="mx-auto" AutoGenerateColumns="False" OnRowCommand="MyGridView_RowCommand">
        <Columns>
            <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" />
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <%# Eval("Product.Name") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    $<%# Eval("Product.Price") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                   $<%# Convert.ToInt32(Eval("Product.Price")) * Convert.ToInt32(Eval("Quantity")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
            <ItemTemplate>
                <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("Product.Id") %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <div class="d-flex mx-auto w-50 mt-3">
        <div class="ms-auto">
            <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price:"></asp:Label>
            <asp:Label ID="lblTotalAmount" runat="server"></asp:Label>
        </div>
    </div>
    <br />

    <div class="w-50 mx-auto">
        <asp:Button ID="btnCheckout" runat="server" CssClass="d-flex bg-success ms-auto borderr-0 text-white rounded" Text="Checkout" OnClick="btnCheckout_Click" />
    </div>

    
    <br />
    <asp:Label ID="lblNoItem" runat="server" Font-Bold="True" Font-Size="X-Large" Text="No Item in the Cart Yet!"></asp:Label>


    
</asp:Content>

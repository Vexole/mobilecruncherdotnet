<%@ Page Title="MobileCrunchers - Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MobileCruncher.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 id="title" class="text-center mb-3 mc-color-primary"><%: Title %></h2>
    <div class="d-flex flex-column align-items-center">
        <asp:GridView ID="grdViewCartItems" runat="server" AutoGenerateColumns="False" OnRowCommand="MyGridView_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                    <asp:LinkButton ID="btnRemove" runat="server" CssClass="btn btn-secondary btn-sm ms-3" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("Product.Id") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    
        <div class="mt-3">
            <asp:Label ID="lblTotalPrice" runat="server" CssClass="font-weight-bold mc-color-primary" Font-Size="Large" Text="Total Price: $" Font-Bold="True"></asp:Label>
            <asp:Label ID="lblTotalAmount" runat="server" CssClass="mc-color-primary" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
        </div>

        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-primary mt-3 col-md-2" OnClick="btnCheckout_Click" />
    

    
        <br />
        <asp:Label ID="lblNoItem" runat="server" Font-Bold="True" Font-Size="Large" Text="No Item in the Cart Yet!"></asp:Label>
    </div>


    
</asp:Content>

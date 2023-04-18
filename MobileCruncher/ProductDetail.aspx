<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="MobileCruncher.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource ID="ProductDetailDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProductDetails" TypeName="MobileCruncher.Models.ProductDAL">
        <SelectParameters>
            <asp:SessionParameter Name="Id" SessionField="ProductId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h1 class="text-center my-4 mc-color-primary">MobileCrunchers - Product Details</h1>

    <div class="d-flex justify-content-center my-5">
        <asp:Image ID="imgProduct" runat="server" CssClass="product-image me-5" />

        <asp:DetailsView ID="dtlViewProduct" CssClass="p-4" runat="server" AutoGenerateRows="False" DataSourceID="ProductDetailDataSource" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields >
                <asp:BoundField DataField="Name" HeaderText="Name:" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price:" SortExpression="Price" />
                <asp:BoundField DataField="RAM" HeaderText="RAM:" SortExpression="RAM" />
                <asp:BoundField DataField="StorageCapacity" HeaderText="StorageCapacity:" SortExpression="StorageCapacity" />
                <asp:BoundField DataField="ScreenSize" HeaderText="ScreenSize:" SortExpression="ScreenSize" />
                <asp:BoundField DataField="ProcessorType" HeaderText="ProcessorType:" SortExpression="ProcessorType" />
                <asp:BoundField DataField="ProcessorSpeed" HeaderText="ProcessorSpeed:" SortExpression="ProcessorSpeed" />
                <asp:BoundField DataField="OpticalSensorResolution" HeaderText="OpticalSensorResolution:" SortExpression="OpticalSensorResolution" />
                <asp:BoundField DataField="Weight" HeaderText="Weight:" SortExpression="Weight" />
                <asp:BoundField DataField="Dimension" HeaderText="Dimension:" SortExpression="Dimension" />
                <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer:" SortExpression="Manufacturer" />
                <asp:BoundField DataField="OS" HeaderText="OS:" SortExpression="OS" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
    </div>
    <div class="d-flex mx-auto my-3 justify-content-center">
        <asp:DropDownList ID="drpDnQty" CssClass="form-select-sm col-md-2 me-3" runat="server">
        <asp:ListItem Selected="True">1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" Text="Add to Cart" />
    </div>
    <div class=" d-flex w-50 mx-auto justify-content-around">
           <asp:Button ID="btnFacebookShare" runat="server" CssClass="bg-secondary btn btn-sm p-2 text-white border-0 rounded" Text="Share on Facebook" OnClick="btnFacebookShare_Click" />

            <asp:Button ID="btnGoogleShare" runat="server" CssClass="bg-secondary btn btn-sm p-2 text-white border-0 rounded" Text="Share on Google+" OnClick="btnGoogleShare_Click" />

            <asp:Button ID="btnLinkedInShare" runat="server" CssClass="bg-secondary btn btn-sm p-2 text-white border-0 rounded" Text="Share on LinkedIn" OnClick="btnLinkedInShare_Click" />

    </div>



    <script type="text/javascript">
        function linkedinShare(url) {
            if (!/^https?:\/\//i.test(url)) {
                url = 'http://' + url;
            }
            window.open('https://www.linkedin.com/shareArticle?url=' + encodeURIComponent(url), 'linkedin-share-dialog', 'width=626,height=436');
        }
    </script>


    <script type="text/javascript">
        function googleShare(url) {
            if (!/^https?:\/\//i.test(url)) {
                url = 'http://' + url;
            }
            window.open('https://plus.google.com/share?url=' + encodeURIComponent(url), 'google-share-dialog', 'width=626,height=436');
        }
    </script>


    <script type="text/javascript">
        function facebookShare(url) {
            if (!/^https?:\/\//i.test(url)) {
                url = 'http://' + url;
            }
            window.open('https://www.facebook.com/sharer/sharer.php?href=' + encodeURIComponent(url), 'facebook-share-dialog', 'width=626,height=436');
        }
    </script>

</asp:Content>

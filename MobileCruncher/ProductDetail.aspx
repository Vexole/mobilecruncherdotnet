<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="MobileCruncher.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ObjectDataSource ID="ProductDetailDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProductDetails" TypeName="MobileCruncher.Models.ProductDAL">
        <SelectParameters>
            <asp:SessionParameter Name="Id" SessionField="ProductId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <h1 class="text-center my-4">MobileCrunchers - Product Detail</h1>

    <asp:DetailsView ID="dtlViewProduct" class="mx-auto p-2" runat="server" AutoGenerateRows="False" DataSourceID="ProductDetailDataSource" Height="50px" Width="125px">
        <Fields >
            <asp:BoundField DataField="Name" HeaderText="Name:" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price:" SortExpression="Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity:" SortExpression="Quantity" />
            <asp:BoundField DataField="ImagePath" HeaderText="ImagePath" SortExpression="ImagePath" />
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
    </asp:DetailsView>
    <div class="d-flex mx-auto justify-content-around my-3" style="width: 360px">
        <asp:DropDownList ID="drpDnQty" style="width: 230px" runat="server">
        <asp:ListItem Selected="True">1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" Text="ADD TO CART" />
    </div>
    <div class=" d-flex w-50 mx-auto justify-content-around">
           <asp:Button ID="btnFacebookShare" runat="server" CssClass="bg-primary p-2 text-white border-0 rounded" Text="Share on Facebook" OnClick="btnFacebookShare_Click" />

            <asp:Button ID="btnGoogleShare" runat="server" CssClass="bg-warning p-2 text-black border-0 rounded" Text="Share on Google+" OnClick="btnGoogleShare_Click" />

            <asp:Button ID="btnLinkedInShare" runat="server" CssClass="bg-primary p-2 text-white border-0 rounded" Text="Share on LinkedIn" OnClick="btnLinkedInShare_Click" />

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

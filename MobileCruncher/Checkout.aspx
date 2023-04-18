<%@ Page Title="MobileCrunchers - Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MobileCruncher.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class=" hero checkout-header"></div>
    <section class="checkout-container">
        <h2 id="title" class="text-center mb-3 mc-color-primary"><%: Title %></h2>
        <div class="checkout-details">
            <div class="checkout-form-container card p-4 mx-auto col-md-4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please correct these entries:" />
                <div class="contact-form-container">
                    <h4 class="form-header mc-color-secondary mb-3">Contact Information</h4>
                    <div class="contact-form">
                        <div id="emailField">
                            <asp:Label ID="lblEmailAddress" runat="server" Font-Bold="True" Text="Email Address: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtEmailAddress" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="emailAddressValidator" runat="server" ControlToValidate="txtEmailAddress" ErrorMessage="Email Address" ForeColor="Red" Display="Dynamic">Email Address is required.</asp:RequiredFieldValidator>
                        </div>
                        <div id="firstNameField">
                            <asp:Label ID="lblFirstName" runat="server" Font-Bold="True" Text="First Name: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name" ForeColor="Red" Display="Dynamic">First name is required.</asp:RequiredFieldValidator>
                        </div>
                        <div id="lastNameField">
                            <asp:Label ID="lblLastName" runat="server" Font-Bold="True" Text="Last Name: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="lastNameValidator" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name" ForeColor="Red" Display="Dynamic">Last name is required.</asp:RequiredFieldValidator>
                        </div>
                        <div id="phoneNumberField">
                            <asp:Label ID="lblPhoneNumber" runat="server" Font-Bold="True" Text="Phone Number: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtPhoneNumber" CssClass="form-control" runat="server"></asp:TextBox>
                            <div>
                                <asp:RequiredFieldValidator ID="phoneNumberValidator" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number" ForeColor="Red" Display="Dynamic">Phone number is required.</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" Display="Dynamic" ErrorMessage="Phone Number" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">Please enter number in ###-###-#### format.</asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="billing-address-form-container">
                    <h4 class="form-header mc-color-secondary my-3">Billing Address</h4>
                    <div class="billing-address-form">
                        <div id="addressField">
                            <asp:Label ID="lblAddress" runat="server" Font-Bold="True" Text="Address: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="addressVallidator" runat="server" ControlToValidate="txtAddress" ErrorMessage="Billing Address" ForeColor="Red" Display="Dynamic">Billing address is required.</asp:RequiredFieldValidator>
                        </div>
                        <div id="cityField">
                            <asp:Label ID="lblCity" runat="server" Font-Bold="True" Text="City: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtCity" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="cityValidator" runat="server" ControlToValidate="txtCity" ErrorMessage="Billing city" ForeColor="Red" Display="Dynamic">Billing city is requried.</asp:RequiredFieldValidator>
                        </div>
                        <div id="stateField">
                            <asp:Label ID="lblState" runat="server" Font-Bold="True" Text="State: " CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="drpdnListState" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Abbreviation">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [States]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="stateValidator" runat="server" ControlToValidate="drpdnListState" ErrorMessage="Billing State" ForeColor="Red" Display="Dynamic">State is required.</asp:RequiredFieldValidator>
                        </div>
                        <div id="zipCodeField">
                            <asp:Label ID="lblZipCode" runat="server" Font-Bold="True" Text="Zip Code: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtZipCode" CssClass="form-control" runat="server"></asp:TextBox>
                            <div>
                                <asp:RequiredFieldValidator ID="zipCodeValidator" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip code" ForeColor="Red" Display="Dynamic">Zip Code is required.</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="Zip Code" ForeColor="Red" ValidationExpression="[ABCEGHJ-NPRSTVXYabceghj-nprstvxy]\d[ABCEGHJ-NPRSTV-Zabceghj-nprstv-z][ -]?\d[ABCEGHJ-NPRSTV-Zabceghj-nprstv-z]\d">Please enter valid zip code.</asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="buttons-form-container mt-4 d-flex justify-content-around">
                    <asp:Button ID="btnCheckOut" runat="server" Text="Proceed" CssClass="checkout btn btn-primary btn-sm" OnClick="btnCheckOut_Click" />
                    <asp:Button ID="btnGotoCart" runat="server" CssClass="goto-cart btn btn-primary btn-sm" PostBackUrl="~/Cart.aspx" CausesValidation="False" Text="Go to Cart" />
                    <asp:LinkButton ID="btnContinueShopping" CssClass="btn btn-primary btn-sm" runat="server" PostBackUrl="~/Products.aspx" CausesValidation="False">Continue Shopping</asp:LinkButton>
                    <asp:SqlDataSource ID="sqlDSOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [orders] WHERE [id] = @id" InsertCommand="INSERT INTO [orders] ([total], [customer_id]) VALUES (@total, @customer_id)" SelectCommand="SELECT * FROM [orders]" UpdateCommand="UPDATE [orders] SET [total] = @total, [customer_id] = @customer_id WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="total" Type="Decimal" />
                            <asp:Parameter Name="customer_id" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="total" Type="Decimal" />
                            <asp:Parameter Name="customer_id" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlDSOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [order_details] WHERE [id] = @id" InsertCommand="INSERT INTO [order_details] ([order_id], [product_id], [quantity]) VALUES (@order_id, @product_id, @quantity)" SelectCommand="SELECT * FROM [order_details]" UpdateCommand="UPDATE [order_details] SET [order_id] = @order_id, [product_id] = @product_id, [quantity] = @quantity WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="order_id" Type="Int32" />
                            <asp:Parameter Name="product_id" Type="Int32" />
                            <asp:Parameter Name="quantity" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="order_id" Type="Int32" />
                            <asp:Parameter Name="product_id" Type="Int32" />
                            <asp:Parameter Name="quantity" Type="Int32" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlDSLastInsertedRow" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 1 id FROM [orders] ORDER BY [id] DESC"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="checkout-cart-information">

        </div>
    </section>
</asp:Content>

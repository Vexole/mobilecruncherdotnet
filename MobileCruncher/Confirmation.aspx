<%@ Page Title="MobileCrunchers - Successful Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="MobileCruncher.Confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title" class="text-center mb-3 mc-color-primary"><%: Title %></h2>
        <div class="col-md-6 p-4 mx-auto">
            <section>
                <div class="row justify-content-center">
                    <h5 class="text-center mx-5">Thanks For Your Order! Our team will prepare your order, soon you hear from us.</h5>
                    <div class="col-8 mb-2">
                        <img src="images/thankyoufororder.png" class="card-img-top mt-3" style="object-fit:cover" alt="Thank you for Order" />
                    </div>
                    <a class="text-center mx-3 my-3 btn btn-primary col-sm-6 col-md-4" href="Products.aspx">Continue Shopping</a>
                </div>
            </section>
        </div>
    </main>
</asp:Content>

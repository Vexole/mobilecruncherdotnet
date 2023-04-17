﻿<%@ Page Title="MobileCrunchers - Successful Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="MobileCruncher.Confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title" class="text-center mb-3 mc-color-primary"><%: Title %>.</h2>
        <div class="col-md-6 p-4 mx-auto">
            <section>
                <div class="row justify-content-center">
                    <h5 class="text-center mx-5">Thanks For Your Order! Our team will prepare your order, soon you hear from us.</h5>
                </div>
            </section>
        </div>
    </main>
</asp:Content>
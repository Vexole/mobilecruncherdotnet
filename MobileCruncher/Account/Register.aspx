<%@ Page Title="MobileCrunchers- Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MobileCruncher.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title">
        <h2 id="title" class="text-center mc-color-primary"><%: Title %>.</h2>
        <div class="card col-md-6 mx-auto p-3">
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <asp:ValidationSummary runat="server" CssClass="text-danger" />
            <div class="row justify-content-center">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-3 col-form-label">Email</asp:Label>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />
                </div>
            </div>
            <div class="row justify-content-center">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 col-form-label">Password</asp:Label>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
            </div>
            <div class="row justify-content-center">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-3 col-form-label">Confirm password</asp:Label>
                <div class="col-md-7">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="mt-3 d-flex justify-content-center">
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-outline-primary col-md-5" />
                </div>
            </div>
        </div>
    </main>
</asp:Content>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MobileCruncher._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

      <div class="d-flex flex-column align-items-center pt-5">
    <h2 class="text-center my-4 mc-color-secondary">About Us</h2>
    <div class="d-flex justify-content-center align-items-center">
      <div class="col-md-6 p-3 text-center fst-italic">
        <At> Welcome to our mobile store! We are dedicated to providing our customers with the best possible shopping experience. Our store was established in 2010 with the goal of offering high-quality mobile phones and accessories at affordable prices. Since then, we have evolved to meet the changing needs of our customers by expanding our product line and offering new services such as phone repairs and trade-ins. At our mobile store, we believe that everyone deserves access to high-quality mobile phones and accessories at affordable prices. That’s why we work hard to source the best products from around the world and offer them at prices that are accessible to everyone.</p>
      </div>
      <div class="col-md-4">
        <img src="images/phones2.jpg" class="card-img-top mt-3" alt="Mobile Phones on About Us Section" />
      </div>
    </div>
  </div>

  <div class="d-flex flex-column align-items-center pt-5">
    <h2 class="text-center my-4 mc-color-secondary">Why Choose Us?</h2>
    <div class="d-flex justify-content-center">
      <div class="card col-md-4 mt-4 me-4">
        <div class="card-body">
          <h5 class="card-title mc-color-gray-02 text-center"><i class="bi bi-arrow-repeat me-2"></i><em>Free Return</em></h5>
          <p class="card-text mc-color-gray text-center">30 days money back garantee.</p>
        </div>
      </div>
      <div class="card col-md-4 mt-4 me-4">
        <div class="card-body">
          <h5 class="card-title mc-color-gray-02 text-center"><i class="bi bi-currency-dollar me-2"></i><em>Free Shipping</em></h5>
          <p class="card-text mc-color-gray text-center">Free shipping on all order.</p>
        </div>
      </div>
      <div class="card col-md-4 mt-4 me-4">
        <div class="card-body">
          <h5 class="card-title mc-color-gray-02 text-center"><i class="bi bi-clock me-2"></i><em>Support 24/7</em></h5>
          <p class="card-text mc-color-gray text-center">Online support 24 hours a day.</p>
        </div>
      </div>
    </div>
  </div>

  <div class="d-flex flex-column align-items-center pt-5 pb-5">
    <h2 class="text-center mt-4 mb-2 mc-color-secondary">Customer Testimonials</h2>
    <h6 class="mc-color-gray text-center mb-4">What our customers are saying...</h6>
    <div class="d-flex justify-content-center">
      <div class="card col-md-2 me-4">
        <img src="images/customer1.jpg" class="card-img-top mt-3 px-3" alt="Customer Man Picture" />
        <div class="card-body">
          <h6 class="card-title mc-color-primary text-center"><em>Lance Jarvisc</em></h6>
          <p class="card-text mc-color-gray text-center">I was blown away by how easy it was to find what I was looking for on this website. MobileCrunchers has a great selection of phones and accessories at affordable prices.</p>
        </div>
      </div>
      <div class="card col-md-2 me-4">
        <img src="images/customer2.jpg" class="card-img-top mt-3 px-3" alt="Customer Woman Picture" />
        <div class="card-body">
          <h6 class="card-title mc-color-primary text-center"><em>Ericka Lynda</em></h6>
          <p class="card-text mc-color-gray text-center">I had a great experience shopping at this mobile store! The staff was knowledgeable and friendly, and they helped me find exactly what I was looking for.</p>
        </div>
      </div>
      <div class="card col-md-2 me-4">
        <img src="images/customer3.jpg" class="card-img-top mt-3 px-3" alt="Customer Woman Picture" />
        <div class="card-body">
          <h6 class="card-title mc-color-primary text-center"><em>Kat Park</em></h6>
          <p class="card-text mc-color-gray text-center">I recently purchased a new phone from this mobile store and I couldn't be happier with my purchase! The phone is high-quality and works perfectly.</p>
        </div>
      </div>
      <div class="card col-md-2 me-4">
        <img src="images/customer4.jpg" class="card-img-top mt-3 px-3" alt="Customer Man Picture" />
        <div class="card-body">
          <h6 class="card-title mc-color-primary text-center"><em>Neil Wilford</em></h6>
          <p class="card-text mc-color-gray text-center">I've been a customer of this mobile store for years and I've always been impressed with their selection of phones and accessories. The staff is always friendly and helpful..</p>
        </div>
      </div>
    </div>
  </div>

</asp:Content>

using BMobileCruncher.Utils;
using MobileCruncher.Models;
using System;

namespace MobileCruncher
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CartUtils.GetCartItems().Count == 0)
            {
                Response.Redirect("~/Products.aspx");
            }
        }

        /*
         * Get the form data, save it in the cart session and
         * redirect to confirmation page.
         */
        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Customer customer = new Customer()
            {
                Email = txtEmailAddress.Text,
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                PhoneNumber = txtPhoneNumber.Text,
                Address = txtAddress.Text,
                City = txtCity.Text,
                State = drpdnListState.Text,
                ZipCode = txtZipCode.Text,
            };

            CartUtils.SetShippingCustomer(customer);
            Response.Redirect("~/Confirmation.aspx");
        }
    }
}
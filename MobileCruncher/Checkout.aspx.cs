using BMobileCruncher.Utils;
using MobileCruncher.Models;
using System;
using System.Data;
using System.Linq;
using System.Web.UI;

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

            var cart = CartUtils.GetCart();
            var cartItems = CartUtils.GetCartItems();

            sqlDSOrders.InsertParameters["total"].DefaultValue =
                    cart.Total.ToString();
            sqlDSOrders.InsertParameters["customer_id"].DefaultValue =
                    cart.Customer.ToString();

            sqlDSOrders.Insert();

            DataSourceSelectArguments args = new DataSourceSelectArguments();
            var result = sqlDSLastInsertedRow.Select(args).Cast<DataRowView>().FirstOrDefault();

            string order_id = "";
            if (result != null)
            {
                order_id = result["ID"].ToString();
            }

            cartItems.ForEach(item =>
            {
                sqlDSOrderDetails.InsertParameters["order_id"].DefaultValue =
                    order_id;
                sqlDSOrderDetails.InsertParameters["product_id"].DefaultValue =
                    item.Product.Id.ToString();
                sqlDSOrderDetails.InsertParameters["quantity"].DefaultValue =
                    item.Quantity.ToString();

                sqlDSOrderDetails.Insert();
            });
            Response.Redirect("~/Confirmation.aspx");
        }
    }
}
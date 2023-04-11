using BMobileCruncher.Models;
using BMobileCruncher.Utils;
using MobileCruncher.Models;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileCruncher
{
    public partial class Cart : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            grdViewCartItems.RowCommand += MyGridView_RowCommand;

            if (!IsPostBack)
            {
                List<CartItem> cartItems = CartUtils.GetCartItems();
                int index = 1;
                cartItems.ForEach(item =>
                {
                    item.SN = index;
                    index++;
                }
                );
                grdViewCartItems.DataSource = cartItems;
                grdViewCartItems.DataBind();
                lblTotalAmount.Text = CartUtils.GetCart().Total.ToString();

                if (index == 1)
                {
                    lblTotalPrice.Visible = false;
                    lblTotalAmount.Visible = false;
                    btnCheckout.Visible = false;
                    lblNoItem.Visible = true;
                } else
                {
                    lblTotalPrice.Visible = true;
                    lblTotalAmount.Visible = true;
                    btnCheckout.Visible = true;
                    lblNoItem.Visible = false;
                }
            }
        }

        protected void MyGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                CartUtils.RemoveItemFromCart(productId);
                List<CartItem> cartItems = CartUtils.GetCartItems();
                cartItems.RemoveAll(item => item.Product.Id == productId);
                int index = 1;
                cartItems.ForEach(item =>
                {
                    item.SN = index;
                    index++;
                }
                );
                Response.Redirect("~/Cart.aspx");
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Checkout.aspx");
        }
    }
}
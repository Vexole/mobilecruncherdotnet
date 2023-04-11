using BMobileCruncher.Utils;
using MobileCruncher.Models;
using System;
using System.Collections;
using System.Web;
using System.Web.UI;

namespace MobileCruncher
{
    public partial class ProductDetail : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["ProductId"] == null)
            {
                Response.Redirect("~/Products.aspx");
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {
                int Quantity = Int32.Parse(drpDnQty.SelectedValue);
                IEnumerable products = ProductDetailDataSource.Select();

                if (Page.IsValid)
                {
                    foreach (Product product in products)
                    {
                        CartUtils.AddItemsToCart(new CartItem
                        { Product = product, Quantity = Quantity });
                    }
                    Response.Redirect("~/Cart.aspx");
                }
            }
        }

        protected void btnFacebookShare_Click(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpContext.Current.Request.ApplicationPath + Request.Url.PathAndQuery;
            if (!Uri.IsWellFormedUriString(url, UriKind.RelativeOrAbsolute))
            {
                // Handle invalid URL
                return;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "facebookShare", "facebookShare('" + url + "');", true);
        }

        protected void btnGoogleShare_Click(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (!Uri.IsWellFormedUriString(url, UriKind.RelativeOrAbsolute))
            {
                // Handle invalid URL
                return;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "googleShare", "googleShare('" + url + "');", true);
        }

        protected void btnLinkedInShare_Click(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (!Uri.IsWellFormedUriString(url, UriKind.RelativeOrAbsolute))
            {
                // Handle invalid URL
                return;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "linkedinShare", "linkedinShare('" + url + "');", true);
        }
    }
}
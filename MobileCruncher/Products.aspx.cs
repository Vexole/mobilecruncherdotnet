using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace MobileCruncher
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void ProductTiles_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int productId;
            if (int.TryParse((string)e.CommandArgument, out productId))
            {
                HttpContext.Current.Session["ProductId"] = productId;
                Response.Redirect("~/ProductDetail.aspx");
            }
        }
    }
}
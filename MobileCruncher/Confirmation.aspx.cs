using System;
using System.Web;

namespace MobileCruncher
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}
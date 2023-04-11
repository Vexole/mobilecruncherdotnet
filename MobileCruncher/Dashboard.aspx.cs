using System;

namespace MobileCruncher
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dtlViewProductDetails_ItemDeleted(object sender, System.Web.UI.WebControls.DetailsViewDeletedEventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }

        protected void dtlViewProductDetails_ItemInserted(object sender, System.Web.UI.WebControls.DetailsViewInsertedEventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }

        protected void dtlViewProductDetails_ItemUpdated(object sender, System.Web.UI.WebControls.DetailsViewUpdatedEventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }
    }
}
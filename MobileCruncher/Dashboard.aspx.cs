using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileCruncher
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated 
                || HttpContext.Current.User.Identity.Name != "admin@mobilecrunchers.com")
            {
                Response.Redirect("~/Account/Login.aspx");
            }

            if (IsPostBack)
            {
                dtlViewProductDetails.Visible = true;
            }
            else
            {
                dtlViewProductDetails.Visible = false;
            }
        }

        protected void LnkBtnProcInsert_Click(object sender, EventArgs e)
        {
            sqlDSProcessorTypes.InsertParameters["name"].DefaultValue =
                ((TextBox)grdViewProcessorTypes.FooterRow.FindControl("txtProcessor")).Text;
            sqlDSProcessorTypes.Insert();
        }

        protected void LnkBtnManuInsert_Click(object sender, EventArgs e)
        {
            sqlDSManufacturers.InsertParameters["name"].DefaultValue =
                ((TextBox)grdViewManufacturers.FooterRow.FindControl("txtManufacturer")).Text;
            sqlDSManufacturers.Insert();
        }

        protected void dtlViewProductDetails_ItemDeleted(object sender, System.Web.UI.WebControls.DetailsViewDeletedEventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }

        protected void dtlViewProductDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            var param = SqlDataSource1.InsertParameters;
            param["name"].DefaultValue = e.Values["Name"].ToString();
            param["price"].DefaultValue = e.Values["Price"].ToString();
            SqlDataSource1.Insert();

            DataSourceSelectArguments args = new DataSourceSelectArguments();
            var result = sqlLastRowId.Select(args).Cast<DataRowView>().FirstOrDefault();

            string id = "";
            if (result != null)
            {
                id = result["ID"].ToString();
            }
            
            var parameters = sqlDSProductDetails.InsertParameters;
            parameters["RAM"].DefaultValue = e.Values["RAM"].ToString();
            parameters["StorageCapacity"].DefaultValue = e.Values["StorageCapacity"].ToString();
            parameters["ScreenSize"].DefaultValue = e.Values["ScreenSize"].ToString();
            parameters["ProcessorSpeed"].DefaultValue = e.Values["ProcessorSpeed"].ToString();
            parameters["OpticalSensorResolution"].DefaultValue = e.Values["OpticalSensorResolution"].ToString();
            parameters["Weight"].DefaultValue = e.Values["Weight"].ToString();
            parameters["Dimension"].DefaultValue = e.Values["Dimension"].ToString();
            parameters["ManufacturerId"].DefaultValue = e.Values["ManufacturerId"].ToString();
            parameters["OperatingSystemId"].DefaultValue = e.Values["OperatingSystemId"].ToString();
            parameters["ProcessorTypeId"].DefaultValue = e.Values["ProcessorTypeId"].ToString();
            parameters["ProductId"].DefaultValue = id;
            try
            {
                sqlDSProductDetails.Insert();
    
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Response.Redirect("~/Dashboard.aspx");
        }

        protected void dtlViewProductDetails_ItemUpdated(object sender, System.Web.UI.WebControls.DetailsViewUpdatedEventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }

        protected void grdViewManufacturers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdViewProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            dtlViewProductDetails.Visible = true;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void Adminlogoutbtn_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("Default.aspx");
        //Session["Username"] = null;
    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminViewCats.aspx?searchProduct=" + search.Text);
    }
}

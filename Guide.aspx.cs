using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guide : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            //LblSuccess.Text = "Login Success, Welcome" + Session["Username"].ToString();
            logoutbtn.Visible = true;
            loginbtn.Visible = false;
        }
        else
        {
            logoutbtn.Visible = false;
            loginbtn.Visible = true;
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void logoutbtn_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Default.aspx");
        Session["Username"] = null;
    }

    protected void loginbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void Cart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
}
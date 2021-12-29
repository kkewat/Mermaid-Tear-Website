using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["Username"]!= null) 
        {
            LblSuccess.Text = "Login Success, Welcome"+Session["Username"].ToString();
         }
         else 
         {
            Response.Redirect("~/Login.aspx");
          }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNum();
        Session["Username"] = null;
    }
    public void crtbutton() {
        Response.Write("<script>alert('login to use cart')</script>");
    }
    public void BindCartNum()
    {
        if(Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] Product = CookiePID.Split(',');
            int Count = Product.Length;
            num.InnerText = Count.ToString();
        }
        else 
        {
            num.InnerText = 0.ToString();
        }
     }
}
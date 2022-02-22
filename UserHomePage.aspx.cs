﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNum();
        if (Session["Username"]!= null) 
        {
            logoutbtn.Visible = true;
            loginbtn.Visible = false;
            LblSuccess.Text = "Login Success, Welcome"+Session["Username"].ToString();
         }
         else 
         {
            logoutbtn.Visible = false;
            logoutbtn.Visible = true;
            //Response.Redirect("~/Login.aspx");
        }

    }
    protected void CartClick()
    {
        Response.Redirect("Cart.aspx");
    }
    public void BindCartNum()
    {
        if (Request.Cookies["CartPID"] != null)
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
    protected void logoutbtn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["Username"] = null;
        Response.Redirect("~/Default.aspx");
        
    }

    protected void loginbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }
}
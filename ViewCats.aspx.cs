﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCats : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
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
        }
        if(!IsPostBack)
        {
            BindProdViewRepeater();
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
        if (Session["Username"] != null)
        {
            Response.Redirect("Cart.aspx");
        }
        else if(Session["Username"] == null)
        {
            Response.Write("alert('Login First to add to cart')");
            Response.Redirect("~Login.aspx");
        }
    }

    private void BindProdViewRepeater()
    {
        try
        {
            string Cat, search, p_search;
            Cat = Request.QueryString["searchCat"];
            search = Request.QueryString["searchProduct"];
            p_search = "%" + search + "%";
            if (Cat != null)
            {
                using (SqlConnection con = new SqlConnection(Connection))
                {
                    SqlCommand cmd = new SqlCommand("Cat_Search", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CategoryName", Cat);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ViewRepeater.DataSource = dt;
                        ViewRepeater.DataBind();
                    }
                }
            }
            else if (search != null)
            {
                using (SqlConnection con = new SqlConnection(Connection))
                {
                    SqlCommand cmd1 = new SqlCommand("Pro_Search", con);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@ProName", p_search);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ViewRepeater.DataSource = dt;
                        ViewRepeater.DataBind();
                    }
                }
            }
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }
}
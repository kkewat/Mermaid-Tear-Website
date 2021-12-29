using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void register(object sender, EventArgs e)
    {
        string First_name, Last_name, Gender, Email, Phoneno, Password,UserName;
        First_name = first_name.Text;
        Last_name = last_name.Text;
        Email = email.Text;
        Phoneno = phone.Text;
        Password = password.Text;
        Gender = gender.SelectedValue;
        UserName = username.Text;


        SqlConnection con = new SqlConnection("Data Source=DESKTOP-SGG9TB4;Initial Catalog=Gold_Shop;Integrated Security=True");
        SqlCommand cmd = new SqlCommand(@"INSERT INTO [Gold_Shop].[dbo].[User_detail]
           ([First_Name]
           ,[Last_Name]
           ,[Username]
           ,[Email]
           ,[Phone_no]
           ,[Gender]
           ,[Password])
     VALUES
           ('" + First_name + "','" + Last_name + "','" + UserName + "','" + Email + "','" + Phoneno + "','" + Gender + "','" + Password + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('user registered successfully')</script>");
        Response.Redirect("~/Login.aspx");
    }
}
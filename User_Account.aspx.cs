using System;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.Text;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Account : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        npsswd.Visible = false;
        Label1.Visible = false;
        changepsd.Visible = false;
        if(psd.Checked)
        {
            npsswd.Visible = true;
            Label1.Visible = true;
            changepsd.Visible = true;
        }
        else if(psd.Checked == false)
        {
            npsswd.Visible = false;
            Label1.Visible = false;
            changepsd.Visible = false;
        }
        BindData();
    }

    protected void BindData()
    {
        String Name = Session["Username"].ToString();
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("select * from User_detail where Username = '"+Name+"'", con);
        con.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        //if (FirstName.Text == null | LastName.Text == null | txtUserName.Text == null | mail.Text == null | Phone_no.Text == null)
        //{
            FirstName.Text = reader["First_Name"].ToString();
            LastName.Text = reader["Last_Name"].ToString();
            txtUserName.Text = Name;
            mail.Text = reader["Email"].ToString();
            Phone_no.Text = reader["Phone_no"].ToString();
        //}
        reader.Close();
        con.Close();
    }
    protected void delAccount_Click(object sender, EventArgs e)
    {
        String Name = Session["Username"].ToString();
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("delete from User_detail Where Username='" + Name + "'", con);
        con.Open();
        Response.Write("<script>alert('Account Deleted Successfully')</script>");
        con.Close();
        Response.Redirect("Default.aspx");
    }

    protected void changepsd_Click(object sender, EventArgs e)
    {
        String Name = Session["Username"].ToString();
        byte[] encData_byte = new byte[npsswd.Text.Length];
        encData_byte = System.Text.Encoding.UTF8.GetBytes(npsswd.Text);
        string ePassword = Convert.ToBase64String(encData_byte);
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("update User_detail set Password ='" + ePassword + "' where Username='" + Name + "'",con);
        con.Open();
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Password changed Successfully')</script>");
        con.Close();
        npsswd.Text = null;
        psd.Checked = false;
    }
}
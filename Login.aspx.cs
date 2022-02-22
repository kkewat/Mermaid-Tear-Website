using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack) 
        {
            if(Request.Cookies["UName"] != null && Request.Cookies["UPassword"] != null) 
            {
                username.Text = Request.Cookies["UName"].Value;
                password.Text = Request.Cookies["UPassword"].Value;
                Remember_me.Checked = true;
             }
        }
      }

    protected void login_Click(object sender, EventArgs e)
    {
        string Username, Password;
        Username = username.Text;
        Password = password.Text;

        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand(@"SELECT [Username]
      ,[Password]
      ,[User_Type]
  FROM User_detail WHERE Username='" + Username + "' AND Password='" + Password + "'", con);
        
  SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();

        if (dt.Rows.Count > 0) {
            if(Remember_me.Checked) {
                Response.Cookies["UName"].Value = Username;
                Response.Cookies["UPassword"].Value = Password;

                Response.Cookies["UName"].Expires = DateTime.Now.AddMonths(6);
                Response.Cookies["UPassword"].Expires = DateTime.Now.AddMonths(6);

            }
            else
            {
                Response.Cookies["UName"].Value = Username;
                Response.Cookies["UPassword"].Value = Password;

                Response.Cookies["UName"].Expires = DateTime.Now.AddMonths(-1);
                Response.Cookies["UPassword"].Expires = DateTime.Now.AddMonths(-1);
            }
            string Usertype;
            Usertype = dt.Rows[0][2].ToString().Trim();
            if(Usertype == "User")
            {
                Session["Username"] = Username;
                Response.Redirect("UserHomePage.aspx");
            }
            else
            if(Usertype == "Admin")
            {
                Session["Username"] = Username;
                Response.Redirect("Admin home page.aspx");
            }
            //Session["Username"] = Username;
            //Response.Redirect("UserHomePage.aspx");
        }
        else {
            Label1.Text = "Invalid Login Details";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
    }
}

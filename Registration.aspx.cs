using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
          
    }
    
    protected void register(object sender, EventArgs e)
    {
        try
        {
            string First_name, Last_name, Gender, Email, Phoneno, Password, UserName;
            First_name = first_name.Text;
            Last_name = last_name.Text;
            Email = email.Text;
            Phoneno = phone.Text;
            Password = password.Text;
            Gender = gender.SelectedValue;
            UserName = username.Text;
            byte[] encData_byte = new byte[Password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(Password);
            string ePassword = Convert.ToBase64String(encData_byte);

            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand(@"INSERT INTO User_detail
           ([First_Name]
           ,[Last_Name]
           ,[Username]
           ,[Email]
           ,[Phone_no]
           ,[Gender]
           ,[Password]
           ,[User_Type])
     VALUES
           ('" + First_name + "','" + Last_name + "','" + UserName + "','" + Email + "','" + Phoneno + "','" + Gender + "','" + ePassword + "','User')", con);

            SqlCommand cmd1 = new SqlCommand(@"SELECT [Username]
      ,[Email]
      ,[Phone_no]
  FROM User_detail WHERE Username='" + UserName + "' OR Email='" + Email + "' OR Phone_no='" + Phoneno + "'", con);

            SqlDataAdapter sda = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd1.ExecuteNonQuery();
            con.Close();

            if (dt.Rows.Count > 0)
            {
                Response.Write(Label1.Text = "<b><u>User Already Exists</u></b>");
            }
            else
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('user registered successfully')</script>");
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }
}

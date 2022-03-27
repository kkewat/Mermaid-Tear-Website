using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class Recover_Password : System.Web.UI.Page
{
    String GUIDvalue;
    int Uid;
    int Id1;
    DataTable dt = new DataTable();
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection))
            {

                GUIDvalue = Request.QueryString["id"];
                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("Select * from Forgot_Password where Id=@Id", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@Id", GUIDvalue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);

                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        Uid = Convert.ToInt32(dt.Rows[0][2]);
                        Id1 = Convert.ToInt32(dt.Rows[0][0]);
                    }
                    else
                    {
                        lblmsg.Text = "Your Password Reset Link is Expired or Invalid...try again";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }

                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

                if (!IsPostBack)
                {
                    if (dt.Rows.Count != 0)
                    {
                        txtConfirmPass.Visible = true;
                        txtNewPass.Visible = true;
                        lblNewPassword.Visible = true;
                        lblConfirmPass.Visible = true;
                        btnResetPass.Visible = true;
                    }
                    else
                    {
                        lblmsg.Text = "Your Password Reset Link is Expired or Invalid...try again";
                        lblmsg.ForeColor = System.Drawing.Color.Red;

                    }

                }
            }
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }
    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        try
        {
            byte[] encData_byte = new byte[txtNewPass.Text.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(txtNewPass.Text);
            string ePassword = Convert.ToBase64String(encData_byte);
            if (txtNewPass.Text != "" && txtConfirmPass.Text != "" && txtNewPass.Text == txtConfirmPass.Text)
            {
                using (SqlConnection con = new SqlConnection(Connection))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update User_detail set Password=@p where User_id=@Uid", con);
                    cmd.Parameters.AddWithValue("@p", ePassword);
                    cmd.Parameters.AddWithValue("@Uid", Uid);
                    cmd.ExecuteNonQuery();


                    //SqlCommand cmd2 = new SqlCommand("delete form Forgot_Password where Req_id='" + Id1 + "'", con);
                    //cmd2.ExecuteNonQuery();
                    Response.Write("<script> alert('Password Reset Successfully done');  </script>");
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }
}
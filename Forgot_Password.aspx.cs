using System;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class Forgot_Password : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Recoverpassword_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"SELECT *
  FROM [User_detail] WHERE Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", PasswordEmailRecovery.Text);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    string myGUID = Guid.NewGuid().ToString();
                    int uid = Convert.ToInt32(dt.Rows[0][0]);

                    SqlCommand cmd1 = new SqlCommand("Insert into Forgot_Password(Id,User_id,Req_DateTime) values('" + myGUID + "','" + uid + "',GETDATE())", con);
                    cmd1.ExecuteNonQuery();

                    //Sending Reset link via email

                    string to = PasswordEmailRecovery.Text; //To address    
                    string from = "kewatkunal405@gmail.com"; //From address    
                    MailMessage message = new MailMessage(from, to);

                    string mailbody = "TO Reset your password click on the below link. http://localhost:2349/Recover_Password.aspx?id=" + myGUID;
                    message.Subject = "Reset Password";
                    message.Body = mailbody;
                    message.BodyEncoding = Encoding.UTF8;
                    message.IsBodyHtml = true;
                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                    System.Net.NetworkCredential basicCredential1 = new
                    System.Net.NetworkCredential("kewatkunal405@gmail.com", "Kkewat@9200");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = basicCredential1;
                    try
                    {
                        client.Send(message);
                        Response.Write("<script>alert('Check the e-mail')</script>");
                    }

                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                else
                {
                    lblResetPassMsg.Text = "OOps! This Email Does not Exist...Try agian ";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                    PasswordEmailRecovery.Text = string.Empty;
                    PasswordEmailRecovery.Focus();

                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }      
    }
}

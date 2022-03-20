using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestDesign : System.Web.UI.Page
{
    public static String Connection = "Data Source=DESKTOP-SGG9TB4;Initial Catalog=Gold_Shop;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        String name = Session["Username"].ToString();

        SqlConnection con = new SqlConnection(Connection);
        con.Open();
        if (FileUpload1.HasFile)
        {
            string SavePath = Server.MapPath("~/Images/Requests_img/");
            if (!Directory.Exists(SavePath))
            {
                Directory.CreateDirectory(SavePath);
            }
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            String a = @"~\Images\Requests_img";
            string name1 = type.Text.ToString();
            string name2 = string.Concat(name, name1);
            string url1 = string.Concat(a, name, name1,extension);
            FileUpload1.SaveAs(SavePath + "\\" + name2 + "01" + extension);
            string a1 = @"~\Images\ Requests_img\"+name2 +"01"+extension;
            SqlCommand cmd2 = new SqlCommand("insert into Personalization_Request values('" +type.Text + "','" +TextBox1.Text + "','" + TextBox2.Text + "','"+TextBox3.Text+"','"+TextBox4.Text+"','"+TextBox5.Text+"','"+a1+"','"+name+"','"+TextBox6.Text+"')", con);
            cmd2.ExecuteNonQuery();
            Response.Write("<script>alert('Request details submitted successfully.<br/>Wait for the Seller to response you.')</script>");
        }
    }
}
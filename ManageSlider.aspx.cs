using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageSlider : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void AddSlider_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection))
            {
                if (FileUpload1.HasFile)
                {
                    string SavePath = Server.MapPath("~/Images/Slider");
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    string url = SavePath + "\\" + imagename.Text + extension;
                    string a = @"~\Images\Slider\";
                    string b = imagename.Text;
                    string c = extension;
                    string url1 = string.Concat(a, b, c);
                    FileUpload1.SaveAs(url);
                    con.Open();
                    if (imagename.Text != null & HName.Text != null & detail.Text != null)
                    {
                        SqlCommand cmd2 = new SqlCommand("insert into Slider values('" + imagename.Text + "','" + url1 + "','Inactive','" + HName.Text + "','" + detail.Text + "')", con);
                        cmd2.ExecuteNonQuery();
                        imagename.Text = null;
                        HName.Text = null;
                        detail.Text = null;
                        FileUpload1.PostedFile.InputStream.Dispose();
                        Response.Redirect("ManageSlider.aspx");
                    }
                }
            }
        }
        catch (Exception)
        {

            Response.Redirect("error.aspx");
        }
    }

    protected void Stat_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string id = (row.FindControl("id") as Label).Text;
            string stat = null;
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand("select * from Slider", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            stat = reader["Status"].ToString();
            reader.Close();
            if (stat == "Inactive")
            {
                SqlCommand cmd1 = new SqlCommand("update Slider set Status='Active' where id='" + Convert.ToInt32(id) + "'", con);
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect("ManageSlider.aspx");
            }
            else if (stat == "Active")
            {
                SqlCommand cmd2 = new SqlCommand("update Slider set Status='Inactive' where id='" + Convert.ToInt32(id) + "'", con);
                cmd2.ExecuteNonQuery();
                con.Close();
                Response.Redirect("ManageSlider.aspx");
            }
        }
        catch (Exception)
        {

            Response.Redirect("error.aspx");
        }
    }
}
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit_Gender : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["gend_id"] != null)
        {

            if (!IsPostBack)
            {

                ViewDetail();

            }
        }
        else
        {
            Response.Redirect("Add_Gender.aspx");
        }
    }

    private void ViewDetail()
    {

        try
        {
            int GID = Convert.ToInt32(Request.QueryString["gend_id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from Gender Where Gender_id ='" + GID + "'", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtID.Text = GID.ToString();
                        txtName.Text = reader["Gender_Name"].ToString();
                        reader.Close();
                        con.Close();
                    }
                }
            }
        }
        catch (Exception ex)
        {

            Response.Redirect("error.aspx");
        }
    }
    protected void UpdateGender_Click(object sender, EventArgs e)
    {
        try
        {
            int GID = Convert.ToInt32(Request.QueryString["gend_id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand Cmd = new SqlCommand("update Gender set Gender_Name ='" + txtUpdateGenderName.Text + "' where Gender_id='" + GID + "'", con))
                {
                    con.Open();
                    Cmd.ExecuteNonQuery();
                    Response.Write("<Script>alert('Gender Name Updated Successfully')</Script>");
                    txtUpdateGenderName.Text = null;
                    con.Close();
                    ViewDetail();
                }
            }
        }
        catch (Exception)
        {

            Response.Redirect("error.aspx");
        }
    }
}
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit_GrossWeight : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {

            if (!IsPostBack)
            {

                ViewDetail();

            }
        }
        else
        {
            Response.Redirect("Add_GrossWeight.aspx");
        }
    }

    private void ViewDetail()
    {

        try
        {
            int GID = Convert.ToInt32(Request.QueryString["id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from Gross_Weight Where Weight_id ='" + GID + "'", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtID.Text = GID.ToString();
                        txtName.Text = reader["Weight_Name"].ToString();
                        reader.Close();
                        con.Close();
                    }
                }
            }
        }
        catch (Exception)
        {

            Response.Redirect("error.aspx");
        }
    }
    protected void UpdateWeight_Click(object sender, EventArgs e)
    {
        try
        {
            int GID = Convert.ToInt32(Request.QueryString["id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand Cmd = new SqlCommand("update Gross_Weight set Weight_Name ='" + txtUpdateWeightName.Text + "' where Weight_id='" + GID + "'", con))
                {
                    con.Open();
                    Cmd.ExecuteNonQuery();
                    Response.Write("<Script>alert('Gender Name Updated Successfully')</Script>");
                    txtUpdateWeightName.Text = null;
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
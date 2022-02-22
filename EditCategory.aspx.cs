using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCategory : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Category_id"] != null)
        {

            if (!IsPostBack)
            {

                ViewDetail();

            }
        }
        else
        {
            Response.Redirect("Add_Category.aspx");
        }
    }
    private void ViewDetail()
    {

        int CID = Convert.ToInt32(Request.QueryString["Category_id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from Category Where Category_id ='" + CID + "'", con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtID.Text = CID.ToString();
                    txtName.Text = reader["Category_Name"].ToString();
                    reader.Close();
                    con.Close();
                }
            }
        }
    }
    protected void UpdateCat_Click(object sender, EventArgs e)
    {
        int CID = Convert.ToInt32(Request.QueryString["Category_id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand Cmd = new SqlCommand("update Category set Category_Name ='" + txtUpdateCatName.Text + "' where Category_id='" + CID + "'", con))
            {
                con.Open();
                Cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Category Name Updated Successfully')</Script>");
                txtUpdateCatName.Text = null;
                con.Close();
                ViewDetail();
            }
        }
    }
}
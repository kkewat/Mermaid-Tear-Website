using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit_Sub_Cat : System.Web.UI.Page
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
            Response.Redirect("Add_Subcategory.aspx");
        }
    }

    private void ViewDetail()
    {

        int BID = Convert.ToInt32(Request.QueryString["id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from Sub_Category Where Sub_Category_id ='" + BID + "'", con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtID.Text = BID.ToString();
                    txtName.Text = reader["SubCategory_Name"].ToString();
                    reader.Close();
                    con.Close();
                }
            }
        }
    }

    protected void UpdateSubCat_Click(object sender, EventArgs e)
    {
        int BID = Convert.ToInt32(Request.QueryString["id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand Cmd = new SqlCommand("update Sub_Category set SubCategory_Name ='" + txtUpdateSubCatName.Text + "' where Sub_Category_id='" + BID + "'", con))
            {
                con.Open();
                Cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Record Updated Successfully')</Script>");
                txtUpdateSubCatName.Text = null;
                con.Close();
                ViewDetail();
            }
        }
    }
}
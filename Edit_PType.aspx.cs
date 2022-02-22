using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit_PType : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Type_id"] != null)
        {

            if (!IsPostBack)
            {

                ViewDetail();

            }
        }
        else
        {
            Response.Redirect("Add_ProductType.aspx");
        }
    }

    private void ViewDetail()
    {

        int GID = Convert.ToInt32(Request.QueryString["Type_id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from Product_Type Where ProductType_id ='" + GID + "'", con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtID.Text = GID.ToString();
                    txtName.Text = reader["Product_Type_Name"].ToString();
                    reader.Close();
                    con.Close();
                }
            }
        }
    }
    protected void UpdatePType_Click(object sender, EventArgs e)
    {
        int GID = Convert.ToInt32(Request.QueryString["Type_id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand Cmd = new SqlCommand("update Product_Type set Product_Type_Name ='" + txtUpdatePTypeName.Text + "' where ProductType_id='" + GID + "'", con))
            {
                con.Open();
                Cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Product Type Name Updated Successfully')</Script>");
                txtUpdatePTypeName.Text = null;
                con.Close();
                ViewDetail();
            }
        }
    }
}
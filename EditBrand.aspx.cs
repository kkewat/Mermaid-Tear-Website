using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditBrand : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Brand_id"] != null)
        {
            
            if (!IsPostBack)
            {
                
                ViewDetail();

            }
        }
        else
        {
            Response.Redirect("Add_Brand.aspx");
        }
    }

    private void ViewDetail()
    {
        
        int BID = Convert.ToInt32(Request.QueryString["Brand_id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from Brand Where Brand_id ='"+BID+"'",con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtID.Text = BID.ToString();
                    txtName.Text = reader["Brand_name"].ToString();
                    reader.Close();
                    con.Close();
                }
            }
        }
    }

    protected void UpdateBrand_Click(object sender, EventArgs e)
    {
        int BID = Convert.ToInt32(Request.QueryString["Brand_id"]);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand Cmd = new SqlCommand("update Brand set Brand_name ='" + txtUpdateBrandName.Text + "' where Brand_id='" + BID + "'",con))
            {
                con.Open();
                Cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Brand Name Updated Successfully')</Script>");
                txtUpdateBrandName.Text = null;
                con.Close();
                ViewDetail();
            }
        }
    }
}
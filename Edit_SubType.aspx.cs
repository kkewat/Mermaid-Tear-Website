using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit_SubType : System.Web.UI.Page
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
            Response.Redirect("Add_SubType.aspx");
        }
    }

    private void ViewDetail()
    {
        try
        {

            int BID = Convert.ToInt32(Request.QueryString["id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from Product_SubType Where Product_SubType_id ='" + BID + "'", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtID.Text = BID.ToString();
                        txtName.Text = reader["Product_Subtype_name"].ToString();
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

    protected void UpdateSubtype_Click(object sender, EventArgs e)
    {
        try
        {
            int BID = Convert.ToInt32(Request.QueryString["id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand Cmd = new SqlCommand("update Product_SubType set Product_Subtype_name ='" + txtUpdateSubTypeName.Text + "' where Product_SubType_id='" + BID + "'", con))
                {
                    con.Open();
                    Cmd.ExecuteNonQuery();
                    Response.Write("<Script>alert('Record Updated Successfully')</Script>");
                    txtUpdateSubTypeName.Text = null;
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
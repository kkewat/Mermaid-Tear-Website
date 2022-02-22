using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Products : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            if (!IsPostBack)
          {
                BindProdViewRepeater();
          }
        }
        catch(Exception ex)
        {
            //Console.WriteLine("Exception occurr: " + ex);
            throw ex;
         }
       
    }

    private void BindProdViewRepeater()
    {

    try {
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("BindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ViewRepeater.DataSource = dt;
                        ViewRepeater.DataBind();
                    }
                }
            }
        }
    catch(Exception ex) {

            //Console.WriteLine("Exception occurr: " + ex);
            throw ex;
        }
        
    }
}
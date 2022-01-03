using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Forgot_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Recoverpassword_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-SGG9TB4;Initial Catalog=Gold_Shop;Integrated Security=True"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(@"SELECT *
  FROM[Gold_Shop].[dbo].[User_detail] WHERE Email=@Email", con);
            cmd.Parameters.AddWithValue("@Email", PasswordEmailRecovery.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {

            }
        }
    }
}
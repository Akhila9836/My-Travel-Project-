using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VistorSPList : System.Web.UI.Page
{
    public static string connectionString = "Data Source=.;Initial Catalog=Tour;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadServiceProviders();
        }
    }
    private void LoadServiceProviders()
    {


        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT 
                    sr.uname,
                    sr.cname,
                    sr.email,
                    sr.contact,
                    sr.location,
                    ISNULL(AVG(CAST(b.rate AS FLOAT)), 0) AS AverageRating
                FROM 
                    sp_registration sr
                LEFT JOIN 
                    booking b ON sr.uname = b.auname
                GROUP BY 
                    sr.uname, sr.cname, sr.email, sr.contact, sr.location";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvProviders.DataSource = dt;
            gvProviders.DataBind();
        }
    }

    protected string GetStars(double rating)
    {
        int fullStars = (int)Math.Round(rating);
        return new string('★', fullStars).PadRight(5, '☆');
    }
}
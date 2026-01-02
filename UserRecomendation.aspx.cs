using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRecomendation : System.Web.UI.Page
{
    public static string connectionString = "Data Source=.;Initial Catalog=Tour;Integrated Security=True";
    private List<Destination> _destinations = new List<Destination>
    {
        new Destination { Name = "Paris", Cost = 1000, Rating = 4.8, Category = "Historical" },
        new Destination { Name = "Hawaii", Cost = 1500, Rating = 4.7, Category = "Beach" },
        new Destination { Name = "Dubai", Cost = 1200, Rating = 4.6, Category = "Luxury" },
        new Destination { Name = "Tokyo", Cost = 1100, Rating = 4.9, Category = "Adventure" },
        new Destination { Name = "Bali", Cost = 800, Rating = 4.5, Category = "Beach" }
    };
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public List<Destination> GetDestinations()
    {
        List<Destination> destinations = new List<Destination>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT pname,price, ndays, ftype FROM sp_package";
            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                destinations.Add(new Destination
                {
                    Name = reader["pname"].ToString(),
                    Cost = Convert.ToDouble(reader["price"]),
                    Rating = Convert.ToDouble(reader["ndays"]),
                    Category = reader["ftype"].ToString()
                });
            }
        }

        return destinations;
    }
    protected void btnRecommend_Click(object sender, EventArgs e)
    {
        double budget;
        if (!double.TryParse(txtBudget.Text, out budget))
        {
            lblResult.Text = "Invalid budget amount.";
            return;
        }

        string category = ddlCategory.SelectedValue;
        List<Destination> destinations = GetDestinations();

        GeneticAlgorithm ga = new GeneticAlgorithm(destinations);
        Chromosome bestRecommendation = ga.RunGeneticAlgorithm(50, 10, 3, budget, category);

        lblResult.Text = "<b>Recommended Destinations:</b><br/>";
        foreach (var destination in bestRecommendation.Destinations)
        {
            lblResult.Text += "<br/>- " + destination.Name + " (Price: " + destination.Cost + ", Days: " + destination.Rating + ")";
        }
    }
}
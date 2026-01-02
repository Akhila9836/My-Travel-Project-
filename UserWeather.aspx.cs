using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using System.Security.Policy;
using System.Web.UI.DataVisualization.Charting;


public partial class UserWeather : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGet_Click(object sender, EventArgs e)
    {
        string apiKey = "a38d6bbb8947ebc1cc98c3f3aa376066";  // <-- Replace with your OpenWeatherMap API Key
        string city = txtCity.Text.Trim();
        if (string.IsNullOrEmpty(city))
        {
            lblWeather.Text = "Please enter a city name.";
            return;
        }

        string url = "https://api.openweathermap.org/data/2.5/forecast?q=" + city + "&appid=" + apiKey + "&units=metric";

        try
        {
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;

            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url);
                ForecastWeather forecast = JsonConvert.DeserializeObject<ForecastWeather>(json);

                if (forecast != null && forecast.list != null && forecast.list.Count > 0)
                {
                    var grouped = forecast.list
                        .Where(item => DateTime.Parse(item.dt_txt).Date > DateTime.Today) // Skip today
                        .GroupBy(item => DateTime.Parse(item.dt_txt).Date)
                        .Take(3)
                        .Select(group =>
                            group.OrderBy(f => Math.Abs(DateTime.Parse(f.dt_txt).Hour - 12)).First() // Closest to 12 PM
                        );

                    string result = string.Format("<b>City: {0}</b><br/><br/>", forecast.city.name);

                    chartRain.Series["RainForecast"].Points.Clear();

                    foreach (var f in grouped)
                    {
                        DateTime date = DateTime.Parse(f.dt_txt);
                        result += string.Format(
                             "<b>Date: {0}</b><br/>" +
                             "Time: {1}<br/>" +
                             "Temp: {2} °C<br/>" +
                             "Humidity: {3}%<br/>" +
                             "Condition: {4}<br/><hr/>",
                             date.ToShortDateString(),
                             date.ToShortTimeString(),
                             f.main.temp,
                             f.main.humidity,
                             f.weather[0].description
                         );
                        // Rain volume
                        double rainVolume = 0;
                        if (f.rain != null && f.rain._3h.HasValue)
                            rainVolume = f.rain._3h.Value;

                        chartRain.Series["RainForecast"].Points.AddXY(date.ToString("MMM dd"), rainVolume);
                    }

                    lblWeather.Text = result;
                }
                else
                {
                    lblWeather.Text = "Weather forecast not available for this city.";
                }
            }
        }
        catch (Exception ex)
        {
            lblWeather.Text = "Error: " + ex.Message;
        }
    }
    public void nextday()
    {
        string city = txtCity.Text.Trim();
        string apiKey = "YOUR_API_KEY"; // Replace with your OpenWeatherMap API Key
        string url = "https://api.openweathermap.org/data/2.5/forecast?q={city}&appid={apiKey}&units=metric";

        try
        {
            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url);
                ForecastWeather forecast = JsonConvert.DeserializeObject<ForecastWeather>(json);

                if (forecast != null && forecast.list.Count > 0)
                {
                    // Get tomorrow's date
                    string tomorrow = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                    var tomorrowData = forecast.list.FirstOrDefault(f => f.dt_txt.StartsWith(tomorrow));

                    if (tomorrowData != null)
                    {
                        lblWeather.Text = "City: {forecast.city.name}<br/>" +
                                          "Date & Time: {tomorrowData.dt_txt}<br/>" +
                                          "Temperature: {tomorrowData.main.temp} °C<br/>" +
                                          "Humidity: {tomorrowData.main.humidity}%<br/>" +
                                          "Condition: {tomorrowData.weather[0].description}";
                    }
                    else
                    {
                        lblWeather.Text = "Tomorrow's weather forecast is not available.";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblWeather.Text = "Error: " + ex.Message;
        }

    }
    public ForecastWeather GetWeather(string city)
    {
        try
        {
            string apiKey = "a07d6794778fe9a6b4f80f8c52910cc1";
            string url = "https://api.openweathermap.org/data/2.5/forecast?q=" + city + "&appid=" + apiKey + "&units=metric";


            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url);
                return JsonConvert.DeserializeObject<ForecastWeather>(json);
            }
        }
        catch
        {
            return null;
        }
    }
}
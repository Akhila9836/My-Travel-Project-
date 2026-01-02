using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class UserBookedList : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    public static string cuname = "";
    public static string pid = "";
    public static string ipath,ipath1,ipath2,ipath3 = "";
    public static string budget1, tdata = "";
    public static string connectionString = "Data Source=.;Initial Catalog=Tour;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
      //  Session["cuname"] = "mathew";
        cuname = Session["cuname"].ToString();
        if (!IsPostBack)
        {
            DropDownList7.Items.Insert(0, new System.Web.UI.WebControls.ListItem("SELECT", "0"));
          //  ob.dr = ob.ret_dr("select * from booking where cuname='" + cuname + "' and status=0 and Convert(date, tdate,104) >=getdate()");
            ob.dr = ob.ret_dr("select * from booking where cuname='" + cuname + "' and status=1");
            while (ob.dr.Read())
            {
                DropDownList7.Items.Add(ob.dr[0].ToString());
              //  pid = ob.dr[1].ToString();

            }
        }
    }

    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox15.Text = DropDownList7.SelectedItem.ToString();
        ob.dr = ob.ret_dr("select pid from booking where bid=" + DropDownList7.SelectedItem.ToString() + " and status=1");
        if (ob.dr.Read())
        {

            pid = ob.dr[0].ToString();

        }
        ob.dr = ob.ret_dr("select * from sp_package where pid=" + pid + "");
        if (ob.dr.Read())
        {
            lblCName.Text = ob.dr[1].ToString();
            lblName.Text = ob.dr[19].ToString();
            lblCity.Text = ob.dr[20].ToString();
            Label22.Text = ob.dr[5].ToString();
            Label24.Text = ob.dr[6].ToString();
            Label26.Text = ob.dr[3].ToString();

            TextBox6.Text = ob.dr[4].ToString();
            string inc = ob.dr[16].ToString();
            string[] inc1 = inc.Split(':');
            foreach (var word in inc1)
            {
                TextBox7.Text += word + "\r\n";
            }
            string exc = ob.dr[17].ToString();
            string[] exc1 = exc.Split(':');
            foreach (var word in exc1)
            {
                TextBox8.Text += word + "\r\n";
            }
            //  TextBox7.Text = ob.dr[16].ToString();
            //TextBox8.Text = ob.dr[17].ToString();
            TextBox1.Text = ob.dr[15].ToString();
            string tplan = ob.dr[21].ToString();
            string[] tplan1 = tplan.Split('#');
            foreach (var word in tplan1)
            {
                TextBox9.Text += word + "\r\n";
            }

            ipath = ob.dr[11].ToString();
            ipath1 = ob.dr[12].ToString();
            ipath2 = ob.dr[12].ToString();
            ipath3 = ob.dr[14].ToString();



        }
        ob.dr = ob.ret_dr("select * from booking where bid=" + DropDownList7.SelectedItem.ToString() + "");
        if (ob.dr.Read())
        {
            TextBox5.Text = ob.dr[8].ToString();
            TextBox2.Text = ob.dr[9].ToString();
            TextBox3.Text = ob.dr[11].ToString();
            TextBox4.Text = ob.dr[10].ToString();
            TextBox12.Text = ob.dr[12].ToString();
            TextBox13.Text = ob.dr[13].ToString();
            TextBox14.Text = ob.dr[14].ToString();
            TextBox10.Text = ob.dr[16].ToString();
            TextBox11.Text = ob.dr[17].ToString();
        }
        TextBox16.Text = (Convert.ToDouble(TextBox12.Text) - Convert.ToDouble(TextBox10.Text)).ToString();
        ob.dr = ob.ret_dr("select contact from sp_registration where uname='" + lblName.Text + "'");
        if (ob.dr.Read())
        {
            lblContact.Text = ob.dr[0].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=StyledBookingDetails.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            using (MemoryStream ms = new MemoryStream())
            {
                Document doc = new Document(PageSize.A4, 20f, 20f, 30f, 30f);
                PdfWriter writer = PdfWriter.GetInstance(doc, ms);
                doc.Open();

                // Light background color for full page
                PdfContentByte canvas = writer.DirectContentUnder;
                canvas.SetColorFill(new BaseColor(230, 240, 255)); // Light Blue Background
                canvas.Rectangle(0, 0, PageSize.A4.Width, PageSize.A4.Height);
                canvas.Fill();

                // Load fonts
                Font headerFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.WHITE);
                Font tableHeaderFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.WHITE);
                Font textFont = FontFactory.GetFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);

                // Header Table (Single Row: Logo + Title with Same Background)
                PdfPTable headerTable = new PdfPTable(2);
                headerTable.WidthPercentage = 100;
                headerTable.SetWidths(new float[] { 1.5f, 3f });

                BaseColor headerBgColor = new BaseColor(0, 102, 204); // Blue Background

                // Load Logo Image
                string logoPath = Server.MapPath("~/Images/logo.png");
                PdfPCell logoCell;
                if (File.Exists(logoPath))
                {
                    iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoPath);
                    logo.ScaleToFit(50f, 50f);
                    logoCell = new PdfPCell(logo)
                    {
                        Border = PdfPCell.NO_BORDER,
                        HorizontalAlignment = Element.ALIGN_LEFT,
                        VerticalAlignment = Element.ALIGN_MIDDLE,
                        PaddingLeft = 10,
                        BackgroundColor = headerBgColor // Set same background color
                    };
                }
                else
                {
                    logoCell = new PdfPCell(new Phrase("No Logo", textFont))
                    {
                        Border = PdfPCell.NO_BORDER,
                        BackgroundColor = headerBgColor
                    };
                }
                headerTable.AddCell(logoCell);
                // Load fonts
                Font brandFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLDOBLIQUE, 24, BaseColor.WHITE); // Stylish & Large for "VoyageVista"
                Font standardFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 14, BaseColor.WHITE); // Standard for "Booking Information"

                // Create inner table with 2 columns for alignment
                PdfPTable titleTable = new PdfPTable(2);
                titleTable.WidthPercentage = 100;
                titleTable.SetWidths(new float[] { 1f, 1f }); // Equal width for both columns

                // Left-aligned "VoyageVista"
                PdfPCell brandCell = new PdfPCell(new Phrase("VoyageVista", brandFont))
                {
                    Border = PdfPCell.NO_BORDER,
                    HorizontalAlignment = Element.ALIGN_LEFT,
                    VerticalAlignment = Element.ALIGN_MIDDLE,
                    PaddingBottom = 5
                };

                // Right-aligned "Booking Information"
                PdfPCell infoCell = new PdfPCell(new Phrase("Booking Information", standardFont))
                {
                    Border = PdfPCell.NO_BORDER,
                    HorizontalAlignment = Element.ALIGN_RIGHT,
                    VerticalAlignment = Element.ALIGN_MIDDLE,
                    PaddingBottom = 5
                };

                // Add cells to title table
                titleTable.AddCell(brandCell);
                titleTable.AddCell(infoCell);

                // Create main title cell with background color
                PdfPCell titleCell = new PdfPCell(titleTable)
                {
                    BackgroundColor = headerBgColor, // Same background as logo
                    Padding = 10,
                    Border = PdfPCell.NO_BORDER
                };
                headerTable.AddCell(titleCell);

                doc.Add(headerTable);
                doc.Add(new Chunk("\n"));

                // Main Content Table (2 Rows, 2 Columns)
                PdfPTable contentTable = new PdfPTable(2);
                contentTable.WidthPercentage = 100;
                contentTable.SetWidths(new float[] { 1f, 1f });

                // Column 1: Booking Details
                PdfPTable detailsTable = new PdfPTable(2);
                detailsTable.WidthPercentage = 100;
                detailsTable.SetWidths(new float[] { 2f, 3f });

                AddStyledTableRow(detailsTable, "Reference Code", TextBox15.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Customer Name", cuname, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Package Name", lblCName.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Agency Name", lblName.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Emergency No", lblContact.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Location", lblCity.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Booking Date", TextBox14.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "No of Days", Label22.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "No of Person", TextBox5.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Room Type", TextBox2.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Food", TextBox4.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Vehicle", TextBox3.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Journey Date", TextBox13.Text, tableHeaderFont, textFont);
                AddStyledTableRow(detailsTable, "Total Amount", "Rs " + TextBox12.Text + " /-", tableHeaderFont, textFont);

                PdfPCell detailsCell = new PdfPCell(detailsTable)
                {
                    Border = PdfPCell.NO_BORDER
                };
                contentTable.AddCell(detailsCell);

                // Column 2: Images (2x2 Grid)
                PdfPTable imagesTable = new PdfPTable(2);
                imagesTable.WidthPercentage = 100;
                imagesTable.SetWidths(new float[] { 1f, 1f });

                string[] imagePaths = { Server.MapPath(ipath), Server.MapPath(ipath1), Server.MapPath(ipath2), Server.MapPath(ipath3) };
                bool imageAdded = false;

                foreach (var path in imagePaths)
                {
                    if (File.Exists(path))
                    {
                        iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(path);
                        img.ScaleToFit(100f, 100f);
                        PdfPCell imgCell = new PdfPCell(img)
                        {
                            Border = PdfPCell.NO_BORDER,
                            Padding = 5,
                            HorizontalAlignment = Element.ALIGN_CENTER
                        };
                        imagesTable.AddCell(imgCell);
                        imageAdded = true;
                    }
                }

                // Fill empty cells if fewer than 4 images
                while (imagesTable.Rows.Count < 2)
                {
                    PdfPCell emptyCell = new PdfPCell(new Phrase(""))
                    {
                        Border = PdfPCell.NO_BORDER
                    };
                    imagesTable.AddCell(emptyCell);
                }

                // If no images, display a message
                if (!imageAdded)
                {
                    PdfPCell noImageCell = new PdfPCell(new Phrase("No Images Available", textFont))
                    {
                        Colspan = 2,
                        HorizontalAlignment = Element.ALIGN_CENTER,
                        Border = PdfPCell.NO_BORDER,
                        Padding = 10
                    };
                    imagesTable.AddCell(noImageCell);
                }

                PdfPCell imagesCell = new PdfPCell(imagesTable)
                {
                    Border = PdfPCell.NO_BORDER
                };
                contentTable.AddCell(imagesCell);

                doc.Add(contentTable);
                doc.Add(new Chunk("\n"));

                // Tour Plan - Full Width Box
                Font sectionHeaderFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 14, BaseColor.WHITE);
                Font sectionContentFont = FontFactory.GetFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);
                BaseColor sectionBgColor = new BaseColor(0, 102, 204); // Light blue background for sections

                // Create a full-width table for Tour Plan, Inclusions, and Exclusions
                PdfPTable infoTable = new PdfPTable(1);
                infoTable.WidthPercentage = 100;

                // Tour Plan Section
                PdfPCell tourPlanHeader = new PdfPCell(new Phrase("Tour Plan", sectionHeaderFont))
                {
                    BackgroundColor = sectionBgColor,
                    Padding = 8,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    Border = PdfPCell.NO_BORDER
                };
                PdfPCell tourPlanContent = new PdfPCell(new Phrase(TextBox9.Text, sectionContentFont))
                {
                    Padding = 8,
                    Border = PdfPCell.BOX
                };
                infoTable.AddCell(tourPlanHeader);
                infoTable.AddCell(tourPlanContent);

                // Inclusions Section
                PdfPCell inclusionsHeader = new PdfPCell(new Phrase("Inclusions", sectionHeaderFont))
                {
                    BackgroundColor = sectionBgColor,
                    Padding = 8,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    Border = PdfPCell.NO_BORDER
                };
                PdfPCell inclusionsContent = new PdfPCell(new Phrase(TextBox7.Text, sectionContentFont))
                {
                    Padding = 8,
                    Border = PdfPCell.BOX
                };
                infoTable.AddCell(inclusionsHeader);
                infoTable.AddCell(inclusionsContent);

                // Exclusions Section
                PdfPCell exclusionsHeader = new PdfPCell(new Phrase("Exclusions", sectionHeaderFont))
                {
                    BackgroundColor = sectionBgColor,
                    Padding = 8,
                    HorizontalAlignment = Element.ALIGN_CENTER,
                    Border = PdfPCell.NO_BORDER
                };
                PdfPCell exclusionsContent = new PdfPCell(new Phrase(TextBox8.Text, sectionContentFont))
                {
                    Padding = 8,
                    Border = PdfPCell.BOX
                };
                infoTable.AddCell(exclusionsHeader);
                infoTable.AddCell(exclusionsContent);

                // Add to the document
                doc.Add(infoTable);
                doc.Close();

                Response.BinaryWrite(ms.ToArray());
                Response.End();
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error generating PDF: " + ex.Message);
        }
        double budget;
        

       
        List<Destination> destinations = GetDestinations();

        GeneticAlgorithm ga = new GeneticAlgorithm(destinations);
        Chromosome bestRecommendation = ga.RunGeneticAlgorithm(50, 10, 3, Convert.ToDouble(Label26.Text), lblCity.Text);

        tdata = "<b>Recommended Destinations:</b><br/>";
        foreach (var destination in bestRecommendation.Destinations)
        {
            tdata += "<br/>- " + destination.Name + " (Price: " + destination.Cost + ", Days: " + destination.Rating + ")";
        }
    }
    private void AddStyledTableRow(PdfPTable table, string label, string value, Font headerFont, Font textFont)
    {
        PdfPCell labelCell = new PdfPCell(new Phrase(label, headerFont))
        {
            BackgroundColor = new BaseColor(0, 102, 204),
            Padding = 5,
            Border = PdfPCell.NO_BORDER
        };

        PdfPCell valueCell = new PdfPCell(new Phrase(value, textFont))
        {
            Padding = 5,
            Border = PdfPCell.NO_BORDER
        };

        table.AddCell(labelCell);
        table.AddCell(valueCell);
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
    private byte[] GetImageFromDatabase(string customerName)
    {
        try
        {
            string connectionString = "Your_Connection_String_Here";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ImageData FROM Bookings WHERE CustomerName = @CustomerName";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CustomerName", customerName);
                    object result = cmd.ExecuteScalar();

                    if (result != DBNull.Value && result != null)
                    {
                        return (byte[])result;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error retrieving image: " + ex.Message);
        }

        return null;
    }

}
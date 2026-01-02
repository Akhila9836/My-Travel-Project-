using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgentCreatePackage : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    public static string document2 = "", document3 = "", document4 = "", document21 = "", document31 = "", document41 = "", document22 = "", document32 = "", document42 = "", document23 = "", document33 = "", document43 = "";

    public static int sid;
    public static string auname;
   
    protected void Page_Load(object sender, EventArgs e)
    {
      //  Session["auname"] = "ajotravel";
        auname = Session["auname"].ToString();
        
        if (!IsPostBack)
        {

            DropDownList3.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList3.Items.Insert(1, new ListItem("Apartment", "1"));
            DropDownList3.Items.Insert(2, new ListItem("Double Room", "2"));
            DropDownList3.Items.Insert(3, new ListItem("King Room", "3"));
            DropDownList3.Items.Insert(4, new ListItem("Deluxe Room", "4"));
            DropDownList3.Items.Insert(5, new ListItem("Home Stay", "5"));
            //DropDownList2.Items.Insert(5, new ListItem("Townhouse", "5"));
            //DropDownList2.Items.Insert(6, new ListItem("Shop", "6"));
            //DropDownList2.Items.Insert(7, new ListItem("Building", "7"));
            //DropDownList2.Items.Insert(8, new ListItem("Garage", "8"));
            DropDownList2.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList2.Items.Insert(1, new ListItem("vegetarian", "1"));
            DropDownList2.Items.Insert(2, new ListItem("Non vegetarian", "2"));
            DropDownList2.Items.Insert(3, new ListItem("Three Star", "3"));
            DropDownList2.Items.Insert(4, new ListItem("Four Star", "4"));
            DropDownList1.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList1.Items.Insert(1, new ListItem("Swift Car", "1"));
            DropDownList1.Items.Insert(2, new ListItem("Traveller", "2"));
            DropDownList1.Items.Insert(3, new ListItem("Dzire", "3"));
            DropDownList1.Items.Insert(4, new ListItem("Innova", "4"));
            




        }
        // TextBox11.Text = DateTime.Today.AddDays(5).ToShortDateString();
        getid();
    }
    void getid()
    {
        ob.dr = ob.ret_dr("select isnull(max(pid),200)+1 from sp_package");
        if (ob.dr.Read())
        {
            TextBox8.Text = ob.dr[0].ToString();
        }
    }

    protected void FileUpload1_Load(object sender, EventArgs e)
    {
        try
        {
            document2 = Server.MapPath("~/mdesign/" + "/");
            if (!Directory.Exists(document2))
                Directory.CreateDirectory(document2);
            if (FileUpload1.HasFile)
            {
                try
                {
                    // document2 = document2 + FileUpload1.FileName.Trim(' ');
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(document2 + TextBox8.Text + extension);
                    document3 = TextBox8.Text + extension;
                }
                catch (Exception ex)
                { }

            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void FileUpload2_Load(object sender, EventArgs e)
    {
        try
        {
            document21 = Server.MapPath("~/sdesign1/" + "/");
            if (!Directory.Exists(document21))
                Directory.CreateDirectory(document21);
            if (FileUpload2.HasFile)
            {
                try
                {
                    // document2 = document2 + FileUpload1.FileName.Trim(' ');
                    string extension = Path.GetExtension(FileUpload2.PostedFile.FileName);
                    FileUpload2.SaveAs(document21 + TextBox8.Text + extension);
                    document31 = TextBox8.Text + extension;
                }
                catch (Exception ex)
                { }

            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void FileUpload3_Load(object sender, EventArgs e)
    {
        try
        {
            document22 = Server.MapPath("~/sdesign2/" + "/");
            if (!Directory.Exists(document22))
                Directory.CreateDirectory(document22);
            if (FileUpload3.HasFile)
            {
                try
                {
                    // document2 = document2 + FileUpload1.FileName.Trim(' ');
                    string extension = Path.GetExtension(FileUpload3.PostedFile.FileName);
                    FileUpload3.SaveAs(document22 + TextBox8.Text + extension);
                    document32 = TextBox8.Text + extension;
                }
                catch (Exception ex)
                { }

            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void FileUpload4_Load(object sender, EventArgs e)
    {
        try
        {
            document23 = Server.MapPath("~/sdesign3/" + "/");
            if (!Directory.Exists(document23))
                Directory.CreateDirectory(document23);
            if (FileUpload3.HasFile)
            {
                try
                {
                    // document2 = document2 + FileUpload1.FileName.Trim(' ');
                    string extension = Path.GetExtension(FileUpload4.PostedFile.FileName);
                    FileUpload4.SaveAs(document23 + TextBox8.Text + extension);
                    document33 = TextBox8.Text + extension;
                }
                catch (Exception ex)
                { }

            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox10.Text == "" || TextBox9.Text == "" || TextBox12.Text == "" || TextBox13.Text == "" || TextBox6.Text == "" || TextBox3.Text == "" || TextBox1.Text == "" || TextBox15.Text == "" || TextBox2.Text == "" || TextBox4.Text == "")
        {
            Label11.Visible = true;
            Label11.ForeColor = System.Drawing.Color.Red;
            Label11.Text = "Please Enter all fields correctly!";
        }
        else
        {

            document4 = "mdesign/" + document3;
            document41 = "sdesign1/" + document31;
            document42 = "sdesign2/" + document32;
            document43 = "sdesign3/" + document33;
            if (!ob.dr.Read())
            {
                ob.exec("insert into sp_package values(" + TextBox8.Text + ",'" + TextBox3.Text + "'," + TextBox6.Text + ",'" + TextBox10.Text + "',('" + TextBox9.Text + "')," + TextBox12.Text + "," + TextBox13.Text + ",'" + DropDownList3.SelectedItem.ToString() + "',('" + TextBox1.Text + "'),'" + DropDownList2.SelectedItem.ToString() + "','" + DropDownList1.SelectedItem.ToString() + "','" + document4 + "','" + document41 + "','" + document42 + "','" + document43 + "',('" + TextBox15.Text + "'),('" + TextBox2.Text + "'),('" + TextBox4.Text + "'),0,'" + auname + "','" + TextBox5.Text + "',('" + TextBox16.Text +"'))");


                Label11.Visible = true;
                Label11.ForeColor = System.Drawing.Color.Green;
                Label11.Text = "Data stored successfully !";

                TextBox3.Text = "";
                TextBox10.Text = "";

                TextBox9.Text = "";
                TextBox12.Text = "";
                TextBox13.Text = "";
                TextBox6.Text = "";


                //TextBox6.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Package Added Successfully');", true);
                // Response.Redirect("ShopAdminAddStock.aspx");
            }
            else
            {
                Label11.Visible = true;
                Label11.Text = "Failure Transcation!";
            }
        }
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
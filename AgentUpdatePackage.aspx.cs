using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Reflection.Emit;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel.Channels;

public partial class AgentUpdatePackage : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    public static string auname = "";
    public static string pid = "";
    public static string d1 = "", d2 = "", d3 = "";


    public static string str2, j, subject1, message, mid = "";
    public const string PORT = "smtp.gmail.com";
    public static string FROM = "smarttutortvm@gmail.com";
    public static string PASSWORD = "sdlu ridf twei oyaj";
    //public static string PASSWORD = "";
    public static string TO = "";
    public static string htmlmessage = "";
    public static string subject = "Mail Notification from VoyageVista";
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["auname"] = "ajotravel";
        auname = Session["auname"].ToString();
        if (!IsPostBack)
        {
            DropDownList4.Items.Insert(0, new ListItem("SELECT", "0"));
            ob.dr = ob.ret_dr("select * from sp_package where auname='" + auname + "' and status=0");
            while (ob.dr.Read())
            {
                DropDownList4.Items.Add(ob.dr[0].ToString());
               

            }
            DropDownList3.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList2.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList1.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList3.Items.Insert(1, new ListItem("Apartment", "1"));
            DropDownList3.Items.Insert(2, new ListItem("Double Room", "2"));
            DropDownList3.Items.Insert(3, new ListItem("King Room", "3"));
            DropDownList3.Items.Insert(4, new ListItem("Deluxe Room", "4"));
            DropDownList3.Items.Insert(5, new ListItem("Home Stay", "5"));         
            DropDownList2.Items.Insert(1, new ListItem("vegetarian", "1"));
            DropDownList2.Items.Insert(2, new ListItem("Non vegetarian", "2"));
            DropDownList2.Items.Insert(3, new ListItem("Three Star", "3"));
            DropDownList2.Items.Insert(4, new ListItem("Four Star", "4"));
            DropDownList1.Items.Insert(1, new ListItem("Swift Car", "1"));
            DropDownList1.Items.Insert(2, new ListItem("Traveller", "2"));
            DropDownList1.Items.Insert(3, new ListItem("Dzire", "3"));
            DropDownList1.Items.Insert(4, new ListItem("Innova", "4"));
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string v, a, f = ""; 
        if(DropDownList3.SelectedItem.ToString() == "SELECT")
        {
            a = d1;
        }
        else
        {
            a = DropDownList3.SelectedItem.ToString();
        }
        if (DropDownList2.SelectedItem.ToString() == "SELECT")
        {
            f = d2;
        }
        else
        {
            f = DropDownList2.SelectedItem.ToString();
        }
        if (DropDownList1.SelectedItem.ToString() == "SELECT")
        {
            v = d3;
        }
        else
        {
            v = DropDownList1.SelectedItem.ToString();
        }
        ob1.exec("update sp_package set pname=('" + TextBox3.Text + "'), ndays=" + TextBox6.Text + ", price='" + TextBox10.Text + "', details=('" + TextBox9.Text + "'),tdays=" + TextBox12.Text + ", tnight=" + TextBox13.Text + ", adetails=('" + TextBox1.Text + "'), highlight=('" + TextBox15.Text + "'), inclusion=('" + TextBox2.Text + "'),exclusion=('" + TextBox4.Text + "'),accomadation='" + a + "',ftype='" + f + "',vehicle='" + v + "',tplan=('" + TextBox16.Text + "') where pid=" + DropDownList4.SelectedItem.ToString() + "");
        Label11.Visible = true;
        Label11.ForeColor = System.Drawing.Color.Green;
        Label11.Text = "Update Successfully";

        List<string> userEmails = new List<string>();

        ob1.dr = ob1.ret_dr("SELECT DISTINCT u.emailid FROM user_registration u JOIN booking b ON u.uname = b.cuname WHERE b.pid = " + DropDownList4.SelectedItem.ToString()+"");
        while (ob1.dr.Read())
        {
            userEmails.Add(ob1.dr["emailid"].ToString());
        }
        foreach (string email in userEmails)
        {
            string msg = "The package you booked (ID: " + DropDownList4.SelectedItem.ToString() + ") has been updated.";
            //ob1.exec("INSERT INTO notifications (email, message, created_at) VALUES ('" + email + "', '" + msg + "', GETDATE())");
            mail("anoop.yuvatech@gmail.com", msg);
           // mail(ob1.dr[0].ToString(), msg);
           
        }

    }
    public void sendMail(string htmlmessage, string subject)
    {
        try
        {

            string date = System.DateTime.Now.ToShortDateString();
            string time = System.DateTime.Now.ToShortTimeString();
            string HtmlMessage = htmlmessage;
            MailMessage MyMailMessage = new MailMessage(FROM, TO, subject, HtmlMessage);
            MyMailMessage.IsBodyHtml = true;
            NetworkCredential mailAuthentication = new NetworkCredential(FROM, PASSWORD);
            SmtpClient mailClient = new SmtpClient(PORT, 587);
            mailClient.EnableSsl = true;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = mailAuthentication;
            mailClient.Send(MyMailMessage);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Mail has been send......');", true);
            //Panel1.Visible = false;
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Mail sending failed......');", true);
        }

    }
    public void mail(string t, string msg)
    {
        try
        {
            string date = System.DateTime.Now.ToShortDateString();
            subject1 = "Message From VoyageVista";
            message = msg;
            TO = t;
            j = "Mail From VoyageVistaR";
            htmlmessage = "<html><head><b><title>VoyageVista</title></b><div align=center><h1><u>VoyageVista<u></h1></div><div align=left><u>Mail From VoyageVista</u></div></br></br></head><body><div align=left></br></br>Subject:" + subject1 + "</br></br></br></br><div></div>Message:" + message + " </div></body></html>";
            sendMail(htmlmessage, subject);
        }
        catch (Exception ex)
        {
        }
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {

    }

    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {

        ob.dr = ob.ret_dr("select * from sp_package where pid=" + DropDownList4.SelectedItem.ToString() + "");
        if (ob.dr.Read())
        {
            
            TextBox8.Text = ob.dr[0].ToString();
            TextBox3.Text = ob.dr[1].ToString();
            TextBox6.Text = ob.dr[2].ToString();
            TextBox10.Text = ob.dr[3].ToString();
            TextBox9.Text = ob.dr[4].ToString();
            TextBox12.Text = ob.dr[5].ToString();
            TextBox13.Text = ob.dr[6].ToString();
            TextBox1.Text = ob.dr[8].ToString();
            TextBox15.Text = ob.dr[15].ToString();
            TextBox2.Text = ob.dr[16].ToString();
            TextBox4.Text = ob.dr[17].ToString();
            TextBox5.Text = ob.dr[20].ToString();
            TextBox16.Text = ob.dr[21].ToString();
            d1 = ob.dr[7].ToString();
            d2 = ob.dr[9].ToString();
            d3 = ob.dr[10].ToString();
            //DropDownList3.Items.Insert(0, new ListItem(ob.dr[7].ToString(), "0"));
            //  DropDownList3.SelectedValue = ob.dr[7].ToString();
            //  DropDownList2.Text = ob.dr[9].ToString();
            // DropDownList1.Text = ob.dr[10].ToString();
            // DropDownList2.Items.Insert(0, new ListItem(ob.dr[9].ToString(), "0"));
            //  DropDownList1.Items.Insert(0, new ListItem(ob.dr[10].ToString(), "0"));


        }
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
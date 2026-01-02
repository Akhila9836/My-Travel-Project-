using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCancelBooking : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    public static string cuname = "";
    public static string pid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["cuname"] = "mathew";
        cuname = Session["cuname"].ToString();
        if (!IsPostBack)
        {
            DropDownList7.Items.Insert(0, new ListItem("SELECT", "0"));
            ob.dr = ob.ret_dr("select * from booking where cuname='" + cuname + "' and status=0 and Convert(date, tdate,104) >=getdate()");
            while (ob.dr.Read())
            {
                DropDownList7.Items.Add(ob.dr[0].ToString());
                pid = ob.dr[1].ToString();

            }
        }
    }

    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox15.Text = DropDownList7.SelectedItem.ToString();
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
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ob1.exec("update booking set status=2 where bid="+DropDownList7.SelectedItem.ToString()+"");
        //Response.Redirect("UserListPackage.aspx");
        double rfund = (Convert.ToDouble(TextBox10.Text) - 3000);
        Label18.Visible = true;
        Label18.ForeColor = System.Drawing.Color.Green;
        Label18.Text = "Cancellation Successfully !  Amount "+rfund+" Refunded to your account after 2 days Thank you";

    }
}
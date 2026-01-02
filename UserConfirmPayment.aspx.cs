using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserConfirmPayment : System.Web.UI.Page
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
            ob.dr = ob.ret_dr("select * from booking where cuname='"+cuname+"' and status=0");
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
            TextBox7.Text = "";
            string[] inc1 = inc.Split(':');
            foreach (var word in inc1)
            {
                TextBox7.Text += word + "\r\n";
            }
            TextBox8.Text = "";
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
            TextBox18.Text = "";
            string[] tplan1 = tplan.Split('#');
            foreach (var word in tplan1)
            {
                TextBox18.Text += word + "\r\n";
            }




        }
        ob.dr = ob.ret_dr("select * from booking where bid=" + DropDownList7.SelectedItem.ToString()+ "");
        if (ob.dr.Read())
        {
            TextBox5.Text = ob.dr[8].ToString();
            TextBox2.Text = ob.dr[9].ToString();
            TextBox3.Text = ob.dr[11].ToString();
            TextBox4.Text = ob.dr[10].ToString();
            TextBox12.Text = ob.dr[12].ToString();
            TextBox13.Text = ob.dr[13].ToString();
            TextBox14.Text = ob.dr[14].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox9.Text = (Convert.ToDouble(TextBox12.Text) / 2).ToString();
        txtUPIAmount.Text = TextBox9.Text;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string paymentMethod = rblPaymentMethod.SelectedValue;
        string amount = "";
        string details = "";

        if (paymentMethod == "Card")
        {
            amount = TextBox9.Text;
            string cardNumber = TextBox10.Text;
            string validUpto = TextBox16.Text;
            string cardHolder = TextBox11.Text;
            string cvv = TextBox17.Text;

            ob1.exec("update booking set status=1, pamount=" + TextBox9.Text + ", pdate='" + DateTime.Now.ToShortDateString() + "' where bid=" + DropDownList7.SelectedItem.ToString() + "");
            Label18.Visible = true;
            Label18.ForeColor = System.Drawing.Color.Green;
            Label18.Text = "Payment Successfull";
        
            
            string last4 = cardNumber.Length >= 4 ? cardNumber.Substring(cardNumber.Length - 4) : "XXXX";
            details = "Card Holder: " + cardHolder + "<br />Card Ending: **** **** **** " + last4;
        }
        else if (paymentMethod == "UPI")
        {
            string upiAmount = txtUPIAmount.Text;
            amount = upiAmount;
            string upiId = txtUPIID.Text;

            ob1.exec("update booking set status=1, pamount=" + txtUPIAmount.Text + ", pdate='" + DateTime.Now.ToShortDateString() + "' where bid=" + DropDownList7.SelectedItem.ToString() + "");
            Label18.Visible = true;
            Label18.ForeColor = System.Drawing.Color.Green;
            Label18.Text = "Payment Successfull";
          
            details = "UPI ID: " + upiId;
           
        }
        lblReceiptDate.Text = "Date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm tt");
        lblReceiptMethod.Text = "Payment Method: " + paymentMethod;
        lblReceiptAmount.Text = "Amount Paid: ₹" + amount;
        lblReceiptDetails.Text = details;

        pnlReceipt.Visible = true;

    }

    protected void rblPaymentMethod_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblPaymentMethod.SelectedValue == "Card")
        {
            pnlCardPayment.Visible = true;
            pnlUPIPayment.Visible = false;
        }
        else if (rblPaymentMethod.SelectedValue == "UPI")
        {
            pnlCardPayment.Visible = false;
            pnlUPIPayment.Visible = true;
        }
    }
}
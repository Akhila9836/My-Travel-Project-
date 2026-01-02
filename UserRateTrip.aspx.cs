using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRateTrip : System.Web.UI.Page
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
            DropDownList3.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList3.Items.Insert(1, new ListItem("BAD", "1"));
            DropDownList3.Items.Insert(2, new ListItem("AVERAGE", "2"));
            DropDownList3.Items.Insert(3, new ListItem("GOOD", "3"));
            DropDownList3.Items.Insert(4, new ListItem("EXCELLENT", "4"));
           
            ob.dr = ob.ret_dr("select * from booking where cuname='" + cuname + "' and status=1");
           // ob.dr = ob.ret_dr("select * from booking where cuname='" + cuname + "' and status=1 and Convert(date, tdate,104) >=getdate()");
            while (ob.dr.Read())
            {
                DropDownList7.Items.Add(ob.dr[0].ToString());
                pid = ob.dr[1].ToString();

            }
        }
    }

    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        ob.dr = ob.ret_dr("select * from sp_package where pid=" + pid + "");
        if (ob.dr.Read())
        {
            lblCName.Text = ob.dr[1].ToString();
            lblName.Text = ob.dr[19].ToString();
            lblCity.Text = ob.dr[20].ToString();
            Label22.Text = ob.dr[5].ToString();
            Label24.Text = ob.dr[6].ToString();
           

        }
        ob.dr = ob.ret_dr("select * from booking where bid=" + DropDownList7.SelectedItem.ToString() + "");
        if (ob.dr.Read())
        {
            TextBox5.Text = ob.dr[8].ToString();
            TextBox2.Text = ob.dr[9].ToString();
            
           
            TextBox2.Text = ob.dr[12].ToString();
            TextBox12.Text = ob.dr[13].ToString();


        }
        
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    public string getid()
    {
        string id = "";
        ob.dr = ob.ret_dr("select isnull(max(rid),400)+1 from rating");
        if (ob.dr.Read())
        {
            id = ob.dr[0].ToString();
        }
        return id;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == "" || TextBox3.Text == ""  )
        {
            Label18.Visible = true;
            Label18.ForeColor = System.Drawing.Color.Red;
            Label18.Text = "Please Enter all fields correctly!";
        }
        else
        {
            string bookid = getid();
            
            ob.exec("insert into rating values(" + bookid + "," + pid + "," + DropDownList7.SelectedItem.ToString()+ ",'" + lblName.Text + "','" + cuname + "','" + lblCName.Text + "','" + lblCity.Text + "'," + TextBox5.Text + "," + TextBox2.Text+ ",'" + DropDownList3.SelectedItem.ToString() + "','" + TextBox3.Text + "',0)");
            ob1.exec("update booking set status=2 where bid=" + DropDownList7.SelectedItem.ToString() + "");
            Label18.Visible = true;
            Label18.ForeColor = System.Drawing.Color.Green;
            Label18.Text = "Data stored successfully ! Your Reference Code is " + bookid;
            TextBox3.Text = "";
            TextBox2.Text = "";

        }
    }
}
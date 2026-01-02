using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgentDeletePackage : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    public static string auname = "";
    public static string pid = "";

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
            // DropDownList3.Items.Insert(0, new ListItem(ob.dr[7].ToString(), "0"));
            // DropDownList3.Text= ob.dr[7].ToString();
            //  DropDownList2.Text = ob.dr[9].ToString();
            // DropDownList1.Text = ob.dr[10].ToString();
            // DropDownList2.Items.Insert(0, new ListItem(ob.dr[9].ToString(), "0"));
            //  DropDownList1.Items.Insert(0, new ListItem(ob.dr[10].ToString(), "0"));


        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ob1.exec("delete from sp_package where pid=" + DropDownList4.SelectedItem.ToString() + "");
        Label11.Visible = true;
        Label11.ForeColor = System.Drawing.Color.Green;
        Label11.Text = "Update Successfully";
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button2_Click1(object sender, EventArgs e)
    {

    }
}
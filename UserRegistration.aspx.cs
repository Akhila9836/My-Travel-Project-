using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRegistration : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    public static string document2 = "", document3 = "", document4 = "", document21 = "", document31 = "", document41 = "", document22 = "", document32 = "", document42 = "", document23 = "", document33 = "", document43 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList6.Items.Insert(0, new ListItem("GENDER", "0"));
        DropDownList6.Items.Insert(1, new ListItem("MALE", "1"));
        DropDownList6.Items.Insert(2, new ListItem("FEMALE", "2"));
    }
    public int getid()
    {
        int c = 0;
        ob.dr = ob.ret_dr("select isnull(max(uid),100)+1 from user_registration");
        if (ob.dr.Read())
        {
            c = Convert.ToInt32(ob.dr[0].ToString());
        }
        return c;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "" || TextBox8.Text == "" || TextBox9.Text == "" || DropDownList6.SelectedItem.ToString() == "GENDER" || TextBox10.Text=="")
        {
            Label11.Visible = true;
            Label11.ForeColor = System.Drawing.Color.Red;
            Label11.Text = "Please Enter all fields correctly!";
        }
        else
        {
            int uid = getid();

            ob.dr = ob.ret_dr("select username from Login where username='" + TextBox1.Text + "'");
            if (!ob.dr.Read())
            {
                
                string str = "insert into user_registration values(" + uid + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + DropDownList6.SelectedItem.ToString() + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "',0)";
                ob.exec(str);
                ob1.exec("insert into Login values(" + uid + ",'" + TextBox1.Text + "','" + TextBox3.Text + "',0)");
                Label11.Visible = true;
                Label11.ForeColor = System.Drawing.Color.Green;
                Label11.Text = "Your request has been approved!Waiting for Admin Approval";
                Response.Write("<script type = 'text/javascript'>alert('Successfully Complete Thank you');</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
                
                Response.Redirect("Login.aspx");
            }
            else
            {
                Label11.Visible = true;
                Label11.Text = "Username Not Available!";
            }
        }
    }
}
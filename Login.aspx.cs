using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" && TextBox2.Text == "")
        {
            Response.Write("<script>alert('Fill the fields...............')</script>");
        }
        else
        {
            str = "select * from Login where Username='" + TextBox1.Text + "'";
            ob.dr = ob.ret_dr(str);
            if (ob.dr.Read())
            {
                if (ob.dr[2].ToString() == TextBox2.Text)
                {
                    str = "select status from Login where Username='" + TextBox1.Text + "' and Pwd='" + TextBox2.Text + "'";
                    ob1.dr = ob1.ret_dr(str);
                    if (ob1.dr.Read())
                    {
                        Session["uname"] = TextBox1.Text;
                        Session["role"] = ob1.dr[0].ToString();
                        if (ob1.dr[0].ToString() == "1")
                        {


                            Session["cuname"] = TextBox1.Text;
                            Response.Redirect("UserListPackage.aspx");


                        }
                        else if (ob1.dr[0].ToString() == "2")
                        {

                            Session["auname"] = TextBox1.Text;
                            Response.Redirect("AgentCreatePackage.aspx");


                        }

                        else if (ob1.dr[0].ToString() == "3")
                        {
                            Response.Redirect("AdminApproveUser.aspx");

                        }


                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid username or password...')</script>");
                    }
                }
                else
                {
                    //Label1.Text = "Forget ur password...Click Here";
                    //LinkButton1.Visible = true;
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid username or password...')</script>");
            }

        }
    }
}
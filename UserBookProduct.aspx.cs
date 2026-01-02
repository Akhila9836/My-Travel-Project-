using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class UserBookProduct : System.Web.UI.Page
{
    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    DatabaseConnection ob2 = new DatabaseConnection();
    DatabaseConnection ob3 = new DatabaseConnection();
    public static string cuname = "";
    DataSet ds = new DataSet();
    int mid2, cartid;
    string uname, mimage, userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Session["cuname"] = "mathew";
         cuname = Session["cuname"].ToString();
        string mid1 = Request.QueryString[0];
        mid2 = Convert.ToInt32(mid1);
        TextBox11.Text = DateTime.Now.ToShortDateString();
        ob.dr = ob.ret_dr("select * from sp_package where pid=" + mid2 + "");
        if (ob.dr.Read())
        {
            lblCName.Text = ob.dr[1].ToString();
            lblName.Text = ob.dr[19].ToString();
            lblCity.Text = ob.dr[20].ToString();
            Label22.Text = ob.dr[5].ToString();
            Label24.Text = ob.dr[6].ToString();
            Label26.Text = ob.dr[3].ToString();
            TextBox5.Text = "1".ToString();
            TextBox2.Text = ob.dr[7].ToString();
            TextBox3.Text = ob.dr[10].ToString();
            TextBox4.Text = ob.dr[9].ToString();
            TextBox6.Text = ob.dr[4].ToString();
            string inc= ob.dr[16].ToString();
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

            TextBox9.Text = ob.dr[3].ToString();
            string tplan = ob.dr[21].ToString();
            string[] tplan1 = tplan.Split('#');
            foreach (var word in tplan1)
            { 
                TextBox12.Text += word + "\r\n";
            }


        }
        CurrentPageIndex = 0;
        PagedDataSource pgd = new PagedDataSource();
        string str = "select mimg,simg1,simg2,simg3 from sp_package where pid=" + mid2 + "";
        ds = ob1.ret_ds(str);
        pgd.DataSource = ds.Tables[0].DefaultView;
        //pgd.CurrentPageIndex = CurrentPageIndex;
        //pgd.AllowPaging = true;
        //pgd.PageSize = 4;
        DataList1.DataSource = pgd;
        DataList1.DataBind();
        DataList2.DataSource = pgd;
        DataList2.DataBind();
        if (!IsPostBack)
        {
            DropDownList1.Items.Insert(0, new ListItem("SELECT", "0"));
            for (int i = 0; i <= 10; i++)
            {
                DropDownList1.Items.Add(i.ToString());
            }
            DropDownList2.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList2.Items.Insert(1, new ListItem("SINGLE ROOM", "1"));
            DropDownList2.Items.Insert(2, new ListItem("DOUBLE ROOM", "2"));
            DropDownList2.Items.Insert(3, new ListItem("KING ROOM", "3"));
            DropDownList2.Items.Insert(4, new ListItem("QUEEN ROOM", "4"));
            DropDownList2.Items.Insert(5, new ListItem("DELUXE ROOM", "5"));
            DropDownList3.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList3.Items.Insert(1, new ListItem("SWIFT", "1"));
            DropDownList3.Items.Insert(2, new ListItem("DZIRE", "2"));
            DropDownList3.Items.Insert(3, new ListItem("INNOVA", "3"));
            DropDownList3.Items.Insert(4, new ListItem("TRAVLLER", "4"));
            DropDownList3.Items.Insert(5, new ListItem("BUS", "5"));
            DropDownList4.Items.Insert(0, new ListItem("SELECT", "0"));
            DropDownList4.Items.Insert(1, new ListItem("TWO STAR", "1"));
            DropDownList4.Items.Insert(2, new ListItem("BUFFET", "2"));
            DropDownList4.Items.Insert(3, new ListItem("THREE STAR", "3"));
            DropDownList4.Items.Insert(4, new ListItem("FOUR STAR", "4"));
            DropDownList4.Items.Insert(5, new ListItem("FIVE STAR", "5"));
            
        }
        //DropDownList1.Items.Clear();
        //DropDownList2.Items.Clear();
        //DropDownList3.Items.Clear();
        //DropDownList4.Items.Clear();
        


    }
    public int CurrentPageIndex
    {
        get
        {
            if (ViewState["pg"] == null)
                return 0;
            else
                return Convert.ToInt16(ViewState["pg"]);
        }
        set
        {
            ViewState["pg"] = value;
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
       // TextBox2.Text = DropDownList2.SelectedItem.ToString();
       
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
      //  TextBox5.Text = DropDownList1.SelectedItem.ToString();
        
    }

    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
       // TextBox4.Text = DropDownList4.SelectedItem.ToString();
        
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
       // TextBox3.Text = DropDownList3.SelectedItem.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int nper = DropDownList1.SelectedIndex;
        int acc = DropDownList2.SelectedIndex;
        int f = DropDownList4.SelectedIndex;
        int t = DropDownList3.SelectedIndex;
        double amount = Convert.ToDouble(TextBox9.Text)/2;
        double famount = amount+(acc * 2000) + (f * 2000) + (t * 2000);
        double tamount = famount * nper;
        TextBox9.Text = tamount.ToString();
    }
    public string getid()
    {
        string id = "";
        ob.dr = ob.ret_dr("select isnull(max(bid),300)+1 from booking");
        if (ob.dr.Read())
        {
            id = ob.dr[0].ToString();
        }
        return id;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox10.Text == "" || TextBox9.Text == "" || TextBox10.Text == "" || TextBox11.Text == "" || TextBox6.Text == "" || TextBox3.Text == "" || TextBox1.Text == "" || TextBox11.Text == "" || TextBox2.Text == "" || TextBox4.Text == "")
        {
            Label18.Visible = true;
            Label18.ForeColor = System.Drawing.Color.Red;
            Label18.Text = "Please Enter all fields correctly!";
        }
        else
        {
                string bookid = getid();
            string ss = "0";
                string d = Convert.ToDateTime(TextBox10.Text).ToString("dd/MM/yyyy");
              ob.exec("insert into booking values("+bookid+","+ mid2+",'" + lblCName.Text + "','" + lblName.Text + "','"+cuname+"','" + lblCity.Text + "'," + Label22.Text + "," + Label24.Text + "," + DropDownList1.SelectedItem.ToString() + ",'" + DropDownList2.SelectedItem.ToString()+ "','" + DropDownList4.SelectedItem.ToString() + "','" + DropDownList3.SelectedItem.ToString()+ "'," + TextBox9.Text + ",'" + d + "','" + TextBox11.Text + "',0,0,'"+ss+"',0)");
                Label18.Visible = true;
                Label18.ForeColor = System.Drawing.Color.Green;
                Label18.Text = "Data stored successfully ! Your Reference Code is "+bookid;
                TextBox3.Text = "";
                TextBox10.Text = "";

                TextBox9.Text = "";
                TextBox10.Text = "";
                TextBox11.Text = "";
                TextBox6.Text = "";


                //TextBox6.Text = "";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('Package Added Successfully');", true);
                // Response.Redirect("ShopAdminAddStock.aspx");
            
           
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgentInbox : System.Web.UI.Page
{

    DatabaseConnection ob = new DatabaseConnection();
    DatabaseConnection ob1 = new DatabaseConnection();
    public static string name = "";
    public static string fpath = "", s = "", mode = "", str = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["auname"] = "sstravel";
        name = Session["auname"].ToString();

        if (!IsPostBack)
        {
            pub();
        }
    }
    public void pub()
    {
        DataSet ds = new DataSet();
        try
        {
            string str = "select compid,suname,sub,msg,date1 from complaint where status=0 and runame='" + name + "'";
            ds = pubdoc(str);
            if (ds != null)
            {
                dgpublic.Visible = true;
                dgpublic.DataSource = ds;
                dgpublic.DataBind();
            }
            else
            {
                dgpublic.Visible = false;
               // ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('No Complaints available');", true);

            }
        }
        catch (Exception ex)
        {
        }
    }
    public DataSet pubdoc(string str)
    {
        DataSet ds = new DataSet();
        try
        {
            ds = ob.ret_ds(str);

            if (ds.Tables[0].Rows.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }
        catch (Exception ex)
        {
            return null;
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        s = dgpublic.DataKeys[dgpublic.SelectedIndex].ToString();
        TextBox6.Enabled = true;
    }

    protected void dgpublic_SelectedIndexChanged(object sender, EventArgs e)
    {
        ob.exec("update complaint set status=1,reply='" + TextBox6.Text + "',date2='" + DateTime.Now.ToShortDateString() + "' where compid='" + s + "'");
        pub();
        TextBox6.Text = "";
        TextBox6.Enabled = false;
    }
}
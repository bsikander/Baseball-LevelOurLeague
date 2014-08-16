using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["role"] != null)
        {
            if (Session["role"].ToString() != "User")
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("../lgn/login.aspx");
            }
        }
        else
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../lgn/login.aspx");
        }
    }

    
    protected void Page_Load(object sender, EventArgs e)
    {
    
        /*
        if (Session["role"] != null)
        {
            if (Session["role"].ToString() != "User")
            {
                Response.Redirect("../lgn/login.aspx");
            }
        }
        else
        {
            Response.Redirect("../lgn/login.aspx");
        }
         */ 
    }
}

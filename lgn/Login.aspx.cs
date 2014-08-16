using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("RecoverPassword.aspx");
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        //Response.Redirect("UserHomePage.aspx");
       
    }
    protected void Login1_LoggingIn(object sender, LoginCancelEventArgs e)
    {

        if (Membership.ValidateUser(Login1.UserName, Login1.Password))
        {
            if (Roles.IsUserInRole(Login1.UserName, "Administrator"))
            {
                Session["role"] = "Admin";
                Response.Redirect("~/Simple/admin/access/users.aspx");                
                //Response.Redirect("~/Simple/Default.aspx");
            }
            else if (Roles.IsUserInRole(Login1.UserName, "User"))
            {   
                Session["orgname"] = Login1.UserName;
                Session["role"] = "User";
                string orgId = getOrgId(Login1.UserName);
                Session["orgid"] = orgId;
                Response.Redirect("../usr/UserHomePage.aspx");                
            }
            else
            {
                Session["orgname"] = Login1.UserName;
                string orgId= getOrgId(Login1.UserName);
                Session["role"] = "User";
                Session["orgid"] = orgId;

                Response.Redirect("../usr/UserHomePage.aspx");
                //Login1.FailureText = "Invalid Username or Password";
                
            }
        }
        else
        {
            Login1.FailureText = "Invalid Username or Password";
        }  
    }


    private string getOrgId(string userName)
    {
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        DataTable srt = new DataTable();
        //string command = "SELECT organizationID, average, playerName , playerContactNumber FROM player WHERE organizationID = 1 ORDER BY average ASC";
        string command = "SELECT A.orgId FROM Organization A,aspnet_Users B WHERE B.UserId = A.userId AND B.UserName ='" + userName + "'";
        //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

        cmd = new SqlCommand(command, con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        SqlDataAdapter a = new SqlDataAdapter(cmd);
        a.Fill(srt);

        return srt.Rows[0]["orgId"].ToString();

    }



    
}

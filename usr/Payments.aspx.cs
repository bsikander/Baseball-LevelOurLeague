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

public partial class usr_Payments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void FillDropDown()
    {
        /*
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        DataTable srt = new DataTable();
        //string command = "SELECT organizationID, average, playerName , playerContactNumber FROM player WHERE organizationID = 1 ORDER BY average ASC";
        string command = "SELECT * FROM leagues WHERE orgId=" + Session["orgid"].ToString() + " AND status= 'N'";
        //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

        cmd = new SqlCommand(command, con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        SqlDataAdapter a = new SqlDataAdapter(cmd);
        a.Fill(srt);

        ddlLeauges.DataSource = srt;
        ddlLeagues.DataTextField = "leagueId";
        ddlLeagues.DataBind();
         */ 

    }

}

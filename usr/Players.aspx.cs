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
using System.Net;
using System.Data.SqlClient;

public partial class Players : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        //SqlConnection con = new SqlConnection(Connection);
        //SqlCommand cmd;
        //DataTable srt = new DataTable();

        //string command = "SELECT playerId, playerName, playerContactNumber , average FROM player WHERE organizationID = 1 ORDER BY average ASC";
        ////string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

        //cmd = new SqlCommand(command, con);
        //cmd.CommandType = CommandType.Text;
        //cmd.Connection = con;
        
        //SqlDataAdapter a = new SqlDataAdapter(cmd);
        //a.Fill(srt);

        //gvPlayersList.DataSource = SqlDataSource1;
        //gvPlayersList.DataBind();
        //Session["orgId"] = 10;
        if (!IsPostBack)
            FillDropDown();
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
        
    //}
    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddPlayers.aspx");
    }


    private void FillDropDown()
    {
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        DataTable srt = new DataTable();
        //string command = "SELECT organizationID, average, playerName , playerContactNumber FROM player WHERE organizationID = 1 ORDER BY average ASC";
        string command = "SELECT * FROM leagues WHERE orgId=" + Session["orgid"].ToString();
        //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

        cmd = new SqlCommand(command, con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        SqlDataAdapter a = new SqlDataAdapter(cmd);
        a.Fill(srt);

        ddlLeagues.DataSource = srt;
        ddlLeagues.DataTextField = "leagueId";
        ddlLeagues.DataBind();
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        //"server=TAUSEEF;Integrated Security=true;database=soprts_14-dec-2010";
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        Random r = new Random();

        for (int i = 0; i < 100; i++)
        {

            double ran = r.NextDouble() * 5;
            decimal rounded = decimal.Round((decimal)ran, 2);

            //string command = "INSERT INTO player( organizationId , average , player_name , player_contact_no) VALUES (1 ," + rounded + " , 'Name" + i + "' , 'Contact" + i + "') ";
            string command = "INSERT INTO player( leagueId,organizationId ,playerStatus ,average , playerName , playerContactNumber) VALUES (1,130 ,1 , " + rounded + "  , 'Name" + i + "' , 'Contact" + i + "') ";
            //string command = "INSERT INTO player( organizationId , average , player_name , player_contact_no) VALUES (1 ," + (i + 100) + " , 'Name" + i + "' , 'Contact" + i + "') ";
            cmd = new SqlCommand(command, con);
            cmd.Connection.Open();
            int k = cmd.ExecuteNonQuery();
            cmd.Connection.Close();

        }
    }
}

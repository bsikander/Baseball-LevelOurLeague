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
using System.Data.SqlClient;

public partial class usr_AddPlayers : System.Web.UI.Page
{

    private void GetLabelValues()
    { 
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        DataTable srt = new DataTable();

        string id = Session["orgid"].ToString();
        if (id != null)
        {                
            string command = "SELECT * FROM lookupTable WHERE orgId =" + id;
            //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

            cmd = new SqlCommand(command, con);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;

            SqlDataAdapter a = new SqlDataAdapter(cmd);
            a.Fill(srt);

            lblFielding.Text =srt.Rows[0]["fielding"].ToString();
            lblHitting.Text = srt.Rows[0]["hitting"].ToString();
            lblSpeed.Text= srt.Rows[0]["speed"].ToString();
            lblBaseRunning.Text= srt.Rows[0]["baserunning"].ToString();
            lblPitching.Text= srt.Rows[0]["pitching"].ToString();
        }
    }
    private void FillDropDowns()
    {
        for (double i = 0; i <= 5; i = i + 0.1)
        {   
            cmbx_fielding.Items.Add(i.ToString());
            cmbx_hitting.Items.Add(i.ToString());
            cmbx_pitching.Items.Add(i.ToString());
            cmbx_running.Items.Add(i.ToString());
            cmbx_speed.Items.Add(i.ToString());
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //int test = Session["orgid"];
            GetLabelValues();
            FillDropDowns();

            string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd;
            DataTable srt = new DataTable();

            string id = Request.QueryString["PlayerId"];
            if (id != null)
            {
                lblHeading.Text = "Update Player Information";
                string command = "SELECT playerName , playerAge ,playerAddress,playerContactNumber ,fielding,hitting,pitching,baseRunning,speed , average FROM player WHERE playerId =" + Convert.ToInt32(id);
                //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

                cmd = new SqlCommand(command, con);
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;

                SqlDataAdapter a = new SqlDataAdapter(cmd);
                a.Fill(srt);

                txt_playerName.Text = (string)srt.Rows[0]["playerName"];
                //txt_address.Text = (string)srt.Rows[0]["playerAddress"];
                //txt_playerAge.Text = (string)srt.Rows[0]["playerAge"];
                cmbx_fielding.SelectedIndex = Convert.ToInt32 (srt.Rows[0]["fielding"]);
                cmbx_hitting.SelectedIndex = Convert.ToInt32 (srt.Rows[0]["hitting"]);
                cmbx_pitching.SelectedIndex = Convert.ToInt32(srt.Rows[0]["pitching"]);
                cmbx_running.SelectedIndex = Convert.ToInt32(srt.Rows[0]["baseRunning"]);
                cmbx_speed.SelectedIndex = Convert.ToInt32 (srt.Rows[0]["speed"]);
                txt_average.Text = (Convert.ToDouble(srt.Rows[0]["average"])).ToString();
                //txt_contactNumber.Text = (string)srt.Rows[0]["playerContactNumber"];
            }
            else
            {
                txt_average.Visible = false;
                lblAverage.Visible = false;
            }
        }
        
         
         

    }
    protected void txt_submitPlayerInfo1_Click(object sender, EventArgs e)
    {
        //string strSQLconnection = "Data Source=SIKANDER-PC\\SQLEXPRESS;Initial Catalog=sports_old; uid=sa;pwd=123";
        string strSQLconnection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
        SqlCommand sqlCommand;

        string id = Request.QueryString["PlayerId"];
        if (id != null)
        {
            //sqlCommand = new SqlCommand("UPDATE player SET playerStatus=1, leagueId=" + (ddlLeague.SelectedIndex + 1) + " ,organizationId =" + Session["orgid"] + " ,playerName ='" + txt_playerName.Text + "' , playerAge= '" + txt_playerAge.Text + "' , playerAddress ='" + txt_address.Text + "', playerContactNumber='" + txt_contactNumber.Text + "',fielding=" + Convert.ToInt32(cmbx_fielding.SelectedValue) + ", hitting=" + Convert.ToInt32(cmbx_hitting.SelectedValue) + " ,pitching=" + Convert.ToInt32(cmbx_pitching.SelectedValue) + ",baseRunning=" + Convert.ToInt32(cmbx_running.SelectedValue) + " ,speed=" + Convert.ToInt32(cmbx_speed.SelectedValue) + " , joiningDate='" + DateTime.Now.Date.ToString() + "' WHERE playerId= " + id );
            sqlCommand = new SqlCommand("UPDATE player SET playerStatus=1, leagueId=" + (ddlLeague.SelectedIndex + 1) + " ,organizationId =" + Session["orgid"] + " ,playerName ='" + txt_playerName.Text + "',fielding=" + Convert.ToInt32(cmbx_fielding.SelectedValue) + ", hitting=" + Convert.ToInt32(cmbx_hitting.SelectedValue) + " ,pitching=" + Convert.ToInt32(cmbx_pitching.SelectedValue) + ",baseRunning=" + Convert.ToInt32(cmbx_running.SelectedValue) + " ,speed=" + Convert.ToInt32(cmbx_speed.SelectedValue) + " , joiningDate='" + DateTime.Now.Date.ToString() + "' WHERE playerId= " + id);

        }
        else
        {
            double avg = (Convert.ToInt32(cmbx_fielding.SelectedValue) + Convert.ToInt32(cmbx_hitting.SelectedValue) + Convert.ToInt32(cmbx_pitching.SelectedValue) + Convert.ToInt32(cmbx_running.SelectedValue) + Convert.ToInt32(cmbx_speed.SelectedValue)) / 5;
            //sqlCommand = new SqlCommand("INSERT INTO player (playerStatus,leagueId,organizationId ,playerName , playerAge , playerAddress , playerContactNumber,fielding, hitting ,pitching,baseRunning ,speed ,average ,joiningDate) " +
            //"VALUES (1," + ddlLeague.SelectedIndex + 1 + "," +  Session["orgid"] + ",'" + txt_playerName.Text + "' , '" + txt_playerAge.Text + "' , '" + txt_address.Text + "' , '" + txt_contactNumber.Text + "' , " + Convert.ToInt32(cmbx_fielding.SelectedValue) + " , " + Convert.ToInt32(cmbx_hitting.SelectedValue) + " , " + Convert.ToInt32(cmbx_pitching.SelectedValue) + " , " + Convert.ToInt32(cmbx_running.SelectedValue) + " , " + Convert.ToInt32(cmbx_speed.SelectedValue) + " ," + avg + ",'" + DateTime.Now.Date.ToString() + "')");

            sqlCommand = new SqlCommand("INSERT INTO player (playerStatus,leagueId,organizationId ,playerName," +
            "fielding, hitting ,pitching,baseRunning ,speed ,average ,joiningDate) " +
            "VALUES (1," + ddlLeague.SelectedIndex + 1 + "," + Session["orgid"] + ",'" + txt_playerName.Text + "'  , " 
            + Convert.ToInt32(cmbx_fielding.SelectedValue) + " , " + Convert.ToInt32(cmbx_hitting.SelectedValue) + " , " + Convert.ToInt32(cmbx_pitching.SelectedValue) + " , " + Convert.ToInt32(cmbx_running.SelectedValue) + " , " + Convert.ToInt32(cmbx_speed.SelectedValue) + " ," + avg + ",'" + DateTime.Now.Date.ToString() + "')");
        }
        sqlConnection.Open();

        sqlCommand.Connection = sqlConnection;
        int affectedRow = sqlCommand.ExecuteNonQuery();
        if (affectedRow > 0)
        {
            if (id == null)
            {
                lblError.Text = "Player Successfully Added !";
            }
            else
            {
                lblError.Text = "Player Successfully Updated !";
            }
            lblError.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            if (id == null)
            {
                lblError.Text = "Player Not Added! Error Occured";
            }
            else
            {
                lblError.Text = "Player Not Updated! Error Occured";
            }
            lblError.ForeColor = System.Drawing.Color.Red;

        }


        //Response.Redirect("Players.aspx");
        //GridView1.DataSource = reader;
        //GridView1.DataBind();
    }

    protected void cmbx_fielding_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Write("hello ani kuttay");
    }
    protected void ddlLeague_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Players.aspx");
    }
}

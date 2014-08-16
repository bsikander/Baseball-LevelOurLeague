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

public partial class UserHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadDataInGridView();
    }
    protected void ChangePassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("../lgn/ChangePassword.aspx");
    }

    private void LoadDataInGridView()
    {
        string _userId = Session["orgname"].ToString();
        string _query = string.Empty;
        string _guid = string.Empty;
        /*
        SELECT * FROM aspnet_Users WHERE UserName='raj'
SELECT * FROM Organization WHERE userId='E002676A-150C-4524-8F1F-824B87726A5A'
         * */
        SqlDataAdapter _sA = null;
        DataTable _dt = new DataTable();
        //a.Fill(srt);
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;        
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;

        try
        {

            _query = "SELECT * FROM aspnet_Users WHERE UserName='" + _userId + "'";

            cmd = new SqlCommand(_query,con );
            cmd.Connection.Open();
            _sA = new SqlDataAdapter(cmd);
            _sA.Fill(_dt);

            _guid = _dt.Rows[0]["UserId"].ToString();

            _query = "SELECT * FROM Organization WHERE userId='" + _guid + "'";

            cmd.CommandText = _query;
            _dt.Clear();
            _dt = new DataTable();

            _sA = new SqlDataAdapter(cmd);
            _sA.Fill(_dt);

            lblOrganizationName.Text = _dt.Rows[0]["orgName"].ToString();
            lblTotalPlayers.Text = _dt.Rows[0]["organizationPlayerNumber"].ToString();
            lblTotalAmountPaid.Text = _dt.Rows[0]["totalAmountPaid"].ToString();
            lblLeaguesRegistered.Text = _dt.Rows[0]["totalLeagues"].ToString();
            
        }
        catch (Exception ex)
        {

        }
        finally
        {
            if(con != null)
                con.Close();
        }
    }
    protected void lManagePlayers_Click(object sender, EventArgs e)
    {
        Response.Redirect("Players.aspx");
    }
    protected void lCreateLeagues_Click(object sender, EventArgs e)
    {
        Response.Redirect("Leagues.aspx");
    }
}

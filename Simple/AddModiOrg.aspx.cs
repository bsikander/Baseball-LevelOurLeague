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

public partial class Simple_AddModiOrg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDataInGrid();
            LoadDropDownList();

            
        }
        if (GridView1.HeaderRow == null)
        {
            lblNoPlayers.Visible = true;
        }
    }

    private void LoadDataInGrid()
    {
        SqlDataAdapter _sA = null;
        DataTable _dt = new DataTable();
        //a.Fill(srt);
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        string _query = string.Empty;
        try
        {
            _query = "SELECT * FROM Organization WHERE orgId=" + Request.QueryString["orgId"] ;

            cmd = new SqlCommand(_query, con);
            cmd.Connection.Open();
            _sA = new SqlDataAdapter(cmd);
            _sA.Fill(_dt);

            lblOrganizationName.Text = _dt.Rows[0]["orgName"].ToString();
            lblTotalAmount.Text = _dt.Rows[0]["totalAmountPaid"].ToString();

        }
        catch (Exception ex)
        {

        }
        finally
        {
            if (con != null)
                con.Close();
        }
    }

    private void LoadDropDownList()
    {
        SqlDataAdapter _sA = null;
        DataTable _dt = new DataTable();
        //a.Fill(srt);
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        string _query = string.Empty;

        try
        {
            _query = "SELECT * FROM leagues WHERE orgId=" + Request.QueryString["orgId"];

            cmd = new SqlCommand(_query, con);
            cmd.Connection.Open();
            _sA = new SqlDataAdapter(cmd);
            _sA.Fill(_dt);

            foreach (DataRow dr in _dt.Rows)
            {
                ddlList.Items.Add(dr["leagueId"].ToString());
            }

            lblRegDate.Text = _dt.Rows[0]["startDate"].ToString();
            lblExpDate.Text = _dt.Rows[0]["endDate"].ToString();

        }
        catch (Exception ex)
        { }
    }

    protected void ddlList_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter _sA = null;
        DataTable _dt = new DataTable();
        //a.Fill(srt);
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        string _query = string.Empty;

        try
        {
            _query = "SELECT * FROM leagues WHERE orgId=" + Request.QueryString["orgId"] + "AND leagueId=" + ddlList.SelectedValue;

            cmd = new SqlCommand(_query, con);
            cmd.Connection.Open();
            _sA = new SqlDataAdapter(cmd);
            _sA.Fill(_dt);

            //ddlList.Items.Clear();

            lblRegDate.Text = _dt.Rows[0]["startDate"].ToString();
            lblExpDate.Text = _dt.Rows[0]["endDate"].ToString();

        }
        catch (Exception ex)
        { }
    }
}

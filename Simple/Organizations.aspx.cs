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

public partial class Simple_Organizations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //LoadDataInGrid();
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

            _query = "SELECT * FROM Organization";

            cmd = new SqlCommand(_query, con);
            cmd.Connection.Open();
            _sA = new SqlDataAdapter(cmd);
            _sA.Fill(_dt);

            gvOrg.DataSource = _dt;
            gvOrg.DataBind();
            

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

}

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

public partial class usr_ScoringParameter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            LoadOrgValue();
    }

    private void LoadOrgValue()
    {
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        DataTable srt = new DataTable();
        int affectedRows;

        string id = Session["orgid"].ToString();
        string command = "SELECT * FROM lookupTable WHERE orgId=" + Session["orgid"].ToString();
        cmd = new SqlCommand(command, con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        con.Open();

        SqlDataAdapter a = new SqlDataAdapter(cmd);
        a.Fill(srt);
        if (srt.Rows.Count > 0)
        {

            txtField.Text = srt.Rows[0]["fielding"].ToString();
            txtHitting.Text = srt.Rows[0]["hitting"].ToString();
            txtPitching.Text = srt.Rows[0]["pitching"].ToString();
            txtSpeed.Text = srt.Rows[0]["speed"].ToString();
            txtBase.Text = srt.Rows[0]["baserunning"].ToString();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        DataTable srt = new DataTable();
        int affectedRows;

        string id = Session["orgid"].ToString();
        string command = "SELECT * FROM lookupTable WHERE orgId=" + Session["orgid"].ToString() ;
        cmd = new SqlCommand(command, con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        con.Open();

        SqlDataAdapter a = new SqlDataAdapter(cmd);
        a.Fill(srt);

        if (id != null)
        {
            if (srt.Rows.Count == 0)
            {   
                    //string command = "INSERT INTO lookupTable (orgId) VALUES ('" + Session["orgid"].ToString()  +  "')" ;
                    string fielding = txtField.Text == "" ? "Fielding" : txtField.Text;
                    string hitting = txtHitting.Text == "" ? "Hitting" : txtHitting.Text;
                    string baserunning = txtBase.Text == "" ? "Base Running" : txtBase.Text;
                    string pitching = txtPitching.Text == "" ? "Pitching" : txtPitching.Text; ;
                    string speed = txtSpeed.Text == "" ? "Speed" : txtSpeed.Text; ;

                    command = "INSERT INTO lookupTable (orgId,fielding,hitting,baserunning,pitching,speed) VALUES" +
                        "(" + Session["orgid"].ToString() + ",'" + fielding + "','" + hitting + "','" + baserunning + "','" + pitching + "','" + speed + "')";

                    //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

                    //cmd = new SqlCommand(command, con);
                    //cmd.CommandType = CommandType.Text;
                    //cmd.Connection = con;
                    //con.Open();

                    cmd.CommandText = command;

                    affectedRows = cmd.ExecuteNonQuery();
                    if (affectedRows > 0)
                    {
                        lblError.Visible = true;
                        lblError.Text = "Scoring Parameters Saved Successfully!";
                        lblError.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblError.Visible = true;
                        lblError.Text = "Scoring Parameters are Not Saved!";
                        lblError.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
            }
            else
            {

                string fielding = txtField.Text == "" ? "Fielding" : txtField.Text;
                string hitting = txtHitting.Text == "" ? "Hitting" : txtHitting.Text;
                string baserunning = txtBase.Text == "" ? "Base Running" : txtBase.Text;
                string pitching = txtPitching.Text == "" ? "Pitching" : txtPitching.Text; ;
                string speed = txtSpeed.Text == "" ? "Speed" : txtSpeed.Text; ;

                command = "UPDATE lookupTable SET fielding='" + fielding + "', pitching='" + pitching + "',baserunning='" + baserunning + "', hitting='" + hitting + "' ,speed='" + speed + "' WHERE orgId="+ Session["orgid"].ToString();

                //command = "INSERT INTO lookupTable (orgId,fielding,hitting,baserunning,pitching,speed) VALUES" +
                //    "(" + Session["orgid"].ToString() + ",'" + fielding + "','" + hitting + "','" + baserunning + "','" + pitching + "','" + speed + "')";

                //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

                //cmd = new SqlCommand(command, con);
                //cmd.CommandType = CommandType.Text;
                //cmd.Connection = con;
                //con.Open();

                cmd.CommandText = command;

                affectedRows = cmd.ExecuteNonQuery();
                if (affectedRows > 0)
                {
                    lblError.Visible = true;
                    lblError.Text = "Scoring Parameters Saved Updated!";
                    lblError.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Scoring Parameters are Not Updated!";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                con.Close();
            }
        }
    }
}

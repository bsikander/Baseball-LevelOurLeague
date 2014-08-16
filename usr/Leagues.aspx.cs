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
using System.Collections;

public partial class UserPages_Leagues : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDropDown();
        }
        //Button12.Visible = true;
    }
    protected void txtNoOfTeams_TextChanged(object sender, EventArgs e)
    {

    }

    private void leaguePlayersDivisionAlgo(int noOfTeams)
    { 
         
    }

    public DataTable copyData( DataView dvSort)
    {
        DataTable dtSorted = dvSort.Table.Clone();
        int i = 0;
        string[] ColNames = new string[dtSorted.Columns.Count];
        foreach (DataColumn col in dtSorted.Columns)
        {
            ColNames[i++] = col.ColumnName;
        }

        IEnumerator Ienum = dvSort.GetEnumerator();
        while (Ienum.MoveNext())
        {
            DataRowView drv = (DataRowView)Ienum.Current;
            DataRow drSorted = dtSorted.NewRow();
            try
            {
                foreach (string strName in ColNames)
                {
                    drSorted[strName] = drv[strName];
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            dtSorted.Rows.Add(drSorted);
        }
        return dtSorted;

    }

    protected void Button12_Click(object sender, EventArgs e)
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
            string command = "INSERT INTO player( organizationId , leagueId, playerStatus,average , playerName , playerContactNumber) VALUES (128 ,2 ,1," + rounded + " , 'Name" + i + "' , 'Contact" + i + "') ";
            //string command = "INSERT INTO player( organizationId , average , player_name , player_contact_no) VALUES (1 ," + (i + 100) + " , 'Name" + i + "' , 'Contact" + i + "') ";
            cmd = new SqlCommand(command, con);
            cmd.Connection.Open();
            int k = cmd.ExecuteNonQuery();
            cmd.Connection.Close();

        }
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        DataTable dt = FillData();

        int diff = 0;
        int validData = CalculateValidDataForAlgo(dt,Convert.ToInt32(txtNoOfTeams.Text) , Convert.ToInt32(txtNoOfPlayersPerTeam.Text),out diff);

        if (validData == 1)
        {
            if (diff == 0)
            {
                lblError.Text = string.Empty;
                Algo(dt);
            }
            else if (diff > 0)
            {
                lblError.Text = string.Empty;
                DataTable deletedRows = ModifyDataTable(ref dt,diff);
                Algo(dt,deletedRows);
            }
            else if (diff < 0)                
            {
                int extra = 0;
                extra = (Convert.ToInt32(txtNoOfPlayersPerTeam.Text) * Convert.ToInt32(txtNoOfTeams.Text)) - dt.Rows.Count;

                lblError.Text = "Total Players in your league are " + dt.Rows.Count + ". You are selecting " + Convert.ToInt32(txtNoOfPlayersPerTeam.Text) * Convert.ToInt32(txtNoOfTeams.Text) + ". " + extra + " players are extra.";
            }
        }
        else
        {
            int difference = diff;
            int extraTeams=0;
            extraTeams= diff / Convert.ToInt32(txtNoOfPlayersPerTeam.Text);
            lblError.Text = "Total Players in your league are " + dt.Rows.Count + ". You are accomodating only " + Convert.ToInt32(txtNoOfPlayersPerTeam.Text) * Convert.ToInt32(txtNoOfTeams.Text) + ". You should make " + extraTeams + " more teams.";
        }
    }

    public DataTable ModifyDataTable(ref DataTable dt, int diff)
    {
        ArrayList delRows = new ArrayList(diff);
        
        //DataRowCollection dtCol = dt.Rows;
        DataTable rowsDeleted = CreateDataTable();
        
        
        //DataRow[] dtCol =new DataRow[diff];
        for (int i = 0; i < diff; i++)
        {
            //rowsDeleted.ImportRow(dt.Rows[i]);
            DataRow test = rowsDeleted.NewRow();

            test["Player Name"] = dt.Rows[i]["playerName"];
            test["Contact Number"] = dt.Rows[i]["playerContactNumber"];
            test["average"] = Convert.ToDouble(dt.Rows[i]["average"]);
            rowsDeleted.Rows.Add(test);
            //delRows.Add(dt.Rows[i]);
        }
        

        for (int k = 0; k < diff; k++)
        {         
           dt.Rows[k].Delete();
           
        }
        dt.AcceptChanges();
        return rowsDeleted;

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

        ddlLeague.DataSource = srt;
        ddlLeague.DataTextField = "leagueId";
        ddlLeague.DataBind();
   
    }

    public DataTable FillData()
    {
        //string Connection = "server=TAUSEEF;Integrated Security=true;database=soprts_14-dec-2010";
        string Connection = ConfigurationManager.ConnectionStrings["WEBConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd;
        DataTable srt = new DataTable();
        //string command = "SELECT organizationID, average, playerName , playerContactNumber FROM player WHERE organizationID = 1 ORDER BY average ASC";
        string command = "SELECT organizationID, average, playerName , playerContactNumber FROM player WHERE organizationID = " + Convert.ToInt32(Session["orgid"]) + " AND leagueId=" + Convert.ToInt32(ddlLeague.SelectedValue) + " ORDER BY average ASC";
        //string command = "SELECT TOP 100  organizationID, average, player_name , player_contact_no FROM player WHERE organizationID = 1 ORDER BY newid()";

        cmd = new SqlCommand(command, con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;

        SqlDataAdapter a = new SqlDataAdapter(cmd);
        a.Fill(srt);

        //DataView dt1 = new DataView(srt);
        //dt1.Sort = "average"+" " +"ASC";

        //GridView1.DataSource = dt1;
        //GridView1.DataBind();

       DataTable dt = srt;
       // GridView2.DataSource = dt;
       // GridView2.DataBind();

        return dt;
    }

    public int CalculateValidDataForAlgo(DataTable dt, int noOfTeam, int noOfPlayersPerTeam , out int diff)
    {
        int totalPlayerInGrid = 0;
        totalPlayerInGrid = dt.Rows.Count;

        int totalPlayersCalcultedFromUserInput = noOfTeam * noOfPlayersPerTeam;
        diff = totalPlayerInGrid - totalPlayersCalcultedFromUserInput;

        if (diff > noOfPlayersPerTeam)
        //if (diff >= noOfPlayersPerTeam)
        //if (diff >= noOfTeam)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }

    int[] arrForPuttingExtraDataInRandomTables(int totalTeams)
    {
        int[] arrForPuttingExtraDataInRandomTables = new int[totalTeams];
        for (int l = 0; l < totalTeams; l++)
        {
            arrForPuttingExtraDataInRandomTables[l] = l;
        }
        return arrForPuttingExtraDataInRandomTables;
    }

    public void Algo(DataTable dt , DataTable rowsDeleted)
    {
        DataRowCollection dr = dt.Rows;
        DataTable dtnew = CreateDataTable();

        double teamAverage = 0;
        int totalTeams = Convert.ToInt32(txtNoOfTeams.Text);
        int totalPlayersPerTeam = Convert.ToInt32(txtNoOfPlayersPerTeam.Text);

        int[] arrForPuttingExtraDataInRandomTables;

        /*
         * if the total teams and players are equal i.e 10 10 = 100 and total players = 104 
         * or if total teams and players are not equal and total teams are > total players i.e
         * total teams =14 total players =7 total players= 98 , total league players 104 , remaning
         * 6. 6 < total teams so these 6 players can be accomodated in 1 player per team randomly.
         * arrForPuttingExtraDataInRandomTables array will not through error.
         * 
         * Now, if the total teams = 5 , total players per team = 18 , total = 90 , remaning 14.
         * if we make an array like this. then it will only make an array of 5 whereas total players that need
         * to be accomadeted are 14. This will through error. so the else case is used and 
         * the array is genereted based on the remaning players. and as the remaning players are 14 
         * and teams are 5. so multiple random players are added in the array. This means that each 
         * team will accomodate more than 1 player.
         * arrForPuttingExtraDataInRandomTables = new int[totalTeams]; 
         * 
         */

        if (totalTeams >= totalPlayersPerTeam)
        {
            arrForPuttingExtraDataInRandomTables = new int[totalTeams];
            for (int l = 0; l < totalTeams; l++)
            {
                arrForPuttingExtraDataInRandomTables[l] = l;
            }
        }
        else
        {
            arrForPuttingExtraDataInRandomTables = new int[rowsDeleted.Rows.Count];
            int totalTeamsVar = 0;
            for (int h = 0; h < rowsDeleted.Rows.Count; h++)
            {
                
                arrForPuttingExtraDataInRandomTables[h] = totalTeamsVar;
                totalTeamsVar++;
                if (totalTeamsVar == (totalTeams))
                {
                    totalTeamsVar = 0;
                }
            }
        }
        //This array contains the shuffled extra rows
        int[] retShuffleArr= Shuffle(arrForPuttingExtraDataInRandomTables);

        


        int[][] retShuffledArr = shuffleArray(fillArray(dt, totalPlayersPerTeam, totalTeams), totalTeams, totalPlayersPerTeam);

        if ((totalPlayersPerTeam * totalTeams) <= dt.Rows.Count)
        {

            for (int i = 0; i < totalTeams; i++)
            {
                dtnew.Clear();
                teamAverage = 0;
                int extraPlayer = 0;

                int it = 0;
                for (int j = 0; j < totalPlayersPerTeam; j++)
                {
                    int rowId = retShuffledArr[it][i];

                    double k = Convert.ToDouble(dt.Rows[rowId]["average"]);
                    DataRow row;
                    row = dtnew.NewRow();
                    row["Player Name"] = dt.Rows[rowId]["playerName"];
                    row["Contact Number"] = dt.Rows[rowId]["playerContactNumber"];
                    row["average"] = k;
                    dtnew.Rows.Add(row);
                    teamAverage += k;

                    it = it + 1;
                }

                for (int m =0 ; m < rowsDeleted.Rows.Count ; m++)
                {                    
                  //  string[] arr;
                    if (i == arrForPuttingExtraDataInRandomTables[m])
                    {
                        DataRow test = dtnew.NewRow();
                        test["Player Name"] = rowsDeleted.Rows[m]["Player Name"];
                        test["Contact Number"] = rowsDeleted.Rows[m]["Contact Number"];
                        test["average"] = Convert.ToDouble(rowsDeleted.Rows[m]["Average"]);
                        dtnew.Rows.Add(test);
                        //dtnew.ImportRow((DataRow)rowsDeleted[m]);
                        //dtnew.AcceptChanges();
                        teamAverage += Convert.ToDouble(rowsDeleted.Rows[m]["Average"]); 
                        extraPlayer = 1;
                    }
                    
                }
                    dtnew.AcceptChanges();

                // Lable for Grid Team name
                Label lblTeam = new Label();
                lblTeam.ID = "lblTeam " + (i);
                lblTeam.Text = "<b>Team Name:</b> Team " + (i + 1);
                Page.Controls.Add(lblTeam);

                // Label for Average
                Label lblTeamAverage = new Label();
                lblTeamAverage.ID = "lblTeamAverage" + i;
                decimal rounded = decimal.Round((decimal)(teamAverage / (totalPlayersPerTeam + extraPlayer)), 1);
                lblTeamAverage.Text = "<b>Team Average:</b> " + rounded.ToString();

                Page.Controls.Add(lblTeamAverage);
                LiteralControl breakLine = new LiteralControl();
                breakLine.Text = "<br /><br />";
                LiteralControl breakLineSingle = new LiteralControl();
                breakLineSingle.Text = "<br />";
                LiteralControl space = new LiteralControl();
                space.Text = "&nbsp;&nbsp;&nbsp;";

                //Adding the controls to div
                gvTeam.Controls.Add(breakLine);
                gvTeam.Controls.Add(lblTeam);
                gvTeam.Controls.Add(breakLineSingle);
                gvTeam.Controls.Add(lblTeamAverage);

                GridView gvTeamDivision = new GridView();
                gvTeamDivision.ID = "gvTeam" + i;
                gvTeamDivision.DataSource = dtnew;
                gvTeamDivision.DataBind();
                Page.Controls.Add(gvTeamDivision);
                gvTeam.Controls.Add(gvTeamDivision);

            }
        }
        else
        {
            lblError.Text = "Total Players in al league are less then the expected players.";
        }
    
    }
    public void Algo(DataTable dt)
    {
        DataRowCollection dr = dt.Rows;
        DataTable dtnew = CreateDataTable();

        double teamAverage = 0;
        int totalTeams = Convert.ToInt32(txtNoOfTeams.Text);
        int totalPlayersPerTeam = Convert.ToInt32(txtNoOfPlayersPerTeam.Text);

        int[][] retShuffledArr = shuffleArray(fillArray(dt, totalPlayersPerTeam, totalTeams), totalTeams, totalPlayersPerTeam);

        if ((totalPlayersPerTeam * totalTeams) <= dt.Rows.Count)
        {

            for (int i = 0; i < totalTeams; i++)
            {
                dtnew.Clear();
                teamAverage = 0;

                int it = 0;
                for (int j = 0; j < totalPlayersPerTeam; j++)
                {
                    int rowId = retShuffledArr[it][i];

                    double k = Convert.ToDouble(dt.Rows[rowId]["average"]);
                    DataRow row;
                    row = dtnew.NewRow();
                    row["Player Name"] = dt.Rows[rowId]["playerName"];
                    row["Contact Number"] = dt.Rows[rowId]["playerContactNumber"];
                    row["average"] = k;
                    dtnew.Rows.Add(row);
                    teamAverage += k;

                    it = it + 1;
                }

                dtnew.AcceptChanges();

                // Lable for Grid Team name
                Label lblTeam = new Label();
                lblTeam.ID = "lblTeam " + (i);
                lblTeam.Text = "<b>Team Name:</b> Team " + (i + 1);
                Page.Controls.Add(lblTeam);

                // Label for Average
                Label lblTeamAverage = new Label();
                lblTeamAverage.ID = "lblTeamAverage" + i;
                decimal rounded = decimal.Round((decimal)(teamAverage / totalPlayersPerTeam), 1);
                lblTeamAverage.Text = "<b>Team Average:</b> " + rounded.ToString();

                Page.Controls.Add(lblTeamAverage);
                LiteralControl breakLine = new LiteralControl();
                breakLine.Text = "<br /><br />";
                LiteralControl breakLineSingle = new LiteralControl();
                breakLineSingle.Text = "<br />";
                LiteralControl space = new LiteralControl();
                space.Text = "&nbsp;&nbsp;&nbsp;";

                //Adding the controls to div
                gvTeam.Controls.Add(breakLine);
                gvTeam.Controls.Add(lblTeam);
                gvTeam.Controls.Add(breakLineSingle);
                gvTeam.Controls.Add(lblTeamAverage);

                GridView gvTeamDivision = new GridView();
                gvTeamDivision.ID = "gvTeam" + i;
                gvTeamDivision.DataSource = dtnew;
                gvTeamDivision.DataBind();
                Page.Controls.Add(gvTeamDivision);
                gvTeam.Controls.Add(gvTeamDivision);

            }
        }
        else
        {
            lblError.Text = "Total Players in al league are less then the expected players.";
        }

    }

    private DataTable CreateDataTable()
    {
        DataTable myDataTable = new DataTable();

        DataColumn myDataColumn;

        
        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "Player Name";
        myDataTable.Columns.Add(myDataColumn);

        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.String");
        myDataColumn.ColumnName = "Contact Number";
        myDataTable.Columns.Add(myDataColumn);

        int a;
        myDataColumn = new DataColumn();
        myDataColumn.DataType = Type.GetType("System.Double");
        myDataColumn.ColumnName = "Average";
        myDataTable.Columns.Add(myDataColumn);

        

        

        //myDataColumn = new DataColumn();
        //myDataColumn.DataType = Type.GetType("System.String");
        //myDataColumn.ColumnName = "lastname";
        //myDataTable.Columns.Add(myDataColumn);

        return myDataTable;
    }

    static Random _random = new Random();

    public static int[] Shuffle(int[] array)
    {
        var random = _random;
        for (int i = array.Length; i > 1; i--)
        {
            // Pick random element to swap.
            int j = random.Next(i); // 0 <= j <= i-1
            // Swap.
            int tmp = array[j];
            array[j] = array[i - 1];
            array[i - 1] = tmp;
        }
        return array;
    }

    // return shuffled array. Gets data from another fillArray.
    public int[][] shuffleArray(int[][] arr , int noOfTeams, int noOfPlayersPerTeam)
    {
        int[][] retArrShuffled=new int[noOfPlayersPerTeam][];
        for (int i = 0; i < noOfPlayersPerTeam; i++)
        {
            int[] arrToShuffle = arr[i];
            retArrShuffled[i]=  Shuffle(arrToShuffle);
        }
        return retArrShuffled;
    }

    /// <summary>
    /// Fill data from datatable in the jaaged array.
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="noOfPlayersPerTeam"></param>
    /// <param name="noOfTeams"></param>
    /// <returns></returns>
    public int[][] fillArray(DataTable dt, int noOfPlayersPerTeam, int noOfTeams)
    {
        int[][] suffleArr=new int[noOfPlayersPerTeam][];

        int it = 0;
        int k = 0;
        for (int i = 0; i < noOfPlayersPerTeam ; i++) // Using reverse logic
        {
            //initialize the array of array
            suffleArr[it]=new int[noOfTeams];

            //int k = 0;
            for (int j = 0; j < noOfTeams ; j++ )
            {   
                //double value = Convert.ToDouble(dt.Rows[i + j]["average"]);
                suffleArr[i][j] = k;
                k++;
            }
            it++;
        }
        return suffleArr;
    }

}

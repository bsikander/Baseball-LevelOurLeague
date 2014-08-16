using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for RandomDataTable
/// </summary>
public class RandomDataTable
{
    static Random _rand = new Random();



    public static DataView RandomizeDataTable(DataTable dt)
    {

        // Create array of indices and populate with ordinal values

        int[] indices = new int[dt.Rows.Count];

        for (int i = 0; i < indices.Length; i++)

            indices[i] = i;



        // Knuth-Fisher-Yates shuffle indices randomly

        for (int i = indices.Length - 1; i > 0; i--)
        {

            int n = _rand.Next(i + 1);

            int tmp = indices[i];

            indices[i] = indices[n];

            indices[n] = tmp;

        }



        // Add new column to data table (if it's not there already)

        // to store shuffle index

        if (dt.Columns["rndSortId"] == null)

            dt.Columns.Add(new DataColumn("rndSortId", typeof(int)));

        int rndSortColIdx = dt.Columns["rndSortId"].Ordinal;

        for (int i = 0; i < dt.Rows.Count; i++)

            dt.Rows[i][rndSortColIdx] = indices[i];

        DataView dv = new DataView(dt);

        dv.Sort = "rndSortId";

        return dv;

    }

}
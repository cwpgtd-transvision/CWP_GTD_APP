using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;

/// <summary>
/// Summary description for SqlCmd
/// </summary>
public class SqlCmd
{
    public DataTable GetDT(string spName, string param, string pname, int count, string database, string key, string DBServer, string parameters)
    {
        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
        //string url = "https://dashboard.kasamast.in/api/Home?DBName=" + database + "&DBServer=" + DBServer + "&SP_Name=" + spName + "&SP_Param=" + param + "&SP_PName=" + pname + "&PCount=" + count + "&Password=" + key + "";
        //string url = "http://localhost:5156/api/Home?DBName=" + database + "&DBServer=" + DBServer + "&SP_Name=" + spName + "&SP_Param=" + param + "&SP_PName=" + pname + "&PCount=" + count + "&Password=" + key + "";
        //string url = "https://gtdapi6s5f30gvf53l.kasamast.in/api/Home?DBName=" + database + "&DBServer=" + DBServer + "&SP_Name=" + spName + "&SP_Param=" + param + "&SP_PName=" + pname + "&PCount=" + count + "&Password=" + key + "";
        string url = "https://gtdapi6s5f30gvf53l.kasamast.in/api/Samast/ExecuteStoredProcedure?serverName=" + DBServer + "&dbName=" + database + "&procedureName=" + spName + "&parameters=" + parameters + "&apiKey=" + key + "";
        DataTable dataTable = new DataTable();
        string apiResponse;
        using (WebClient client = new WebClient())
        {
            apiResponse = client.DownloadString(url);
        }
        dataTable = JsonConvert.DeserializeObject<DataTable>(apiResponse);
        return dataTable;
    }
    public DataTable GetDT(string spName, string param, string pname, int count, string database, string key, string DBServer)
    {
        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
        //string url = "https://dashboard.kasamast.in/api/Home?DBName=" + database + "&DBServer=" + DBServer + "&SP_Name=" + spName + "&SP_Param=" + param + "&SP_PName=" + pname + "&PCount=" + count + "&Password=" + key + "";
        //string url = "http://localhost:5156/api/Home?DBName=" + database + "&DBServer=" + DBServer + "&SP_Name=" + spName + "&SP_Param=" + param + "&SP_PName=" + pname + "&PCount=" + count + "&Password=" + key + "";
        string url = "https://gtdapi6s5f30gvf53l.kasamast.in/api/Home?DBName=" + database + "&DBServer=" + DBServer + "&SP_Name=" + spName + "&SP_Param=" + param + "&SP_PName=" + pname + "&PCount=" + count + "&Password=" + key + "";
        DataTable dataTable = new DataTable();
        string apiResponse;
        using (WebClient client = new WebClient())
        {
            apiResponse = client.DownloadString(url);
        }
        dataTable = JsonConvert.DeserializeObject<DataTable>(apiResponse);
        return dataTable;
    }
    public DataTable SelectQuery(string SpName)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConnectionString.connect))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand(SpName, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    da.Dispose();
                }
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return dt;
    }
    public DataTable SelectData(string SpName, string[] Param, string[] PName, int Count)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConnectionString.connect))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand(SpName, con))
            {
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < Count; i++)
                {
                    cmd.Parameters.AddWithValue(PName[i], Param[i]);
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    da.Dispose();
                }
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return dt;
    }

    public string ExecScaler(string SpName, string[] Param, string[] PName, int Count)
    {
        var Result = "";
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConnectionString.connect))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand(SpName, con))
            {
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < Count; i++)
                {
                    cmd.Parameters.AddWithValue(PName[i], Param[i]);
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    da.Dispose();
                }
                if (dt.Rows.Count > 0)
                {
                    Result = dt.Rows[0][0].ToString();
                }
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return Result;
    }

    public int ExecNonQuery(string SpName, string[] Param, string[] PName, int Count)
    {
        int Result = 0;
        using (SqlConnection con = new SqlConnection(ConnectionString.connect))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand(SpName, con))
            {
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < Count; i++)
                {
                    cmd.Parameters.AddWithValue(PName[i], Param[i]);
                }
                Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return Result;
    }

    public DataTable ReadExcel(string file, string Query)
    {
        DataTable dt = new DataTable();
        try
        {
            string connectionString = String.Format(@"Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties=""Excel 12.0;HDR=No;IMEX=1""", file);
            OleDbConnection OleCon = null;
            OleDbCommand OleCmd = null;
            OleDbDataAdapter OleDa = null;

            OleCon = new OleDbConnection(connectionString);
            OleCon.Open();
            OleCmd = new OleDbCommand(Query, OleCon);
            OleDa = new OleDbDataAdapter(OleCmd);
            dt = new DataTable();
            OleDa.Fill(dt);
            OleCon.Close();
        }
        catch (Exception Ex)
        {
        }
        return dt;
    }
    public DataTable ReadExcelHdr(string file, string Query, int Flag)
    {
        DataTable dt = new DataTable();
        try
        {
            string connectionString = "";
            if (Flag == 1)
            {
                connectionString = String.Format(@"Provider=Microsoft.ACE.OLEDB.12.0; Data Source={0}; Extended Properties=""Excel 12.0;HDR=Yes;IMEX=2""", file);
            }
            else if (Flag == 2)
            {
                connectionString = String.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + file + ";Extended Properties=Excel 8.0;Persist Security Info=False");
            }
            OleDbConnection OleCon = null;
            OleDbCommand OleCmd = null;
            OleDbDataAdapter OleDa = null;

            OleCon = new OleDbConnection(connectionString);
            OleCon.Open();
            OleCmd = new OleDbCommand(Query, OleCon);
            OleDa = new OleDbDataAdapter(OleCmd);
            dt = new DataTable();
            OleDa.Fill(dt);
            OleCon.Close();
        }
        catch (Exception Ex)
        {
        }
        return dt;
    }
    public string DriveCheck()
    {
        var Result = "";
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConnectionString.connect))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand("SELECT DOC_PATH FROM DOC_DRIVE", con))
            {
                // cmd.CommandTimeout = 0;
                // cmd.CommandType = CommandType.StoredProcedure;              
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    da.Dispose();
                }
                if (dt.Rows.Count > 0)
                {
                    Result = dt.Rows[0][0].ToString();
                }
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return Result;
    }


    public DataTable SelectDataEntity(string SpName, string[] Param, string[] PName, int Count)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConnectionString.connectentity))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand(SpName, con))
            {
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < Count; i++)
                {
                    cmd.Parameters.AddWithValue(PName[i], Param[i]);
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    da.Dispose();
                }
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return dt;
    }

    public string ExecScalerEntity(string SpName, string[] Param, string[] PName, int Count)
    {
        var Result = "";
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConnectionString.connectentity))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand(SpName, con))
            {
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < Count; i++)
                {
                    cmd.Parameters.AddWithValue(PName[i], Param[i]);
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    da.Dispose();
                }
                if (dt.Rows.Count > 0)
                {
                    Result = dt.Rows[0][0].ToString();
                }
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return Result;
    }

    public DataTable SelectQueryEntity(string SpName)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(ConnectionString.connectentity))
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            using (SqlCommand cmd = new SqlCommand(SpName, con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    da.Dispose();
                }
                cmd.Dispose();
            }
            if (con.State != ConnectionState.Closed)
            {
                con.Close();
            }
            con.Dispose();
        }
        return dt;
    }
}
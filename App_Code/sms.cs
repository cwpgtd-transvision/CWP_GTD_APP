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
using System.IO;
using System.Net;
using System.Text;
using System.Data.SqlClient;
/// <summary>
/// Summary description for sms
/// </summary>
public class sms
{
    SqlConnection con = new SqlConnection(ConnectionString.connect.ToString());
    SqlCommand cmd = new SqlCommand();
    public sms()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private static bool IsEncoded(string message)
    {
        string decoded = HttpUtility.UrlDecode(message);
        string reEncoded = HttpUtility.UrlEncode(decoded);
        return message.Equals(reEncoded, StringComparison.Ordinal);
    }

    public String readHtmlPage(string messages, string mobileno)
    {
        string url = "", keyword = "", userName = "", password = "";

        if (con.State != ConnectionState.Open)
        {
            con.Open();
        }
        cmd = new SqlCommand("SELECT * FROM SMS_DETAILS", con);
        using (SqlDataReader rd = cmd.ExecuteReader())
        {
            if (rd.HasRows)
            {
                rd.Read();
                url = rd["SMS_URL"].ToString();
                keyword = rd["SMS_KEYWORD"].ToString();
                userName = rd["SMS_USERNAME"].ToString();
                password = rd["SMS_PASSWORD"].ToString();
            }
        }
        if (con.State != ConnectionState.Closed)
        {
            con.Close();
        }

        string message = "";
        if (!IsEncoded(messages))
        {
            message = HttpUtility.UrlEncode(messages);
        }
        else
        {
            message = messages;
        }

        //string message = HttpUtility.UrlEncode(messages);
        //string url = "http://sms.cannyinfotech.com/sendsms.jsp?";
        //String result = "";
        //String message = HttpUtility.UrlEncode(messages);
        //String strPost = "user=tvisions&password=demo1234&sms=" + message + "&senderid=UHSBKT&mobiles=" + mobileno + "&unicode=0&version=3";
        //String strPost = "user=" + userName + "&password=" + password + "&sms=" + message + "&senderid=" + keyword + "&mobiles=" + mobileno + "&unicode=0&version=3";

        string demo = url + "user=" + userName + "&password=" + password + "&sms=" + message + "&senderid=" + keyword + "&channel=TRANS&DCS=0&flashsms=0&number=" + mobileno + "&text=" + message + "&route=2";

        //StreamWriter myWriter = null;
        //HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(demo);      

        //objRequest.Method = "POST";
        //objRequest.ContentLength = Encoding.UTF8.GetByteCount(demo);
        //objRequest.ContentType = "application/x-www-form-urlencoded";

        WebRequest request = HttpWebRequest.Create(demo);
        // Get the response back  
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();
        return dataString;
        //try
        //{
        //    myWriter = new StreamWriter(objRequest.GetRequestStream());
        //    myWriter.Write(demo);
        //}
        //catch (Exception e)
        //{
        //    return e.Message;
        //}
        //finally
        //{
        //    myWriter.Close();
        //}

        //HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
        //using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
        //{
        //    result = sr.ReadToEnd();
        //    // Close and clean up the StreamReader
        //    sr.Close();
        //}
        //return result;
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for SessionManager
/// </summary>
public static class SessionManager
{
    private static SqlCmd SqlCmd = new SqlCmd();
    private static string[] Param = new string[30];
    private static string[] PName = new string[30];

    //public static string CreateSession(int userId)
    //{
    //    string sessionId = Guid.NewGuid().ToString();
    //    try
    //    {
    //        DateTime createdAt = DateTime.UtcNow;
    //        Param[0] = userId.ToString(); PName[0] = "@UserId";
    //        Param[1] = sessionId; PName[1] = "@SessionId";
    //        Param[2] = createdAt.ToString("yyyy-MM-dd HH:mm:ss"); PName[2] = "@CreatedAt";
    //        SqlCmd.ExecNonQuery("CreateOrUpdateSession", Param, PName, 3);
    //    }
    //    catch (Exception ex)
    //    {
    //        throw new Exception("Session creation failed.", ex);
    //    }

    //    return sessionId;
    //}

    public static string CreateSession1(int userId)
    {
        string sessionId = Guid.NewGuid().ToString();
        try
        {

            string varIPAddress = string.Empty;
            string varIpAddress = string.Empty;
            varIpAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(varIpAddress))
            {
                if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                {
                    varIpAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                }
            }

            if (varIPAddress == "" || varIPAddress == null)
            {
                if (HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] != null)
                {
                    varIpAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                }
            }

            IPGeoInfo location = GetGeoLocation(varIPAddress);

            string city = location.city;
            string country = location.country;
            string isp = location.isp;

            string cityAndCountry = city + " " + country;

            string deviceInfo = HttpContext.Current.Request.Browser.Browser + " " +
                                HttpContext.Current.Request.Browser.Version + " / " +
                                HttpContext.Current.Request.Browser.Platform;


            DateTime createdAt = DateTime.UtcNow;
            Param[0] = userId.ToString(); PName[0] = "@UserID";
            Param[1] = sessionId; PName[1] = "@SessionToken";
            Param[2] = varIpAddress; PName[2] = "@IPAddress";
            Param[3] = deviceInfo; PName[3] = "@DeviceInfo";
            Param[4] = createdAt.ToString("yyyy-MM-dd HH:mm:ss"); ; PName[4] = "@LoginTime";
            Param[5] = "1"; PName[5] = "@IsActive";
            Param[6] = cityAndCountry; PName[6] = "@LOCATION";
            SqlCmd.ExecNonQuery("CREATE_OR_UPDATE_SESSTION", Param, PName, 7);
        }
        catch (Exception ex)
        {
            throw new Exception("Session creation failed.", ex);
        }

        return sessionId;
    }

    public class IPGeoInfo
    {
        public string query { get; set; }
        public string country { get; set; }
        public string regionName { get; set; }
        public string city { get; set; }
        public string isp { get; set; }
    }

    public static IPGeoInfo GetGeoLocation(string ip)
    {
        string url = "http://ip-api.com/json/" + ip;
        using (var client = new WebClient())
        {
            string json = client.DownloadString(url);
            return new JavaScriptSerializer().Deserialize<IPGeoInfo>(json);
        }
    }



    public static string GetActiveSession(int userId)
    {
        try
        {
            Param[0] = userId.ToString(); PName[0] = "@UserId";
            //return SqlCmd.ExecScaler("GetActiveSession", Param, PName, 1) ?? string.Empty;
            return SqlCmd.ExecScaler("GetActiveSession_Q1", Param, PName, 1) ?? string.Empty;
        }
        catch (Exception ex)
        {
            throw new Exception("Failed to retrieve active session.", ex);
        }
    }

    // Invalidate a user's session
    public static void InvalidateSession(int userId)
    {
        try
        {
            Param[0] = userId.ToString(); PName[0] = "@UserId";
            //SqlCmd.ExecNonQuery("InvalidateSession", Param, PName, 1);
            SqlCmd.ExecNonQuery("InvalidateSession_Q1", Param, PName, 1);
        }
        catch (Exception ex)
        {
            throw new Exception("Failed to invalidate session.", ex);
        }
    }

    public static void LogoutSession(int userId)
    {
        try
        {
            Param[0] = userId.ToString(); PName[0] = "@UserId";
            //SqlCmd.ExecNonQuery("InvalidateSession", Param, PName, 1);
            SqlCmd.ExecNonQuery("Sesstion_Logout_Q1", Param, PName, 1);
        }
        catch (Exception ex)
        {
            throw new Exception("Failed to invalidate session.", ex);
        }
    }



    public static bool IsSessionValid(int userId, string sessionId)
    {
        var activeSession = SessionManager.GetActiveSession(userId);
        return activeSession == sessionId;
    }




    public static void Logout(string SessionToken)
    {
        try
        {
            Param[0] = SessionToken; PName[0] = "@SessionToken";
            SqlCmd.ExecNonQuery("InvalidateSessionByToken_Q1", Param, PName, 1);

        }
        catch (Exception ex)
        {
            throw new Exception("Failed to invalidate session.", ex);
        }
    }




    public static void Expire_At(string SessionToken)
    {
        try
        {
            Param[0] = SessionToken; PName[0] = "@SessionToken";
            SqlCmd.ExecNonQuery("InvalidateSessionByToken_Q1", Param, PName, 1);

        }
        catch (Exception ex)
        {
            throw new Exception("Failed to invalidate session.", ex);
        }
    }



}
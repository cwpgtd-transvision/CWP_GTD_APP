using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SingleLogin : System.Web.UI.Page
{

    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    static ConnectionString c1 = new ConnectionString();
    static string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string btnOfficerLogin(string userName, string password, string flag)
    {
        try
        {
            msg = loginMethod("OFFICER", userName, password, flag);
            return msg;
        }
        catch (Exception ex)
        {
            // Log exception (consider logging stack trace)
            return "Error: " + ex.Message;
        }


    }

    public static string loginMethod(string type, string userName, string password, string flag)
    {
        msg = "";
        try
        {
            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
            {
                return "Please enter all details";
            }
            Param[0] = userName;
            PName[0] = "@USER_NAME";
            Param[1] = type;
            PName[1] = "@USER_TYPE";
            DataTable dt1 = SqlCmd.SelectData("SP_LOGINFRM_Q1", Param, PName, Count = 2);
            if (dt1.Rows.Count == 0)
            {
                return "Please Enter Valid User Name...!";
            }
            string name = dt1.Rows[0]["User_NAME"].ToString();
            string cipher = Decrypt(dt1.Rows[0]["PASSWORD"].ToString());
            int miscount = string.IsNullOrEmpty(dt1.Rows[0]["MISMATCH_COUNT"].ToString())
                ? 0 : Convert.ToInt32(dt1.Rows[0]["MISMATCH_COUNT"]);
            DateTime? mismatchDate = string.IsNullOrEmpty(dt1.Rows[0]["MISMATCH_DATE"].ToString())
               ? (DateTime?)null
               : Convert.ToDateTime(dt1.Rows[0]["MISMATCH_DATE"].ToString());
            if (password != cipher)
            {
                IncrementMismatchCount(miscount, userName, type);
                return "Invaild Password";
            }
            if (miscount >= 5 && mismatchDate.HasValue && DateTime.Now < mismatchDate.Value.AddHours(3))
            {
                TimeSpan timeLeft = mismatchDate.Value.AddHours(3) - DateTime.Now;
                return msg = "Account blocked for " + timeLeft.Hours + " hours and " + timeLeft.Minutes + " minutes.";

            }

            int userId = Convert.ToInt32(dt1.Rows[0]["ID"]);

            //if (flag == "Second")
            //{
            //    SessionManager.InvalidateSession(userId);
            //}
            //var existingSession = SessionManager.GetActiveSession(userId);
            //if (!string.IsNullOrEmpty(existingSession))
            //{
            //    return "EXISTS";
            //}


            //var newSession = SessionManager.CreateSession(userId);
            var newSession = SessionManager.CreateSession1(userId);
            HttpContext.Current.Session["SessionId"] = newSession;
            SaveCookie("SessionId", newSession);
            HttpContext.Current.Session["UserId"] = userId;

            if (miscount >= 5 && mismatchDate.HasValue && DateTime.Now >= mismatchDate.Value.AddHours(3))
            {
                ResetMismatchCount(userName, type);
            }
            if (userName.Equals(name, StringComparison.OrdinalIgnoreCase))
            {
                ResetMismatchCount(userName, type);
                InitializeSession(dt1);
                return "Y";
            }
        }
        catch (Exception ex)
        {
            msg = "An error occurred. Please try again.";
        }
        return msg;
    }


    private static string Decrypt(string password)
    {
        string EncryptionKey = "TVDCOMKPTCLKARN123";
        byte[] cipherBytes = Convert.FromBase64String(password);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                password = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return password;

    }

    private static string IncrementMismatchCount(int miscount, string empId, string type)
    {
        try
        {
            miscount = Math.Min(miscount + 1, 5);
            Param[0] = empId;
            PName[0] = "@USER_NAME";
            PName[1] = "@MISMACH_COUNT";
            Param[1] = miscount.ToString();
            Param[2] = type;
            PName[2] = "@USER_TYPE";
            SqlCmd.ExecNonQuery("SP_LOGINFRM_Q3", Param, PName, Count = 3);
            if (miscount < 5)
                //msg = $"Invalid credentials. You have {5 - miscount} attempts left.";
                msg = "Invalid credentials. You have " + (5 - miscount) + " attempts left.";

            else
                msg = "Your login attempts are completed. Account is blocked for 3 hours.";
        }
        catch (Exception ex)
        {
        }
        return msg;
    }
    private static void ResetMismatchCount(string empId, string type)
    {
        try
        {
            Param[0] = empId;
            PName[0] = "@USER_NAME";
            Param[1] = type;
            PName[1] = "@USER_TYPE";
            SqlCmd.ExecNonQuery("SP_LOGINFRM_Q2", Param, PName, Count = 2);
        }
        catch (Exception ex)
        {
        }
    }
    private static void InitializeSession(DataTable userData)
    {
        try
        {
            string userId = userData.Rows[0]["ID"].ToString();
            string userName = userData.Rows[0]["User_NAME"].ToString();
            string fullname = userData.Rows[0]["FULLNAME"].ToString();
            string roleId = userData.Rows[0]["ROLE_ID"].ToString();
            string profilePath = userData.Rows[0]["PROFILE_FULL_PATH"].ToString();
            string profileImage = userData.Rows[0]["PROFILE_IMAGE_NAME"].ToString();

            // Save to Session
            HttpContext.Current.Session["UserId"] = userId;
            HttpContext.Current.Session["USERNAME"] = userName;
            HttpContext.Current.Session["FULLNAME"] = fullname;
            HttpContext.Current.Session["ROLE_ID"] = roleId;
            HttpContext.Current.Session["PROFILE_FULL_PATH"] = profilePath;
            HttpContext.Current.Session["PROFILE_IMAGE_NAME"] = profileImage;

            // Save to Cookies (optional: change expiry time as needed)
            //SaveCookie("UserId", userId);
            //SaveCookie("USERNAME", userName);
            //SaveCookie("DESIGNATION", designation);
            //SaveCookie("ROLE_ID", roleId);
            //SaveCookie("PROFILE_FULL_PATH", profilePath);
            //SaveCookie("PROFILE_IMAGE_NAME", profileImage);
        }
        catch (Exception ex)
        {
            // Optionally log ex
        }
    }

    private static void SaveCookie(string key, string value)
    {
        HttpCookie cookie = new HttpCookie(key, value);
        cookie.Expires = DateTime.Now.AddDays(1);
        cookie.HttpOnly = true; // Prevent access from client-side JS
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    [WebMethod]
    public static string btnSubmitEmail(string input)
    {
        try
        {
            string[] Param = { input.Trim() };
            string[] PName = { "@input" };
            int Count = 1;

            DataTable dt = SqlCmd.SelectData("SP_GET_EMAIL_BY_INPUT", Param, PName, Count);

            if (dt != null && dt.Rows.Count > 0)
            {
                string email = dt.Rows[0]["EMAIL"].ToString() ?? "";
                string username = dt.Rows[0]["User_NAME"].ToString() ?? "";
                string encryptedPassword = dt.Rows[0]["PASSWORD"].ToString() ?? "";

                string password = Decrypt(encryptedPassword);

                string subject = "Your Account Details";

                string body = "<b>Dear " + username + ",</b><br/><br/>" + "This is to inform you that a password recovery request was received for your account.<br/><br/>" + "<b>Username:</b> " + username + "<br/>" + "<b>Password:</b> " + password + "<br/><br/>" + "If this request was not initiated by you, please contact the system administrator or support team immediately." + "<br/><br/>" + "Please keep this information safe and confidential.<br/><br/>" + "Regards,<br/>Support Team";

                Mail.Sending_Mail(email, subject, body);

                return "success";
            }
            else
            {
                return "not_found";
            }
        }
        catch (Exception ex)
        {
            return "error: " + ex.Message;
        }
    }

    [WebMethod]
    public static string ClearLogoutSessions()
    {
        if (HttpContext.Current.Session["UserId"] != null)
        {
            // Try parsing the UserId to an integer
            int userId;
            if (Int32.TryParse(HttpContext.Current.Session["UserId"].ToString(), out userId))
            {
                SessionManager.LogoutSession(userId);
                HttpContext.Current.Session.Abandon();
                FormsAuthentication.SignOut();
            }

        }
        return "Y";
    }


    [WebMethod]
    public static string[] GetUserDetails()
    {
        string[] result = new string[2];
        string Username = HttpContext.Current.Session["USERNAME"].ToString() ?? "";
        string ProfileImagePath = "/"+HttpContext.Current.Session["PROFILE_FULL_PATH"].ToString() ?? "";
        result[0] = Username;
        result[1] = ProfileImagePath;

        return result;
    }

}
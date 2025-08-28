using System;
using System.Collections.Generic;
using System.Data;
using System.IdentityModel.Protocols.WSTrust;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Employee_Profile : System.Web.UI.Page
{
    static SqlCmd SqlCmd = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    static string msg = "";
    static string login_user = "", USERID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserId"] == null)
        {
            Response.Redirect("/templates/login/LoginMain.aspx");
        }
        else
        {
            login_user = HttpContext.Current.Session["USERNAME"].ToString();
        }
    }

    [System.Web.Services.WebMethod]
    public static object getdata()
    {
        try
        {
            string eid = HttpContext.Current.Session["USERID"].ToString();

            if (string.IsNullOrEmpty(eid))
                return new { success = false, message = "Session expired" };

            string[] Param = new string[1];
            string[] PName = new string[1];
            Param[0] = eid;
            PName[0] = "@id";
            int Count = 1;

            DataTable dt1 = SqlCmd.SelectData("SP_USERDETAILS_PROFILEPATH_Q1", Param, PName, Count);

            if (dt1.Rows.Count == 0)
                return new { success = false, message = "User not found" };

            string filePath = dt1.Rows[0]["PROFILE_IMAGE_NAME"].ToString();
            string userName = dt1.Rows[0]["USER_NAME"].ToString();
            string fullname = dt1.Rows[0]["FULLNAME"].ToString();
            string address = dt1.Rows[0]["Address"].ToString();
            string email = dt1.Rows[0]["EMAIL"].ToString();
            string phone = dt1.Rows[0]["MOBILE_NO"].ToString();

            string fileFullPath = HttpContext.Current.Server.MapPath("~/assets/Images/ProfileImages/") + filePath;

            if (!File.Exists(fileFullPath) || string.IsNullOrWhiteSpace(filePath))
            {
                filePath = "DefaultUser.jpg";
            }

            string imageUrl = "/assets/Images/ProfileImages/" + filePath;

            return new
            {
                success = true,
                imageUrl = imageUrl,
                imageName = filePath,
                userName = userName,
                fullname = fullname,
                address = address,
                email = email,
                phone = phone,
            };
        }
        catch (Exception ex)
        {
            return new { success = false, message = ex.Message };
        }
    }
    [System.Web.Services.WebMethod]
    public static string SaveUserProfile(string userName, string imageUrl, string fullname, string phone, string email, string address,
        string base64Image, string imagename, string fileModify)
    {

        string fileName = ""; string uid = ""; string profileImagesDirectory = "";
        try
        {
            string eid = HttpContext.Current.Session["USERID"].ToString();
            login_user = HttpContext.Current.Session["USERNAME"].ToString();
            int i = 0;

            if (fileModify == "No")
            {
                Param[0] = userName;
                PName[0] = "@User_NAME";
                //Param[1] = imageUrl;
                //PName[1] = "@PROFILE_FULL_PATH";
                Param[2] = fullname;
                PName[2] = "@FULLNAME";
                Param[3] = phone;
                PName[3] = "@MOBILE_NO";
                Param[4] = email;
                PName[4] = "@EMAIL";
                Param[5] = address;
                PName[5] = "@ADDRESS";
                Param[6] = eid;
                PName[6] = "@id";
                Param[1] = login_user;
                PName[1] = "@MODIFIEDBY";

                i = SqlCmd.ExecNonQuery("SP_USER_PROFILE_Q1", Param, PName, Count = 7);

            }
            else
            {
                Param[0] = userName;
                PName[0] = "@User_NAME";
                //Param[1] = imageUrl;
                //PName[1] = "@PROFILE_FULL_PATH";
                Param[2] = fullname;
                PName[2] = "@FULLNAME";
                Param[3] = phone;
                PName[3] = "@MOBILE_NO";
                Param[4] = email;
                PName[4] = "@EMAIL";
                Param[5] = address;
                PName[5] = "@ADDRESS";
                Param[6] = eid;
                PName[6] = "@id";
                Param[7] = login_user;
                PName[7] = "@MODIFIEDBY";


                uid = eid;

                //if (imagename != "" && imagename != null && base64Image != "" && base64Image != null)
                //{
                //    if (base64Image.StartsWith("data:image"))
                //    {
                //        int base64Index = base64Image.IndexOf("base64,") + 7;
                //        base64Image = base64Image.Substring(base64Index);
                //    }
                //    Directory.SetCurrentDirectory(AppDomain.CurrentDomain.BaseDirectory);
                //    int numericUid = int.Parse(uid);
                //    fileName = "ProfileImage_" + (numericUid) + ".jpg";
                //    profileImagesDirectory = Path.Combine("/assets", "images", "ProfileImages");
                //    profileImagesDirectory = profileImagesDirectory.Replace("\\", "/");

                //    if (!Directory.Exists(profileImagesDirectory))
                //    {
                //        Directory.CreateDirectory(profileImagesDirectory);
                //    }

                //    // Directory.CreateDirectory(profileImagesDirectory);
                //    string fullFilePath = Path.Combine(profileImagesDirectory, fileName);
                //    byte[] fileBytes = Convert.FromBase64String(base64Image);
                //    System.IO.File.WriteAllBytes(fullFilePath, fileBytes);
                //}



                if (!string.IsNullOrEmpty(imagename) && !string.IsNullOrEmpty(base64Image))
                {
                    if (base64Image.StartsWith("data:image"))
                    {
                        int base64Index = base64Image.IndexOf("base64,") + 7;
                        base64Image = base64Image.Substring(base64Index);
                    }

                    int numericUid = int.Parse(uid);
                     fileName = "ProfileImage_" + numericUid + ".jpg";

                    // Convert virtual path to physical path
                    string relativePath = "~/assets/images/ProfileImages/";
                     profileImagesDirectory = HttpContext.Current.Server.MapPath(relativePath);

                    if (!Directory.Exists(profileImagesDirectory))
                    {
                        Directory.CreateDirectory(profileImagesDirectory);
                    }

                    string fullFilePath = Path.Combine(profileImagesDirectory, fileName);

                    byte[] fileBytes = Convert.FromBase64String(base64Image);
                    System.IO.File.WriteAllBytes(fullFilePath, fileBytes);
                }








                if (fileName == "" || fileName == null)
                {
                    Param[8] = "DefaultUser.jpg"; PName[8] = "@imagename";
                }
                else
                {
                    Param[8] = fileName; PName[8] = "@imagename";
                }


                if (profileImagesDirectory == "" || profileImagesDirectory == null)
                {

                    Param[1] = "assets\\images\\ProfileImages\\DefaultUser.jpg"; PName[1] = "@PROFILE_FULL_PATH";
                }
                else
                {
                    Param[1] = "assets/images/ProfileImages/" + fileName; PName[1] = "@PROFILE_FULL_PATH";
                }

                i = SqlCmd.ExecNonQuery("SP_USER_PROFILE_Q2", Param, PName, Count = 9);
            }

            if (i > 0)
            {
                HttpContext.Current.Session.Clear();
                HttpContext.Current.Session.Abandon();
                return "User Saved Successfully";
            }
            else
            {
                return "Failed To Save the User";
            }
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }
    [System.Web.Services.WebMethod]
    public static string ChangePassword(string currentPassword, string newPassword)
    {
        try
        {
            string userId = HttpContext.Current.Session["UserId"].ToString();
            string loginUser = HttpContext.Current.Session["USERNAME"].ToString();

            Param[0] = userId;
            PName[0] = "@id";

            DataTable dt = SqlCmd.SelectData("SP_GET_USER_PASSWORD_Q1", Param, PName, Count = 1);

            if (dt.Rows.Count > 0)
            {
                string dbPassword = dt.Rows[0]["PASSWORD"].ToString();
                string encryptedCurrent = Encryptus(currentPassword);

                if (encryptedCurrent == dbPassword)
                {
                    string encryptedNew = Encryptus(newPassword);

                    Param[0] = userId;
                    PName[0] = "@id";
                    Param[1] = encryptedNew;
                    PName[1] = "@password";

                    int i = SqlCmd.ExecNonQuery("SP_USERDETAILS_Q6", Param, PName, Count = 2);

                    if (i > 0)
                    {
                        HttpContext.Current.Session.Clear();
                        HttpContext.Current.Session.Abandon();
                        return "Password changed successfully.";
                    }
                    else
                    {
                        return "Failed to update password.";
                    }
                }
                else
                {
                    return "Invalid current password.";
                }
            }
            else
            {
                return "User not found.";
            }
        }
        catch (Exception ex)
        {
            return "Error: " + ex.Message;
        }
    }

    private static string Encryptus(string passus)
    {
        string EncryptionKey = "TVDCOMKPTCLKARN123";
        byte[] clearBytes = Encoding.Unicode.GetBytes(passus);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                passus = Convert.ToBase64String(ms.ToArray());
            }
        }
        return passus;
    }
}
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class AddUser : System.Web.UI.Page
{
    static SqlCmd SqlCmds = new SqlCmd();
    static string[] Param = new string[30];
    static string[] PName = new string[30];
    static int Count = 0;
    static string msg = "";
    static string login_user = "";
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

        //ForgotPassword("darshu", "123", "");
    }

    [WebMethod]
    public static string saveuser(string username, string fullname, string phonenumber, string email,
    string password, string userfrom,string userfromname, string masteruser,string masterusername,
    string role, string remarks, string status, string base64Image,
    string loginfrom, string image)
    {
        string fileName = ""; string uid = ""; string profileImagesDirectory = "";
        try
        {

            if (image == "dynamic")
            {
                DataTable dt = SqlCmds.SelectQuery("SP_ADDUSER_Q3");
                if (dt.Rows.Count > 0)
                {
                    uid = dt.Rows[0]["uid"].ToString();
                    int numericUid = int.Parse(uid);
                    fileName = "ProfileImage_" + (numericUid + 1) + ".png";
                }

                if (base64Image.StartsWith("data:image"))
                {
                    int base64Index = base64Image.IndexOf("base64,") + 7;
                    base64Image = base64Image.Substring(base64Index);
                }

                Directory.SetCurrentDirectory(AppDomain.CurrentDomain.BaseDirectory);
                profileImagesDirectory = Path.Combine("assets", "images", "ProfileImages");
                profileImagesDirectory = profileImagesDirectory.Replace("\\", "/");

                if (!Directory.Exists(profileImagesDirectory))
                {
                    Directory.CreateDirectory(profileImagesDirectory);
                }
                string fullFilePath = Path.Combine(profileImagesDirectory, fileName);
                byte[] fileBytes = Convert.FromBase64String(base64Image);
                System.IO.File.WriteAllBytes(fullFilePath, fileBytes);
            }
            else
            {
                profileImagesDirectory = Path.Combine("assets", "images", "ProfileImages");
                profileImagesDirectory = profileImagesDirectory.Replace("\\", "/");
                fileName = "DefaultUser.jpg";
            }


            Param[0] = username;
            PName[0] = "@username";
            Param[1] = "";
            PName[1] = "@userid";
            Count = 2;
            DataTable chkuname = SqlCmds.SelectData("SP_ADDUSER_Q9", Param, PName, Count: 2);

            Param[0] = phonenumber;
            PName[0] = "@phonenumber"; Param[1] = "";
            PName[1] = "@userid";
            DataTable chkphno = SqlCmds.SelectData("SP_ADDUSER_Q7", Param, PName, Count: 2);

            Param[0] = email.ToLower();
            PName[0] = "@email"; Param[1] = "";
            PName[1] = "@userid";
            DataTable chkemail = SqlCmds.SelectData("SP_ADDUSER_Q8", Param, PName, Count: 2);

            if (chkuname.Rows.Count > 0)
            {
                return "UNAME";
            }

            else if (chkphno.Rows.Count > 0)
            {
                return "PHNO";
            }

            else if (chkemail.Rows.Count > 0)
            {
                return "EMAIL";
            }
            else
            {
                Param[0] = username; PName[0] = "@username";
                Param[1] = fullname; PName[1] = "@fullname";
                Param[2] = phonenumber; PName[2] = "@phonenumber";
                Param[3] = email.ToLower(); PName[3] = "@email";
                Param[4] = Encryptus(password); PName[4] = "@password";

                Param[5] = userfromname; PName[5] = "@UserfromName";
                Param[6] = masteruser; PName[6] = "@masteruser";
                Param[7] = role; PName[7] = "@role";
                Param[8] = remarks; PName[8] = "@remarks";
                Param[9] = status; PName[9] = "@status";
                Param[10] = fileName; PName[10] = "@imagename";
                Param[11] = loginfrom; PName[11] = "@loginfrom";

                Param[12] = profileImagesDirectory + "/" + fileName; PName[12] = "@profilepath";

                Param[13] = login_user; PName[13] = "@addedby";
                Param[14] = userfrom; PName[14] = "@USER_TABLE_ID";
                Param[15] = masterusername; PName[15] = "@MasterUserName";
                //int i = 1;
                int i = SqlCmds.ExecNonQuery("SP_ADDUSER_Q4", Param, PName, Count = 16);
                if (i > 0)
                {
                    return "User Saved Successfully";
                }
                else
                {
                    return "Failed To Save the User";
                }
            }
        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }

    private static string Encryptus(string password)
    {
        string EncryptionKey = "TVDCOMKPTCLKARN123";
        byte[] clearBytes = Encoding.Unicode.GetBytes(password);
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
                password = Convert.ToBase64String(ms.ToArray());
            }
        }
        return password;
    }

    [WebMethod]
    public static Object BindData()
    {
        object result = null;
        try
        {

            DataTable dt = SqlCmds.SelectQuery("SP_ADDUSER_Q5");

            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; dt.Rows.Count > i; i++)
                {
                    string pass = dt.Rows[i]["PASSWORD"].ToString();
                    pass = Decrypt(pass);
                    dt.Rows[i]["PASSWORD"] = pass;
                }

                result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
            }
            else
            {
                result = "No data found";
            }

            return result;

        }
        catch (Exception ex)
        {

        }
        return null;
    }

    [WebMethod]
    public static string Decrypt(string password)
    {
        string pass = password;
        string EncryptionKey = "TVDCOMKPTCLKARN123";
        byte[] cipherBytes = Convert.FromBase64String(pass);
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

   

    [WebMethod]
    public static string updatedetils(string username, string fullname, string phonenumber, string email,
     string password, string userfrom, string userfromname, string masteruser,string masterusername,
    string role, string remarks, string status, string imagename, string base64Image,
    string loginfrom, string userid, string bindpath, string bindimage)
    {
        string fileName = ""; string uid = ""; string profileImagesDirectory = "";
        try
        {
            uid = userid;

            if (imagename != "" && imagename != null && base64Image != "" && base64Image != null)
            {
                if (base64Image.StartsWith("data:image"))
                {
                    int base64Index = base64Image.IndexOf("base64,") + 7;
                    base64Image = base64Image.Substring(base64Index);
                }
                Directory.SetCurrentDirectory(AppDomain.CurrentDomain.BaseDirectory);
                int numericUid = int.Parse(uid);
                fileName = "ProfileImage_" + (numericUid) + ".jpg";
                profileImagesDirectory = Path.Combine("assets", "images", "ProfileImages");
                profileImagesDirectory = profileImagesDirectory.Replace("\\", "/");
                if (!Directory.Exists(profileImagesDirectory))
                {
                    Directory.CreateDirectory(profileImagesDirectory);
                }

                // Directory.CreateDirectory(profileImagesDirectory);
                string fullFilePath = Path.Combine(profileImagesDirectory, fileName);
                byte[] fileBytes = Convert.FromBase64String(base64Image);
                System.IO.File.WriteAllBytes(fullFilePath, fileBytes);
            }
            Param[0] = username;
            PName[0] = "@username";
            Param[1] = uid;
            PName[1] = "@userid";
            Count = 2;
            DataTable chkuname = SqlCmds.SelectData("SP_ADDUSER_Q9", Param, PName, Count: 2);

            Param[0] = phonenumber;
            PName[0] = "@phonenumber"; Param[1] = uid;
            PName[1] = "@userid";
            DataTable chkphno = SqlCmds.SelectData("SP_ADDUSER_Q7", Param, PName, Count: 2);

            Param[0] = email.ToLower();
            PName[0] = "@email"; Param[1] = uid;
            PName[1] = "@userid";
            DataTable chkemail = SqlCmds.SelectData("SP_ADDUSER_Q8", Param, PName, Count: 2);

            if (chkuname.Rows.Count > 0)
            {
                return "UNAME";
            }

            else if (chkphno.Rows.Count > 0)
            {
                return "PHNO";
            }

            else if (chkemail.Rows.Count > 0)
            {
                return "EMAIL";
            }

            else
            {

                Param[0] = username; PName[0] = "@username";
                Param[1] = fullname; PName[1] = "@fullname";
                Param[2] = phonenumber; PName[2] = "@phonenumber";
                Param[3] = email.ToLower(); PName[3] = "@email";
                Param[4] = Encryptus(password); PName[4] = "@password";
                Param[5] = userfromname; PName[5] = "@Userformname";
                Param[6] = masteruser; PName[6] = "@masteruser";
                Param[7] = role; PName[7] = "@role";
                Param[8] = remarks; PName[8] = "@remarks";
                Param[9] = status; PName[9] = "@status";

                if (fileName == "" || fileName == null)
                {
                    if (bindimage == "" || bindimage == null)
                    {
                        Param[10] = "DefaultUser.jpg"; PName[10] = "@imagename";

                    }
                    else
                    {
                        Param[10] = bindimage; PName[10] = "@imagename";

                    }
                }
                else
                {
                    Param[10] = fileName; PName[10] = "@imagename";

                }

                Param[11] = loginfrom; PName[11] = "@loginfrom";
                if (profileImagesDirectory == "" || profileImagesDirectory == null)
                {
                    if (bindpath == "" || bindpath == null)
                    {
                        Param[12] = "assets\\images\\ProfileImages\\DefaultUser.jpg"; PName[12] = "@profilepath";

                    }
                    else
                    {
                        Param[12] = bindpath; PName[12] = "@profilepath";

                    }

                }
                else
                {
                    Param[12] = profileImagesDirectory + "/" + fileName; PName[12] = "@profilepath";


                }
                Param[13] = login_user; PName[13] = "@addedby";
                Param[14] = userfrom; PName[14] = "@USER_TABLE_ID";
                Param[15] = userid;
                PName[15] = "@UID";
                Param[16] = masterusername; PName[16] = "@Masterusername";
                //int i=1;
                int i = SqlCmds.ExecNonQuery("SP_ADDUSER_Q6", Param, PName, Count = 17);
                if (i > 0)
                {
                    return "User Updated Successfully";
                }
                else
                {
                    return "Failed To Save the User";
                }
            }



        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }

    [WebMethod]
    public static string deleteimage(string userid)
    {
        try
        {
            Param[0] = userid;
            PName[0] = "@userid";
            int i = SqlCmds.ExecNonQuery("SP_ADDUSER_Q10", Param, PName, Count = 1);
            return i > 0 ? "Image Deleted successfully" : "";

        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }

    [WebMethod]
    public static Object BindData_log()
    {
        object result = null;
        try
        {

            DataTable dt = SqlCmds.SelectQuery("SP_ADDUSER_11");

            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; dt.Rows.Count > i; i++)
                {
                    string pass = dt.Rows[i]["PASSWORD"].ToString();
                    pass = Decrypt(pass);
                    dt.Rows[i]["PASSWORD"] = pass;
                }

                result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
            }
            else
            {
                result = "No data found";
            }

            return result;

        }
        catch (Exception ex)
        {

        }
        return null;
    }

    [WebMethod]
    public static Object GetRoleList(string user_table_id, string master_table_id)
    {
        object result = null;
        Param[0] = user_table_id;
        PName[0] = "@Type_table_Id";
        Param[1] = master_table_id;
        PName[1] = "@Master_User_Id";
        DataTable dt = SqlCmds.SelectData("SP_Add_Roles_Q1", Param, PName, Count = 2);

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
        else
        {
            result = "No data found";
        }
        return result;
    }




    [WebMethod]
    public static Object GetUSERList()
    {
        object result = null;

        DataTable dt = SqlCmds.SelectQuery("SP_Add_RolesType_Q1");

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
        else
        {
            result = "No data found";
        }
        return result;
    }



    [WebMethod]
    public static Object GetmasteruserList(string typeid)
    {
        object result = null;
        Param[0] = typeid;
        PName[0] = "@type";
        DataTable dt = SqlCmds.SelectData("SP_Add_RolesTypeUser_Q1", Param, PName, Count = 1);

        if (dt != null && dt.Rows.Count > 0)
        {
            result = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
        }
        else
        {
            result = "No data found";
        }
        return result;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;

/// <summary>
/// Summary description for Mail
/// </summary>
public class Mail
{
    public static void Sending_Mail(string emailAddresses, string Subject , string MessageBody)
    {
        
        try
        {
            string mFrom = "alert@kptcl1.org";
            string password = "Bgcv5$3e4rtUjkn0";
          //  string subject = "Forgot Password";
            //string body = ("<b>Dear " + userName + ",</b><br/><b>We have recieved your Forgot Password Request. Your Credentials </b><br/> <b>USER NAME :</b> " + userName + ",<br/><b> PASSWORD : </b>" + passsword + "<br/> Please Login With the above credentials. </b>");
            MailMessage message = new MailMessage();
            message.From = new MailAddress(mFrom); // Sender's email
            message.Subject = Subject;
            message.Body = MessageBody;
            message.IsBodyHtml = true;

            string[] Emailaddress = emailAddresses.Split(',');

            for (int i=0; Emailaddress.Length > i; i++)
            {
                message.To.Add(Emailaddress[i].Trim());
            }

            SmtpClient smptc = new SmtpClient("smtp.rediffmailpro.com", 587);
            smptc.UseDefaultCredentials = false;
            smptc.EnableSsl = true;
            smptc.Credentials = new System.Net.NetworkCredential(mFrom, password);
            smptc.Send(message);
        }
        catch (Exception Ex)
        {
        }
    }


  

}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for alertmsg
/// </summary>
public class alertmsg
{
    public alertmsg()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void ShowAlertMessage(string error)
    {
        Page page = HttpContext.Current.Handler as Page;
        if (page != null)
        {
            int strlen = error.Length;
            if (strlen > 100)
            {
                error = error.Substring(0, 100);
            }
            error = error.Replace("'", "_");
            error = error.Trim();
            ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + error + "');", true);
        }
    }

    public void ShowSuccessMessage(string message)
    {
        Page page = HttpContext.Current.Handler as Page;
        if (page != null)
        {
            string script = string.Format(
                "Swal.fire({{ title: 'Success', text: '{0}', icon: 'success', confirmButtonText: 'OK', customClass: {{ confirmButton: 'btn btn-success' }}, buttonsStyling: false }});",
                message.Replace("'", "\\'")
            );
            ScriptManager.RegisterStartupScript(page, page.GetType(), "successMsg", script, true);
        }
    }

    public void ShowWarningMessage(string message)
    {
        Page page = HttpContext.Current.Handler as Page;
        if (page != null)
        {
            string script = string.Format(
                "Swal.fire({{ title: 'Warning', text: '{0}', icon: 'warning', confirmButtonText: 'OK', customClass: {{ confirmButton: 'btn btn-warning' }}, buttonsStyling: false }});",
                message.Replace("'", "\\'")
            );
            ScriptManager.RegisterStartupScript(page, page.GetType(), "warningMsg", script, true);
        }
    }

    public void ShowErrorMessage(string message)
    {
        Page page = HttpContext.Current.Handler as Page;
        if (page != null)
        {
            string script = string.Format(
                "Swal.fire({{ title: 'Error', text: '{0}', icon: 'error', confirmButtonText: 'OK', customClass: {{ confirmButton: 'btn btn-danger' }}, buttonsStyling: false }});",
                message.Replace("'", "\\'")
            );
            ScriptManager.RegisterStartupScript(page, page.GetType(), "errorMsg", script, true);
        }
    }

    public void ShowInfoMessage(string message)
    {
        Page page = HttpContext.Current.Handler as Page;
        if (page != null)
        {
            string script = string.Format(
                "Swal.fire({{ title: 'Information', text: '{0}', icon: 'info', confirmButtonText: 'OK', customClass: {{ confirmButton: 'btn btn-info text-white' }}, buttonsStyling: false }});",
                message.Replace("'", "\\'")
            );
            ScriptManager.RegisterStartupScript(page, page.GetType(), "infoMsg", script, true);
        }
    }

}
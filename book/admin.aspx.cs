using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("管理者姓名:" + User.Identity.Name + "權限如下:");
        foreach (string s in Roles.GetRolesForUser())
        {
            Response.Write("<li>" + s + "</li>");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin/forumAdmin.aspx");
    }
}

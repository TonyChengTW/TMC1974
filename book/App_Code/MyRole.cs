using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
/// <summary>
/// MyRole 的摘要说明
/// </summary>
public class MyRole : RoleProvider
{
	public MyRole()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    string connectionstring = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/demo.mdb");
    public override void AddUsersToRoles(string[] usernames, string[] roleNames)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override string ApplicationName
    {
        get
        {
            throw new Exception("The method or operation is not implemented.");
        }
        set
        {
            throw new Exception("The method or operation is not implemented.");
        }
    }

    public override void CreateRole(string roleName)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override string[] FindUsersInRole(string roleName, string usernameToMatch)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override string[] GetAllRoles()
    {
        return new string[] { "admin", "guest" };
    }

    public override string[] GetRolesForUser(string username)
    {
        string[] tmp = new string[] { };
        using (OleDbConnection conn = new OleDbConnection(connectionstring))
        {
            OleDbCommand comm = new OleDbCommand();
            comm.CommandText = "select top 1 * from users where u_name=@name";
            comm.Parameters.AddWithValue("@name", username);
           
            comm.Connection = conn;
            conn.Open();
            using (OleDbDataReader dr = comm.ExecuteReader())
            {
                if (dr.Read())
                {

                    tmp = dr["U_role"].ToString().Split(',');

                }

            }
        }
        return tmp;
    }

    public override string[] GetUsersInRole(string roleName)
    {
        return null;   
    }

    public override bool IsUserInRole(string username, string roleName)
    {
        using (OleDbConnection conn = new OleDbConnection(connectionstring))
        {
            OleDbCommand comm = new OleDbCommand();
            comm.CommandText = "select top 1 * from users where u_name=@name and u_role=@role";
            comm.Parameters.AddWithValue("@name", username);
            comm.Parameters.AddWithValue("@role", roleName);
            comm.Connection = conn;
            conn.Open();
            using (OleDbDataReader dr = comm.ExecuteReader())
            {
                if (dr.HasRows)
                {
                   
                        return true;
                    
                }
                return false;
            }
        }
    }

    public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public override bool RoleExists(string roleName)
    {
        throw new Exception("The method or operation is not implemented.");
    }
}

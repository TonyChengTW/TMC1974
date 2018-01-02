<%@ Page Language="VB" AutoEventWireup="false" CodeFile="changePassword.aspx.vb" Inherits="Admin_changePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/demo.mdb"
            DeleteCommand="DELETE FROM [Users] WHERE [U_ID] = ?" InsertCommand="INSERT INTO [Users] ([U_ID], [U_Name], [U_pwd], [U_role]) VALUES (?, ?, ?, ?)"
            SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [U_Name] = ?, [U_pwd] = ?, [U_role] = ? WHERE [U_ID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="U_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="U_Name" Type="String" />
                <asp:Parameter Name="U_pwd" Type="String" />
                <asp:Parameter Name="U_role" Type="String" />
                <asp:Parameter Name="U_ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="U_ID" Type="Int32" />
                <asp:Parameter Name="U_Name" Type="String" />
                <asp:Parameter Name="U_pwd" Type="String" />
                <asp:Parameter Name="U_role" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="U_ID"
            DataSourceID="AccessDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="U_ID" HeaderText="U_ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="U_ID" />
                <asp:BoundField DataField="U_Name" HeaderText="U_Name" SortExpression="U_Name" />
                <asp:BoundField DataField="U_pwd" HeaderText="U_pwd" SortExpression="U_pwd" />
                <asp:BoundField DataField="U_role" HeaderText="U_role" SortExpression="U_role" />
            </Columns>
        </asp:GridView>
        <br />
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px">
                    <input id="Button5" onclick="window.history.back()" type="button" value="回上一頁" /></td>
                <td style="width: 100px; text-align: center;">
                    <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutImageUrl="~/images/logoff.jpg"
                        LogoutPageUrl="~/board.aspx" LogoutText="" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

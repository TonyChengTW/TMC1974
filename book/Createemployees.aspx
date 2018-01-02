<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Createemployees.aspx.vb" Inherits="Createemployees" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>未命名頁面</title>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        新增員工：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="新增" CausesValidation="False" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="您未輸入姓名"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:AccessDataSource ID="ADS_Ceateremployee" runat="server" 
            DataFile="~/App_Data/Custom.mdb" 
            DeleteCommand="DELETE FROM [employees] WHERE [uid] = ?" 
            InsertCommand="INSERT INTO [employees] ([uid], [T_uid], [workpeople]) VALUES (?, ?, ?)" 
            SelectCommand="SELECT * FROM [employees]" 
            
            UpdateCommand="UPDATE [employees] SET [T_uid] = ?, [workpeople] = ? WHERE [uid] = ?">
            <DeleteParameters>
                <asp:Parameter Name="uid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="T_uid" Type="Int32" />
                <asp:Parameter Name="workpeople" Type="String" />
                <asp:Parameter Name="uid" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="uid" Type="Int32" />
                <asp:Parameter Name="T_uid" Type="Int32" />
                <asp:Parameter Name="workpeople" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="uid" DataSourceID="ADS_Ceateremployee">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    CausesValidation="False" ButtonType="Button" />
                <asp:BoundField DataField="workpeople" HeaderText="員工姓名" 
                    SortExpression="workpeople" HtmlEncode="False" 
                    HtmlEncodeFormatString="False" />
            </Columns>
        </asp:GridView>
        <br />
    </p>
    </form>
</body>
</html>

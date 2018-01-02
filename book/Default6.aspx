<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default6.aspx.vb" Inherits="Default6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="AccessDataSource1">
            <Columns>
                <asp:BoundField DataField="uid" HeaderText="uid" InsertVisible="False" 
                    ReadOnly="True" SortExpression="uid" />
                <asp:BoundField DataField="who" HeaderText="who" SortExpression="who" />
                <asp:BoundField DataField="subject" HeaderText="subject" 
                    SortExpression="subject" />
                <asp:BoundField DataField="msg" HeaderText="msg" SortExpression="msg" />
                <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" />
                <asp:BoundField DataField="dcreate" HeaderText="dcreate" 
                    SortExpression="dcreate" />
                <asp:BoundField DataField="newdcreate" HeaderText="newdcreate" 
                    SortExpression="newdcreate" />
                <asp:BoundField DataField="hits" HeaderText="hits" SortExpression="hits" />
                <asp:BoundField DataField="re" HeaderText="re" SortExpression="re" />
                <asp:BoundField DataField="ip" HeaderText="ip" SortExpression="ip" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/Tmc.mdb" 
            SelectCommand="SELECT [uid], [who], [subject], [msg], [tel], [email], [url], [dcreate], [newdcreate], [hits], [re], [ip] FROM [talk]">
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>

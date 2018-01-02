<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Printemployees.aspx.vb" Inherits="Printemployees" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>員工排班表</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
    
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/Custom.mdb" 
            SelectCommand="SELECT [title] FROM [employeesTitle]"></asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="AccessDataSource1" Font-Bold="True" Font-Size="XX-Large" 
            ShowHeader="False" Width="509px">
            <Columns>
                <asp:BoundField DataField="title" HeaderText="title" ShowHeader="False" 
                    SortExpression="title" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/App_Data/Custom.mdb" SelectCommand="SELECT * FROM [monthcalendar] ORDER BY [T_uid]">
        </asp:AccessDataSource>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="T_uid" DataSourceID="AccessDataSource2" Width="509px">
            <Columns>
                <asp:BoundField DataField="T_month" HeaderText="月份" SortExpression="T_month" />
                <asp:BoundField DataField="T_day" HeaderText="日" SortExpression="T_day" />
                <asp:BoundField DataField="T_one" HeaderText="B1" SortExpression="T_one" />
                <asp:BoundField DataField="T_two" HeaderText="2F" SortExpression="T_two" />
                <asp:BoundField DataField="T_three" HeaderText="3F" SortExpression="T_three" />
                <asp:BoundField DataField="T_four" HeaderText="4F" SortExpression="T_four" />
                <asp:BoundField DataField="T_five" HeaderText="5F" SortExpression="T_five" />
                <asp:BoundField DataField="T_Bone" HeaderText="3號B1" SortExpression="T_Bone" />
                <asp:BoundField DataField="T_threeone" HeaderText="3號3F" 
                    SortExpression="T_threeone" />
                <asp:BoundField DataField="T_threetwo" HeaderText="支援" 
                    SortExpression="T_threetwo" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="uid" DataSourceID="AccessDataSource3" ShowHeader="False" 
            Width="509px">
            <RowStyle HorizontalAlign="Left" />
            <Columns>
                <asp:BoundField DataField="bulletin" HeaderText="bulletin" 
                    SortExpression="bulletin" />
            </Columns>
        </asp:GridView>
    
    </div>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
            DataFile="~/App_Data/Custom.mdb" 
            SelectCommand="SELECT * FROM [bulletinemployees]"></asp:AccessDataSource>
    </form>
</body>
</html>

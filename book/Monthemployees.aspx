<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Monthemployees.aspx.vb" Inherits="_Default" Debug=true MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>員工排班表</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <asp:Label ID="Label1" runat="server" Text="8號B1"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ADS_Employee"
            DataTextField="workpeople" DataValueField="workpeople">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="3樓"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="ADS_Employee"
            DataTextField="workpeople" DataValueField="workpeople">
        </asp:DropDownList>
        <asp:Label ID="Label3" runat="server" Text="4樓"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="ADS_Employee"
            DataTextField="workpeople" DataValueField="workpeople">
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="5樓"></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="ADS_Employee"
            DataTextField="workpeople" DataValueField="workpeople">
        </asp:DropDownList>
        <asp:Label ID="Label5" runat="server" Text="3號B1"></asp:Label>
        <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="ADS_Employee"
            DataTextField="workpeople" DataValueField="workpeople">
        </asp:DropDownList>
        <asp:Label ID="Label6" runat="server" Text="異3樓"></asp:Label>
        <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="ADS_Employee"
            DataTextField="workpeople" DataValueField="workpeople">
        </asp:DropDownList>
        <asp:Label ID="Label7" runat="server" Text="異3樓"></asp:Label>
        <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="ADS_Employee"
            DataTextField="workpeople" DataValueField="workpeople">
        </asp:DropDownList><br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black"
            DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black"
            Height="220px" NextPrevFormat="FullMonth" SelectionMode="DayWeekMonth" Width="400px">
            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
            <TodayDayStyle BackColor="#CCCC99" />
            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                ForeColor="#333333" Width="1%" />
            <DayStyle Width="14%" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333"
                Height="10pt" />
            <TitleStyle BackColor="Blue" Font-Bold="True" Font-Size="13pt" ForeColor="White"
                Height="14pt" />
        </asp:Calendar>
        <asp:Button ID="Button1" runat="server" Text="新增資料" />
        &nbsp;&nbsp;<asp:Button ID="Btn_Print" runat="server" Text="列印資料" />
        &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Createemployees.aspx" Target="_self">新增員工</asp:HyperLink>
        &nbsp;<br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="uid" DataSourceID="ADS_Title" ShowHeader="False" Width="343px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            </Columns>
        </asp:GridView>
&nbsp;<asp:GridView ID="Grid_AddMonth" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="T_uid" DataSourceID="ADS_Month" BorderColor="Black" 
            CellPadding="1" Width="683px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField HeaderText="月份" SortExpression="T_month">
                    <EditItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("T_month") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("T_month") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="日" SortExpression="T_day">
                    <EditItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("T_day") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("T_day") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="B1" SortExpression="T_one">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList8" runat="server" 
                            DataSourceID="ADS_Employee" DataTextField="workpeople" 
                            DataValueField="workpeople" SelectedValue='<%# Bind("T_one") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("T_one") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2F" SortExpression="T_two">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="ADS_Employee" 
                            DataTextField="workpeople" DataValueField="workpeople" 
                            SelectedValue='<%# Bind("T_two") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("T_two") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3F" SortExpression="T_three">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList10" runat="server" 
                            DataSourceID="ADS_Employee" DataTextField="workpeople" 
                            DataValueField="workpeople" SelectedValue='<%# Bind("T_three") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("T_three") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="4F" SortExpression="T_four">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList11" runat="server" 
                            DataSourceID="ADS_Employee" DataTextField="workpeople" 
                            DataValueField="workpeople" SelectedValue='<%# Bind("T_four") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("T_four") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="5F" SortExpression="T_five">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList12" runat="server" 
                            DataSourceID="ADS_Employee" DataTextField="workpeople" 
                            DataValueField="workpeople" SelectedValue='<%# Bind("T_five") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("T_five") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3號-B1" SortExpression="T_Bone">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList13" runat="server" 
                            DataSourceID="ADS_Employee" DataTextField="workpeople" 
                            DataValueField="workpeople" SelectedValue='<%# Bind("T_Bone") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("T_Bone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3號-3F" SortExpression="T_threeone">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList14" runat="server" 
                            DataSourceID="ADS_Employee" DataTextField="workpeople" 
                            DataValueField="workpeople" SelectedValue='<%# Bind("T_threeone") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("T_threeone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="支援" SortExpression="T_threetwo">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList15" runat="server" 
                            DataSourceID="ADS_Employee" DataTextField="workpeople" 
                            DataValueField="workpeople" SelectedValue='<%# Bind("T_threetwo") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("T_threetwo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="uid" DataSourceID="ADS_Rule" ShowHeader="False" 
            Width="683px">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="bulletin" HeaderText="bulletin" 
                    SortExpression="bulletin" >
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="ADS_Employee" runat="server" DataFile="~/App_Data/Custom.mdb"
            SelectCommand="SELECT DISTINCT [workpeople] FROM [employees]">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_Month" runat="server" 
            DataFile="~/App_Data/Custom.mdb" 
            DeleteCommand="DELETE FROM [monthcalendar] WHERE [T_uid] = ?" 
            InsertCommand="INSERT INTO [monthcalendar] ([T_uid], [T_month], [T_day], [T_one], [T_two], [T_three], [T_four], [T_five], [T_Bone], [T_threeone], [T_threetwo], [name]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            SelectCommand="SELECT * FROM [monthcalendar] ORDER BY [T_uid]" 
            
            
            
            
            
            UpdateCommand="UPDATE [monthcalendar] SET [T_one] = ?, [T_two] = ?, [T_three] = ?, [T_four] = ?, [T_five] = ?, [T_Bone] = ?, [T_threeone] = ?, [T_threetwo] = ?, [name] = ? WHERE [T_uid] = ?">
            <DeleteParameters>
                <asp:Parameter Name="T_uid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                
                <asp:Parameter Name="T_one" Type="String" />
                <asp:Parameter Name="T_two" Type="String" />
                <asp:Parameter Name="T_three" Type="String" />
                <asp:Parameter Name="T_four" Type="String" />
                <asp:Parameter Name="T_five" Type="String" />
                <asp:Parameter Name="T_Bone" Type="String" />
                <asp:Parameter Name="T_threeone" Type="String" />
                <asp:Parameter Name="T_threetwo" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="T_uid" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="T_uid" Type="Int32" />
                <asp:Parameter Name="T_month" Type="String" />
                <asp:Parameter Name="T_day" Type="String" />
                <asp:Parameter Name="T_one" Type="String" />
                <asp:Parameter Name="T_two" Type="String" />
                <asp:Parameter Name="T_three" Type="String" />
                <asp:Parameter Name="T_four" Type="String" />
                <asp:Parameter Name="T_five" Type="String" />
                <asp:Parameter Name="T_Bone" Type="String" />
                <asp:Parameter Name="T_threeone" Type="String" />
                <asp:Parameter Name="T_threetwo" Type="String" />
                <asp:Parameter Name="name" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_Title" runat="server" 
            DataFile="~/App_Data/Custom.mdb" 
            DeleteCommand="DELETE FROM [employeesTitle] WHERE [uid] = ?" 
            InsertCommand="INSERT INTO [employeesTitle] ([uid], [title]) VALUES (?, ?)" 
            SelectCommand="SELECT * FROM [employeesTitle]" 
            UpdateCommand="UPDATE [employeesTitle] SET [title] = ? WHERE [uid] = ?">
            <DeleteParameters>
                <asp:Parameter Name="uid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="uid" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="uid" Type="Int32" />
                <asp:Parameter Name="title" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_Rule" runat="server" 
            DataFile="~/App_Data/Custom.mdb" 
            DeleteCommand="DELETE FROM [bulletinemployees] WHERE [uid] = ?" 
            InsertCommand="INSERT INTO [bulletinemployees] ([uid], [bulletin]) VALUES (?, ?)" 
            SelectCommand="SELECT * FROM [bulletinemployees]" 
            
            UpdateCommand="UPDATE [bulletinemployees] SET [bulletin] = ? WHERE [uid] = ?">
            <DeleteParameters>
                <asp:Parameter Name="uid" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="bulletin" Type="String" />
                <asp:Parameter Name="uid" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="uid" Type="Int32" />
                <asp:Parameter Name="bulletin" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
        &nbsp;
        <br />
    </div>
    </form>
</body>
</html>

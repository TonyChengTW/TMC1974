<%@ Page Language="VB" AutoEventWireup="false"  CodeFile="Reforumnew.aspx.vb" Inherits="Re_tmc " MaintainScrollPositionOnPostback="true"  validateRequest="false"  %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>�������Q�װ�</title> 
 <style type="text/css">
        .style3
        {
            width: 49px;
            height: 736px;
        }
        .style4
        {
            height: 736px;
        }
        </style>

</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center" title="�������^�аQ��">
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="uid" DataSourceID="AccessDataSource1" Width="80%">
            <EditItemTemplate>
                uid:
                <asp:Label ID="uidLabel1" runat="server" Text='<%# Eval("uid") %>'></asp:Label><br />
               subject:
                <asp:TextBox ID="main_subjectTextBox" runat="server" Text='<%# Bind("subject") %>'>
                </asp:TextBox><br />
                msg:
                <asp:TextBox ID="main_contentTextBox" runat="server" Text='<%# Bind("msg") %>'>
                </asp:TextBox><br />
                dcreate:
                <asp:TextBox ID="main_timeTextBox" runat="server" Text='<%# Bind("dcreate") %>'>
                </asp:TextBox><br />
               who:
                <asp:TextBox ID="main_nameTextBox" runat="server" Text='<%# Bind("who") %>'>
                </asp:TextBox><br />
                email:
                <asp:TextBox ID="main_emailTextBox" runat="server" Text='<%# Bind("email") %>'>
                </asp:TextBox><br />
                url:
                <asp:TextBox ID="main_urlTextBox" runat="server" Text='<%# Bind("url") %>'>
                </asp:TextBox><br />
               tel:
                <asp:TextBox ID="main_telTextBox" runat="server" Text='<%# Bind("tel") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="��s">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="����">
                </asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                subject:
                <asp:TextBox ID="main_subjectTextBox" runat="server" Text='<%# Bind("subject") %>'>
                </asp:TextBox><br />
                msg:
                <asp:TextBox ID="main_contentTextBox" runat="server" Text='<%# Bind("msg") %>'>
                </asp:TextBox><br />
                dcreate:
                <asp:TextBox ID="main_timeTextBox" runat="server" Text='<%# Bind("dcreate") %>'>
                </asp:TextBox><br />
               who:
                <asp:TextBox ID="main_nameTextBox" runat="server" Text='<%# Bind("who") %>'>
                </asp:TextBox><br />
                email:
                <asp:TextBox ID="main_emailTextBox" runat="server" Text='<%# Bind("email") %>'>
                </asp:TextBox><br />
                url:
                <asp:TextBox ID="main_urlTextBox" runat="server" Text='<%# Bind("url") %>'>
                </asp:TextBox><br />
                tel:
                <asp:TextBox ID="main_telTextBox" runat="server" Text='<%# Bind("tel") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="���J">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="����">
                </asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                <table border="1" cellspacing="0" style="width: 100%" cellpadding="0">
                    <tr>
                        <td style="width: 100px;  text-align: right; background-color: green;">
                            <span style="color: #ffffff">�D�D</span></td>
                        <td style=" text-align: left; background-color: #ffffcc;" colspan="3">
                            <asp:Label ID="subjectLabel" runat="server" Text='<%# Bind("subject") %>' ForeColor="Blue"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; text-align: right; color: #ffffff; background-color: green;">
                            �d���ɶ�</td>
                        <td style="text-align: left; background-color: #ffffcc;" colspan="3">
                            <asp:Label ID="main_timeLabel" runat="server" Text='<%# Bind("dcreate", "{0:g}") %>' ForeColor="Blue"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 100px;text-align: right; color: #ffffff; background-color: green;">
                            �m�W</td>
                        <td colspan="3" style="background-color: #ffffcc; text-align: left">
                            <asp:Label ID="main_nameLabel" runat="server" Text='<%# Bind("who") %>' ForeColor="Blue"></asp:Label>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px;  text-align: right; color: #ffffff; background-color: green;">
                            �d�����e</td>
                        <td colspan="3" style=" text-align: left; background-color: #ffffcc;">
                            <asp:Label ID="main_contentLabel" runat="server" Text='<%# Replace(Eval("msg"),vbcrlf,"<br>") %>' ForeColor="Blue"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; color: #ffffff; background-color: green; text-align: right">
                            �����M�l��</td>
                        <td colspan="3" style="background-color: #ffffcc; text-align: left">
                            <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl="~/images/icon-home.gif" NavigateUrl='<%# Eval("url") %>'
                                Target="_blank">�ӤH����</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink3" runat="server" ImageUrl="~/images/icon-mail.gif" NavigateUrl='<%# "mailto:" & Eval("email") %>'>�ڪ��H�c</asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td style="width: 100px; color: #ffffff; background-color: green; text-align: right">
                            �q��</td>
                        <td colspan="3" style="background-color: #ffffcc; text-align: left">
                            <asp:Label ID="main_telLabel" runat="server" Text='<%# Bind("tel") %>' ForeColor="Blue"></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
            <HeaderTemplate>
                <strong><span style="font-size: 36pt; color: #0000ff">�������Q�װϥD�D</span></strong>
            </HeaderTemplate>
        </asp:FormView>
        <span style="font-size: 24pt">
            <hr />
            <span style="font-size: 12pt">&nbsp; &nbsp;&nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2"
                    DataKeyNames="re_uid" DataSourceID="AccessDataSource2" EnableTheming="True" ForeColor="Black"
                    GridLines="None" ShowHeader="False" Width="80%">
                    <FooterStyle BackColor="Tan" />
                    <Columns>
                        <asp:TemplateField HeaderText="re_msg" SortExpression="re_msg">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("re_msg") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <table border="1" width="100%" cellpadding="0" cellspacing="0" style="text-align: right">
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            �m�W</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("re_who") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            ���</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("dcreate") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            ���e</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Replace(Eval("re_msg"),vbcrlf,"<br>") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            �l��</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("re_email") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            ����</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("re_url") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 10%; color: #ffffff; background-color: green; text-align: right;">
                                            �q��</td>
                                        <td style="width: 90%; text-align: left;">
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("re_tel") %>'></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <PagerSettings Position="TopAndBottom" />
                </asp:GridView>
                <table style="font-size: 11pt; width: 100%">
                    <tr>
                        <td style="width: 100px; height: 19px">
                        </td>
                        <td style="width: 100px; height: 19px">
                        </td>
                        <td style="width: 100px; height: 19px; text-align: right">
                        </td>
                        <td style="width: 100px; height: 19px; text-align: center">
                            <asp:Button ID="Btnindex2" runat="server" CausesValidation="False" Text="�^����" /></td>
                        <td style="width: 100px; height: 19px; text-align: center"><asp:Button ID="BtnBack" runat="server" CausesValidation="False" Text="�^�W��" /></td>
                    </tr>
                </table>
                &nbsp;<br />
            </span>
        </span>&nbsp;<span style="font-size: 36pt"><strong><span style="color: #0000ff">�������Q�װϦ^�Яd��</span></strong><br />
        </span>
        <table border="1" cellpadding="0" cellspacing="0" style="font-size: 12pt; width: 80%;
            font-family: Times New Roman; background-color: #ffffcc">
            <tr>
                <td style="width: 110px; color: #ffffff; background-color: green; text-align: left; height: 40px;">
                    <span>�m�W</span></td>
                <td  style="background-color: #ffffcc; text-align: left; height: 40px;">
                    <asp:TextBox ID="Txt_who" runat="server" Width="250px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                        ID="Requir_name" runat="server" ControlToValidate="Txt_who" ErrorMessage="�п�J�m�W"></asp:RequiredFieldValidator></td>
            </tr>
           
            <tr height="440px">
                  <td style="color: #ffffff; background-color: green; text-align: left" 
                    Height="100%">
                    <span>���e<br />
                    </span>
                </td>
                <td " style="text-align: left"  Height="440px" >
                         <span><FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" 
                        BasePath="~\FCKeditor\"   Height="440px"> 
                        </FCKeditorV2:FCKeditor>
                    </span>
                    </td>


            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>�l��</span></td>
                <td  style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_email" runat="server" Width="400px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    <span>�q��</span></td>
                <td  style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_tel" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                    ����</td>
                <td  style="background-color: #ffffcc; text-align: left">
                    <asp:TextBox ID="Txt_web" runat="server" Width="395px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td " style="width: 49px; color: #ffffff; background-color: green; text-align: left">
                </td>
                <td  style="background-color: #ffffcc; text-align: center">
                    <asp:Button ID="Btn_Add" runat="server" Text="�s�W" style="height: 21px" />
                    <asp:Button ID="Btn_Clear"
                        runat="server" Text="�M��" /></td>
            </tr>
        &nbsp;&nbsp;&nbsp;</table>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmctest.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE ([uid] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/Tmctest.mdb"
            SelectCommand="SELECT * FROM [talkRe] WHERE ([uid] = ?) ORDER BY [dcreate] DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp;&nbsp;<br />
        &nbsp;</div>
         
    </form>
</body>
</html>

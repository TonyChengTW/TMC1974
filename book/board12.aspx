<%@ Page Language="VB" AutoEventWireup="false" CodeFile="board.aspx.vb" Inherits="Test" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>�������Q�װϭ���-�Q�פf�~�V�m,�t���ޥ�,�H�����Y,�ǲߤ߱o���n�a��</title><script type="text/javascript">

function blinkIt() {

 if (!document.all) return;

 else {

   for(i=0;i<document.all.tags('blink').length;i++){

      s=document.all.tags('blink')[i];

      s.style.visibility=(s.style.visibility=='visible')?'hidden':'visible';

   }

 }

}

</script>

    <style type="text/css">
        .�s�W�˦�1
        {
            background-color: #FFFFCC;
        }
        </style>
</head>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-6652041-3']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<body style="text-align: center" onload="setInterval('blinkIt()',1000)">

    <form id="form1" runat="server">
    <div>
     
        <strong><span style="font-size: 32pt; color: #3300ff; font-family: �з���">�������Q�װϭ���</span></strong><br />
        
        <div> <asp:Label ID="Label1" runat="server" Text="�֭p�H��(2009/10/26)"></asp:Label>
        <asp:Image ID="Image1" runat="server" />
        <asp:Image ID="Image2" runat="server" />
        <asp:Image ID="Image3" runat="server" />
        <asp:Image ID="Image4" runat="server" />
        <asp:Image ID="Image5" runat="server" />
        <asp:Image ID="Image6" runat="server" />
        <asp:Image ID="Image7" runat="server" />
        <asp:Image ID="Image8" runat="server" />
        <asp:Image ID="Image9" runat="server" />
        <asp:Image ID="Image10" runat="server" />
            <asp:Label ID="Label2" runat="server" Text="�Q��H��"></asp:Label>
            <asp:Image ID="Image11" runat="server" />
            <asp:Image ID="Image12" runat="server" />
            <asp:Image ID="Image13" runat="server" />
            <asp:Label ID="Label3" runat="server" Text="����H��"></asp:Label>
            <asp:Image ID="Image14" runat="server" />
            <asp:Image ID="Image15" runat="server" />
            <asp:Image ID="Image16" runat="server" />
            <asp:Label ID="Labe14" runat="server" Text="�{�b�u�W�H��:"></asp:Label>
            <asp:Image ID="Image17" runat="server" />
            <asp:Image ID="Image18" runat="server" /></div>
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td colspan="3" align="center" style="width: 100%; background-color: #ffffcc; text-align: center">
                   <strong><span style="font-size: 24pt">�������|���G���Ͱӷ~(�s�i)�B�ⱡ�B�v�СB�F�v</span></strong>
                </td>

            </tr>       
            <tr style="font-size: 12pt">
                <td align="center" 
                    style="width: 23%; background-color: #ffffcc; text-align: left" 
                    rowspan="4">
                   <marquee direction="up"  scrollamount="1" width="100%" align="midden" >
                    �w��z�Ө찷���d����<br /><br /><br />
                    �d���п�u�����|���͡G<br />���Ͱӷ~�B���ͦⱡ<br />���ͩv�СB���ͬF�v<br /><br /><br />
                    �������v�R������d��<br />�q�Ш��̡I<br /><br /><br /></marquee>
                </td>   


                <td align="top"  style="width: 57%; background-color: #ffffcc; text-align: left">

��������121���d���� �s�W�d��
             
                  <asp:Label ID="Label20" runat="server" Text="Label" ForeColor="Blue"></asp:Label>+  �^�Яd��
             
                  <asp:Label ID="Label21" runat="server" Text="Label" ForeColor="Blue"></asp:Label>
                   =<asp:Label ID="Label22" runat="server" Text="Label" ForeColor="Blue"></asp:Label>

                    

                </td>      

            
                <td align="top" style="width: 20%; background-color: #ffffcc; text-align: left" 
                    rowspan="4">
                <script src="js/showpic.js" type="text/javascript" charset="big5"></script>
                </td>
            </tr>
            <tr style="font-size: 12pt">


                <td align="top"  style="width: 60s%; background-color: #ffffcc; text-align: left">
<div  align="center">
            <a href="../index.asp" title="�^��������">�^��������</a> 
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/boardcount.aspx" 
                        Target="_blank">121���d���Ʀ�</asp:HyperLink>
      <a href="../index.html" title="�^��������"></a><a href="../QA.html">���WQ&amp;A</a><br/>
                  </div>
                     <div align="center"></div>
                     

              </td>      
            </tr>
 <tr style="font-size: 12pt">
           <td align="top"  style="width: 60s%; background-color: #ffffcc; text-align: left">
                 
�j�M�m�W<asp:TextBox ID="Txt_name" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="�j�M�Ы���" />&nbsp;
                    <asp:Button ID="Btn_clearsubject" runat="server" Text="�M���j�M" />



            </td> 
 </tr>

<tr style="font-size: 12pt">


                <td align="center"  style="width: 60s%; background-color: #ffffcc; text-align: left">
                 �j�M���D<asp:TextBox ID="Txt_subject" runat="server"></asp:TextBox>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SelectHelp.aspx" Target="_blank">�j�M������

                    ����</asp:HyperLink>

             </td>      


            </tr>
        </table>
        <table>
            </table>
      
        <br />
        
       
        <div>
        


    
        </div>
        <table border="1" cellpadding="0" cellspacing="0" style="width: 80%">
            <tr>
                <td style="width: 100%; background-color: #ffffcc; text-align: left">
                    <asp:Button ID="Btn_Add" runat="server" Text="�s�W�D�D" />
                     <asp:Button ID="Btn2_Add" runat="server" Text="�h�C��d��" /><a href="http://www.tmc1974.com/book/Reforum.aspx?uid=2605">�h�C��d���ާ@����</a><blink><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Facebook�y��</sapn></blink>
                    <span><img src="../IMAGE/facebook3.jpg"></img><a href="http://www.facebook.com/pages/%E5%8F%B0%E5%8C%97%E5%B8%82%E5%81%A5%E8%A8%80%E7%A4%BE/205558406154076" target="_blank"><img src="../IMAGE/facebook.jpg"></a></span>

</a></td>
                 
            </tr>
        </table>
    </div>
    <asp:AccessDataSource ID="ADS_Insertboard" runat="server" 
            DataFile="~/App_Data/Tmc.mdb" SelectCommand="SELECT         COUNT(*) AS Expr1&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate >= #9/12/2010#)"></asp:AccessDataSource>
    <asp:AccessDataSource ID="ADS_Reboard" runat="server" 
            DataFile="~/App_Data/Tmc.mdb" 
            
            SelectCommand="SELECT COUNT(*) AS Expr1 FROM talkRe WHERE (dcreate >= #14/5/2011#)">
    </asp:AccessDataSource>
     <asp:AccessDataSource ID="ADS_boradcount" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         count (*)&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate > #14/5/2011#)">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ADS_totle" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT         2000 - COUNT(*) AS Expr1&#13;&#10;FROM             talk&#13;&#10;WHERE         (dcreate >= #14/5/2011#)">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Tmc.mdb"
            SelectCommand="SELECT * FROM [talk] WHERE (([who] LIKE '%' + ? + '%') AND ([subject] LIKE '%' + ? + '%')) ORDER BY [top] DESC, [newdcreate] DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="Txt_name" DefaultValue="%" Name="?" PropertyName="Text" />
                <asp:ControlParameter ControlID="Txt_subject" DefaultValue="%" Name="?" PropertyName="Text" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="uid"
            DataSourceID="AccessDataSource1" Width="60%" AllowPaging="True" CellPadding="4" ForeColor="#333333" 

GridLines="None" PageSize="50" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="who" HeaderText="�m�W" SortExpression="who" >
                    <ItemStyle HorizontalAlign="Left" Width="100px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="uid" DataNavigateUrlFormatString="Reforum.aspx?uid={0}"
                    DataTextField="subject" HeaderText="���D">
                    <ItemStyle HorizontalAlign="Left" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="newdcreate" DataFormatString="{0:g}" HeaderText="�̫�^��"  SortExpression="newdcreate" />
                <asp:BoundField DataField="hits" HeaderText="�I�\" SortExpression="hits" />
                <asp:BoundField DataField="re" HeaderText="�^��" SortExpression="re" />
            </Columns>
            <PagerSettings PageButtonCount="10" Position="TopAndBottom" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </form>
   <div><tr>
                <td style="width: 25%">
                    <asp:HyperLink ID="Hype_Admin" runat="server" Font-Bold="True" Font-Italic="False"
                        Font-Names="Times New Roman" NavigateUrl="~/admin.aspx">�޲z�̵n�J</asp:HyperLink></td>
            </tr>
        </div>
</body>
</html>

<%@ Page Title="" Language="VB" MasterPageFile="~/Mobile/TMMobile.master" AutoEventWireup="false" CodeFile="TMIndex.aspx.vb" Inherits="Mobile_TMIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div data-role="page">
        <div data-role="header">
            <h1>TM-影響我生活中的一項發明-最佳講員票選</h1>
        </div>
        <div class="ui-content">
            <div>
                <img src="/Mobile/images/votecaption.png" />
            </div>
            <div>
                1.溫政憲:30票<br />
                2.許澤民:20票<br />
                3.蕭君如:15票<br />
            </div>
            <div>
                <a rel="external" data-ajax="false" href="/mobile/TMList.aspx">我要投票</a>
            </div>
        </div>
        <div data-role="footer">
            <h4>2015 TMC</h4>
        </div>
    </div>
</asp:Content>


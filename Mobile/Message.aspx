<%@ Page Title="" Language="VB" MasterPageFile="~/Mobile/TMMobile.master" AutoEventWireup="false" CodeFile="Message.aspx.vb" Inherits="Mobile_Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         function SaveMessage() {
             var VoteName = '';
             var VoteMessage = '';
             var SpeakerID = '';
             var Week = '';

             VoteName = $("#VoteName").val();
             VoteMessage = $("#VoteMessage").val();
             SpeakerID = $("#hidSpeakerID").val();
             Week = $("#hidWeek").val();

             $.ajax({
                 method: "POST",
                 url: "/Mobile/ashx/VoteMessage.ashx",
                 data: { VoteName: VoteName, VoteMessage: VoteMessage, SpeakerID: SpeakerID, Week: Week }
             })
             .done(function (msg) {
                 alert('成功投票!');
                 window.location.href = '/Mobile/TMIndex.aspx';
             });

         }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div data-role="page">
        <div data-role="header">
            <h1>TM-影響我生活中的一項發明-最佳講員票選</h1>
        </div>
        <div class="ui-content">
            <section>
                <div>
                    <img src="/mobile/Images/1.jpg" />
                </div>
                <div>
                    講員:許澤民
                </div>
                <div class="ui-field-contain">
                    <label for="VoteName">您的姓名</label>
                    <input type="text" name="VoteName" id="VoteName" maxlength="10">
                </div>
                <div class="ui-field-contain">
                    <label for="VoteMessage">鼓勵的話</label>
                    <textarea name="VoteMessage" id="VoteMessage"></textarea>
                </div>
                
                <a class="ui-btn" onclick="SaveMessage()">投票給許澤民</a>
                
                <asp:HiddenField ID="hidSpeakerID" ClientIDMode="Static" runat="server"/>
                <asp:HiddenField ID="hidWeek" ClientIDMode="Static" runat="server"/>

            </section>
        </div>
        <div data-role="footer">
            <h4>2015 TMC</h4>
        </div>
    </div>
</asp:Content>


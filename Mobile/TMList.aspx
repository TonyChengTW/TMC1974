<%@ Page Title="" Language="VB" MasterPageFile="~/Mobile/TMMobile.master" AutoEventWireup="false" CodeFile="TMList.aspx.vb" Inherits="Mobile_TMList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     
    
    <script type="text/javascript">

       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<div id="circle">
        <div></div>
    </div>--%>


    <div data-role="page">
        <div data-role="header">
            <h1>最佳講員票選</h1>
        </div>
        <div class="ui-content">
            <section>
                <div>
                     TM題目:影響我生活中的一項發明
                     <br />
                     投票給您心中的最佳講員,給他們一點鼓勵吧
                </div>
            </section>
            <br />
            <section>
                <div class="data">
                    <img src="/mobile/Images/1.jpg" />
                </div>
               <a rel="external" data-ajax="false" class="ui-btn" href="/Mobile/Message.aspx?Week=3&SpeakerID=1">投票給溫政憲</a>
            </section>
            <br />
            <section>
                <div>
                    <img src="/mobile/Images/king.jpg" />
                </div>
               <a rel="external" data-ajax="false" class="ui-btn" href="/Mobile/Message.aspx?Week=3&SpeakerID=2" data-transition="slide">投票給蕭君如</a>
            </section>
            <br />
            <section>
                <div>
                    <img src="/mobile/Images/king.jpg" />
                </div>
               <a rel="external" data-ajax="false" class="ui-btn" href="/Mobile/Message.aspx?Week=3&SpeakerID=3" data-transition="slide">投票給張智仁</a>
            </section>
            <br />
            <section>
                <div>
                    <img src="/mobile/Images/king.jpg" />
                </div>
               <a rel="external" data-ajax="false" class="ui-btn" href="/Mobile/Message.aspx?Week=3&SpeakerID=4" data-transition="slide">投票給李承迅</a>
            </section>
            <br />
            <section>
                <div>
                    <img src="/mobile/Images/king.jpg" />
                </div>
               <a class="ui-btn" href="/Mobile/Message.aspx?Week=3&SpeakerID=5" data-transition="slide">投票給陳惠琪</a>
            </section>
            <br />
            <section>
                <div>
                    <img src="/mobile/Images/king.jpg" />
                </div>
               <a rel="external" data-ajax="false" class="ui-btn" href="/Mobile/Message.aspx?Week=3&SpeakerID=6" data-transition="slide">投票給郭思廷</a>
            </section>
        </div>
        <div data-role="footer">
            <h4>2015 TMC</h4>
        </div>
    </div>

</asp:Content>


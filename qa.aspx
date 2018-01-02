<%@ Page Title="" Language="VB" MasterPageFile="~/TMC.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHtmlHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSitemap" runat="Server">
    <a href="/index.asp">Home</a>   >    <span>報名Q&A</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page_title">報名Q&amp;A</div>
    <div style="width: 950px;">
        <div class="clear"></div>

        <div class="text">
            <div class="list_QA">
                <div id="vertical_menu">
                    <ol>
                        <li><span>我對健言社有興趣，請問要如何加入呀？</span>
                            <ul class="collapsed">
                                <li>目前您可以採用網路報名，或是直接於週四晚上至現場報名即可。</li>
                            </ul>
                        </li>
                        <li><span>我想參加，但看課程日期已經開始好幾週了，那我可以中途加入嗎？</span>
                            <ul class="collapsed">
                                <li>健言社課程安排採單元設計，所以您不一定要從第一週開始上，隨時
　 哪一週開始加入充電行列都可以哦!!</li>
                            </ul>
                        </li>
                        <li><span>如果是中途加入的話，那繳全期社費會不會很不划算？</span>
                            <ul class="collapsed">
                                <li>新社友加入全期費用為2200元，如果不是由第一週開始參加，則會依照課程週別遞減全期社費，而且繳全期費用之社友在下一期之費用只需要 NT1000元學習口才需要投入時間成本，但費用成本絕對超值喔。</li>
                            </ul>
                        </li>
                        <li><span>我很怕上台說話，請問您們口才訓練上課的方式為何？</span>
                            <ul class="collapsed">
                                <li>健言社口才訓練課程著重於實際上台演練，以三分鐘演講TM訓練為主，而我們會採鼓勵方式讓新社友多多上台練習，並不是以強迫方式。且我們會精心的安排教育訓練課程來幫助社友訓練上台演說的技巧與方法，所以不需有太大壓力的。</li>
                            </ul>
                        </li>
                        <li><span>請問我可以先至現場試聽後，再決定是否要參加嗎？</span>
                            <ul class="collapsed">
                                <li>基本上我們建議新社友加入，繳交全期費用比較划算。但若對課程想先了解試聽，可至現場繳交單堂費用300元參加。</li>
                            </ul>
                        </li>

                        <li><span>我發現課程表內的某些時間剛好無法出席，那請問需要請假嗎？</span>
                            <ul class="collapsed">
                                <li>健言社的課程安排採單元設計，若剛好你有重要事無法參加，不需要特別請假。但我們還是鼓勵每期都到.成長更快哦。</li>
                            </ul>
                        </li>

                        <li><span>請問加入健言社後除了可以學習到訓練口才，還可以學習到什麼嗎？</span>
                            <ul class="collapsed">
                                <li>(1)台北市健言社就像個小型社會，在這裡可以認識來自各行各業的人才菁英，了解不同工作領域的型態，最重要是還可以結交許多志同道合的好朋友。
                                    <br />
                                    (2)台北市健言社是個有組織的社團，社友參加一期後可以擔任社團的幹部，學習領導統御、團隊工作的組織技巧。<br />
                                    (3)在社團的學習，不必怕犯錯、做錯。不會有責罵，只會有鼓勵。只要您肯做中學、學中做，絕對可以讓您獲得實際的成長。</li>
                            </ul>
                        </li>

                        </ul>
          </li>
                    </ol>
                </div>
                <script src="js/QA/qa.js" type="text/javascript"></script>
                <script type="text/javascript">
                    var menu = new slideMenu('vertical_menu');
                    menu.handler = 'onclick';
                    menu.autoexpand = true;
                    menu.currentStyle = 'highlight';
                    menu.init();
                </script>
            </div>
        </div>


    </div>


    <div style="height: 250px"></div>


    <div class="clear"></div>

</asp:Content>


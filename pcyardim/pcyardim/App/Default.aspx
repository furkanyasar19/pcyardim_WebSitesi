<%@ Page Title="" Language="C#" MasterPageFile="~/App/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pcyardim.App.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Css/stiller.css" rel="stylesheet" />

    <%--ARAMA--%>
    <script>
        $(document).ready(function () {
            $("#Arama1").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myList1 li").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#Arama2").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myList2 li").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <%--END ARAMA--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 dikeyHR">
                <h3 class="basliklar">Donanım
            <asp:LinkButton ID="lnkDonanimAc" PostBackUrl="~/App/KonuEkle.aspx" CssClass="konuAc" runat="server">Konu Aç</asp:LinkButton>
                </h3>
                <br />
                <input class="form-control inputAyar" id="Arama1" type="text" placeholder="Ne Aramıştınız,Yardımcı Olalım...">
                <div class="donanimYazilimDivi">
                    <asp:DataList ID="dataListDonanim" runat="server" Width="100%">
                        <ItemTemplate>
                            <ul class="list-group" id="myList1">
                                <li class="list-group-item">
                                    <hr />
                                    <div class="icerik">
                                        <div class="msjiconAyar">
                                            <span class="glyphicon glyphicon-comment "></span>
                                        </div>
                                        <div class="baslikDivi">
                                            <asp:LinkButton ID="lnkKonuBaslik" title='<%#Eval("KonuIcerik").ToString().Length<85?Eval("KonuIcerik"):Eval("KonuIcerik").ToString().Substring(0,85)+" ..." %>' PostBackUrl='<%# string.Format("~/App/DefaultDetay.aspx?konuid={0}", Eval("Konuid")) %>' runat="server" CssClass="konuBaslik"><%#Eval("KonuBaslik").ToString().Length<30?Eval("KonuBaslik"):Eval("KonuBaslik").ToString().Substring(0,30)+" ..." %></asp:LinkButton><br />
                                            <asp:Label ID="lblKAd" runat="server" CssClass="kAd" Text='<%# Eval("kAdi") %>'></asp:Label><br />
                                        </div>
                                        <div class="tarih">
                                            <asp:Label ID="lblTarih" runat="server" Text='<%# Eval("Tarih","{0:d}") %>'></asp:Label>
                                            <span class="glyphicon glyphicon-pushpin raptiyeAyar"></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="col-md-6">
                <h3 class="basliklar">Yazılım
            <asp:LinkButton ID="lnkYazilimAc" CssClass="konuAc" PostBackUrl="~/App/KonuEkle.aspx" runat="server">Konu Aç</asp:LinkButton>
                </h3>
                <br />
                <input class="form-control inputAyar" id="Arama2" type="text" placeholder="Ne Aramıştınız,Yardımcı Olalım...">
                <div class="donanimYazilimDivi">
                    <asp:DataList ID="dataListYazilim" runat="server" Width="100%">
                        <ItemTemplate>
                            <ul class="list-group" id="myList2">
                                <li class="list-group-item">
                                    <hr />
                                    <div class="icerik">
                                        <div class="msjiconAyar">
                                            <span class="glyphicon glyphicon-comment "></span>
                                        </div>
                                        <div class="baslikDivi">
                                            <asp:LinkButton ID="lnkKonuBaslik2" title='<%#Eval("KonuIcerik").ToString().Length<85?Eval("KonuIcerik"):Eval("KonuIcerik").ToString().Substring(0,85)+" ..." %>' PostBackUrl='<%# string.Format("~/App/DefaultDetay.aspx?konuid={0}", Eval("Konuid")) %>' runat="server" CssClass="konuBaslik"><%#Eval("KonuBaslik").ToString().Length<30?Eval("KonuBaslik"):Eval("KonuBaslik").ToString().Substring(0,30)+" ..." %></asp:LinkButton><br />
                                            <asp:Label ID="lblKAd2" runat="server" CssClass="kAd" Text='<%# Eval("kAdi") %>'></asp:Label><br />
                                        </div>
                                        <div class="tarih">
                                            <asp:Label ID="lblTarih2" runat="server" Text='<%# Eval("Tarih","{0:d}") %>'></asp:Label>
                                            <span class="glyphicon glyphicon-pushpin raptiyeAyar"></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <h4 class="title">Hakkımızda</h4>
                    <p>Ben bu siteyi performans ödevi olduğu için yaptım. Furkan Yaşar 11C Bilişim</p>
                </div>
                <div class="col-sm-4">
                    <h4 class="title">İletişim</h4>
                    <p>
                        Yer: Ataşehir Rotary ÇPAL<br />
                        Tel: +90(595 654 05 46)
                    </p>
                </div>
                <div class="col-sm-4">
                    <h4 class="title">Kategori</h4>
                    <div class="category">
                        <a href="#">pc</a>
                        <a href="#">yardım</a>
                        <a href="#">donanım</a>
                        <a href="#">yazılım</a>
                        <a href="#">oyun</a>
                        <a href="#">soru</a>
                        <a href="#">bilişim</a>
                        <a href="#">teknolojileri</a>
                        <a href="#">teknik</a>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="row text-center"><a href="#" style="color: #fff; text-decoration: none">Copyright ©pcyardim 2018 Tüm Hakları Saklıdır.</a></div>
        </div>
    </footer>
</asp:Content>

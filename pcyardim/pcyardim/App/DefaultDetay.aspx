<%@ Page Title="" Language="C#" MasterPageFile="~/App/MasterPage.Master" AutoEventWireup="true" CodeBehind="DefaultDetay.aspx.cs" Inherits="pcyardim.App.DefaultDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Css/stiller.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <asp:DataList ID="dataListKonuTarih" runat="server" Width="100%">
                <%--İcon hata verdiği için datalist içinde--%>
                <ItemTemplate>
                    <div>
                        <asp:Label ID="lblKAd" runat="server" CssClass="konuBaslik2 labelTarih" Text='<%# Eval("kAdi") %>'>
                        </asp:Label>
                        <asp:Label ID="lblTarihZaman" runat="server" CssClass="konuBaslik2 labelTarih" Text="">
                            <span class="glyphicon glyphicon-time"></span>
                            <%# Eval("Tarih") %>
                        </asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <br />
            <%--Başlık Divi--%>
            <div class="disdivYorum" style="margin-bottom: 50px !important">
                <div class="row">
                    <asp:Label ID="lblKonuBaslik" CssClass="konuBaslikAyar" Style="display: inline-block" runat="server" Text=""></asp:Label>
                    <asp:LinkButton ID="lnkYorumEkle" OnClick="lnkYorumEkle_Click" CssClass="yorumEkle" runat="server">Yorum Ekle</asp:LinkButton>
                    <br />
                    <br />
                    <asp:Label ID="lblKonuIcerik" runat="server" Style="padding-bottom: 40px !important; display: inline-block !important" Text=""></asp:Label>
                </div>
            </div>
            <%--END Başlık Divi--%>

            <%--DATALİST İÇİNE AL--%>
            <asp:DataList ID="dataListKonuYorum" runat="server" Width="100%">
                <ItemTemplate>
                    <hr style="background-color: #444 !important; height: 1px" />
                    <div>
                        <asp:Label ID="lblYorumKAd" runat="server" CssClass="konuBaslik2 labelTarih" Text='<%# Eval("kAdi") %>'></asp:Label>
                        <asp:Label ID="lblYorumTarihZaman" runat="server" CssClass="konuBaslik2 labelTarih" Text="">
                <span class="glyphicon glyphicon-time"></span>
                <%# Eval("Tarih") %>
                <%--Eval İle Tarihi Çek--%>
                        </asp:Label>
                    </div>
                    <br />
                    <div class="disdivYorum" style="margin-bottom: 50px !important">
                        <div class="row">
                            <asp:Label ID="lblYorum" runat="server" Style="padding-bottom: 40px !important; display: inline-block !important" Text='<%# Eval("Yorum") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <%--END-- DATALİST İÇİNE AL--%>
        </div>
    </div>
</asp:Content>

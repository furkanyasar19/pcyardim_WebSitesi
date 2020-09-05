<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="KonuEkle.aspx.cs" Inherits="pcyardim.App.DonanimKonuEkle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>pcyardim</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="Css/stiller.css" rel="stylesheet" />
</head>
<body>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="beyazyer">
                    <div class="col-sm-12">
                        <label style="padding-top: 20px;">Konu Başlığı: </label>
                        <br />
                        <asp:TextBox ID="txtKonu" CssClass=" form-control textboxlar" autofocus runat="server"></asp:TextBox>
                        <hr />
                    </div>
                    <div class="col-sm-12">
                        <label style="padding-top: 20px;">Konu Kategorisi: </label>
                        <br />
                        <asp:DropDownList ID="drpKategori" Width="20%" Height="40px" style="font-size:16px" runat="server">
                        </asp:DropDownList>
                        <hr />
                    </div>
                    <div class="col-sm-12">
                        <label>İçerik: </label>
                        <textarea name="txtYorum" id="txtYorum" runat="server"></textarea>
                        <script>
                            CKEDITOR.replace('txtYorum');
                        </script>
                        <hr />
                    </div>
                    <div class="col-sm-12">
                        <button id="btnGeriDon" runat="server" onserverclick="btnGeriDon_ServerClick" class="btn btn-default uyeOlbtn" style="width:50px !important" data-toggle="tooltip" data-placement="top" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label>
                        <div class="pull-right">
                            <asp:Button ID="btnTemizle" OnClick="btnTemizle_Click" CssClass="btn btn-default uyeOlbtn" runat="server" Text="Temizle" />
                            <asp:Button ID="btnGonder" OnClick="btnGonder_Click" runat="server" Text="Gönder" CssClass="btn btn-default uyeOlbtn" />
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

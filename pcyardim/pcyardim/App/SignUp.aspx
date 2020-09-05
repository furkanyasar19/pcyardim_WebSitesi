<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="pcyardim.App.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>pcyardim</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="Css/stiller.css" rel="stylesheet" />
    <link href="Css/animate.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid arkaPlan img-responsive">
            <div class="row">
                <div class="col-md-6 col-md-push-3">
                    <div id="login-box" class="animated fadeInDown">
                        <h3 class="text-center">Üye Ol</h3>
                        <br />
                        <div class="form-group">
                            <asp:TextBox ID="txtKAd" CssClass="textboxlar form-control" autofocus placeholder="Kullanıcı Adı:" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtMail" CssClass="textboxlar form-control" placeholder="Mail:" type="email" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtParola" CssClass="textboxlar form-control" placeholder="Parola:" type="password" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtParolaTekrar" CssClass="textboxlar form-control" placeholder="Parola Tekrar:" type="password" runat="server"></asp:TextBox>
                        </div>
                        <button id="btnGeriDon" runat="server" onserverclick="btnGeriDon_ServerClick" class="uyeOlbtn" style="width:50px !important" data-toggle="tooltip" data-placement="bottom" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                        <asp:Button ID="btnUyeOl" CssClass="uyeOlbtn" runat="server" Text="Üye Ol" OnClick="btnUyeOl_Click" /><br /><br />
                        <asp:Label ID="lblSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>    
    </form>
</body>
</html>

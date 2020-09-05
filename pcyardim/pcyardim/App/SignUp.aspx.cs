using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using pcyardim.App_Code;

namespace pcyardim.App
{
    public partial class SignUp : System.Web.UI.Page
    {
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUyeOl_Click(object sender, EventArgs e)
        {
            if (txtKAd.Text == "" || txtMail.Text == "" || txtParola.Text == "" || txtParolaTekrar.Text == "")
            {
                lblSonuc.Text = "Lütfen tüm alanları doldurunuz.";
            }
            else if (txtKAd.Text.Length < 4 || txtKAd.Text.Length > 16)
            {
                lblSonuc.Text = "Kullanıcı adnınız en az 4, en fazla 16  karekterden oluşmalıdır.";
            }
            else if (txtParola.Text.Length < 4)
            {
                lblSonuc.Text = "Parolanız en az 4 karekterden oluşmalıdır.";
            }
            else if (txtParola.Text != txtParolaTekrar.Text)
            {
                lblSonuc.Text = "Parolanız eşleşmiyor.";
            }
            else
            {
                kullanicilar.kAdi = txtKAd.Text;
                kullanicilar.mail = txtMail.Text;
                bool kAdiVarmi = kullanicilar.KAdiVarmi();
                bool MailVarmi = kullanicilar.MailVarmi();
                if (kAdiVarmi)
                {
                    lblSonuc.Text = string.Format("Girmiş olduğunuz Kullanıcı Adı başka kullanıcıya aittir.");
                }
                else if (MailVarmi)
                {
                    lblSonuc.Text = string.Format("Girmiş olduğunuz mail başka kullanıcıya aittir.");
                }
                else
                {
                    kullanicilar.kAdi = txtKAd.Text;
                    kullanicilar.mail = txtMail.Text;
                    kullanicilar.parola = txtParola.Text;
                    bool eklendimi = kullanicilar.KullaniciEkle();
                    if (eklendimi)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        lblSonuc.Text = "Kayıt eklenirken bir hata oluştu.Lütfen tekrar deneyin.";
                    }
                }
            }
        }

        protected void btnGeriDon_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
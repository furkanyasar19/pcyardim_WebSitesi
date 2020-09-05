using pcyardim.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pcyardim.App
{
    public partial class DonanimYorumEkle : System.Web.UI.Page
    {
        Konular konular = new Konular();
        Yorumlar yorumlar = new Yorumlar();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            konular.konuid = Convert.ToInt32(Request.QueryString["konuid"]);
            lblKonuBaslik.Text = konular.KonuBaslikGetir();
        }

        protected void btnGeriDon_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnTemizle_Click(object sender, EventArgs e)
        {
            txtYorum.InnerText = "";
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            yorumlar.konuid = konular.konuid;
            HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
            kullanicilar.kAdi = cerezOku["kAd"];
            yorumlar.kisiid = kullanicilar.KullaniciidDonder();
            yorumlar.yorum = txtYorum.InnerText;
            if (txtYorum.InnerText=="")
            {
                lblSonuc.Text = "Alanı Doldurunuz";
            }
            else
            {
                bool eklendimi = yorumlar.YorumEkle();
                if (eklendimi)
                {
                    lblSonuc.Text = "Yorumunuz Başarıyla Eklenmiştir. Geri Dönebilirsiniz.";
                }
                else
                {
                    lblSonuc.Text = "Yorum Eklenemedi. Lütfen Tekrar Deneyin.";
                }
            }
        }
    }
}
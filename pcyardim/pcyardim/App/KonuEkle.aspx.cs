using pcyardim.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pcyardim.App
{
    public partial class DonanimKonuEkle : System.Web.UI.Page
    {
        Konular konular = new Konular();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            var kategoriler = konular.KategorileriGetir();
            if (!IsPostBack)
            {
                foreach (var item in kategoriler)
                {
                    drpKategori.Items.Add(item.kategori);
                } 
            }
        }

        protected void btnGeriDon_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnTemizle_Click(object sender, EventArgs e)
        {
            txtKonu.Text = "";
            txtYorum.InnerText = "";
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            konular.konuBaslik = txtKonu.Text;
            konular.konuIcerik = txtYorum.InnerText;
            HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
            kullanicilar.kAdi = cerezOku["kAd"];
            konular.kisiid = kullanicilar.KullaniciidDonder();
            konular.kategoriid = konular.Kategoriidgetir(drpKategori.SelectedValue);
            if (txtKonu.Text == "" || txtYorum.InnerText == "")
            {
                lblSonuc.Text = "Lütfen Alanları Doldurunuz";
            }
            else
            {
                bool eklendimi = konular.KonuEkle();
                if (eklendimi)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblSonuc.Text = "Konu Eklenemedi. Lütfen Tekrar Deneyin.";
                }
            }
        }
    }
}
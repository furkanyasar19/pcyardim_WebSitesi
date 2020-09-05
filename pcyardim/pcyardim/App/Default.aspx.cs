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
    public partial class Default : System.Web.UI.Page
    {
        Konular konular = new Konular();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["cerezDosyam"] == null)
            {
                lnkDonanimAc.Visible = false;
                lnkYazilimAc.Visible = false;
            }
            dataListDonanim.DataSource = konular.DonanimKonuGetir();
            dataListDonanim.DataBind();
            dataListYazilim.DataSource = konular.YazilimKonuGetir();
            dataListYazilim.DataBind();
        }
    }
}
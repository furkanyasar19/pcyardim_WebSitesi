using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using pcyardim.App_Code;

namespace pcyardim.App
{
    public class Konular
    {
        public int konuid,kisiid,kategoriid;
        public string konuBaslik, konuIcerik;
        List<Veriler> list;
        string sorgu;
        SqlCommand cmd;
        Veriler veriler = new Veriler();
        public List<Veriler> DonanimKonuGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select Konuid,KonuBaslik,KonuIcerik,tblKonular.Tarih,KullaniciAdi from tblKonular inner join tblKisiler on tblKisiler.Kisiid=tblKonular.Kisiid where tblKonular.Kategoriid=1 order by Tarih desc");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.konuid = Convert.ToInt32(okunan["Konuid"]);
                veriler.konuBaslik = okunan["KonuBaslik"].ToString();
                veriler.konuIcerik = okunan["KonuIcerik"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.kAdi = okunan["KullaniciAdi"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> YazilimKonuGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select Konuid,KonuBaslik,KonuIcerik,tblKonular.Tarih,KullaniciAdi from tblKonular inner join tblKisiler on tblKisiler.Kisiid=tblKonular.Kisiid where tblKonular.Kategoriid=2 order by Tarih desc");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.konuid = Convert.ToInt32(okunan["Konuid"]);
                veriler.konuBaslik = okunan["KonuBaslik"].ToString();
                veriler.konuIcerik = okunan["KonuIcerik"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.kAdi = okunan["KullaniciAdi"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> KonuDetay()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblKisiler.Kisiid,tblKisiler.KullaniciAdi,tblKonular.Tarih,tblKonular.KonuBaslik,tblKonular.Konuid,tblKonular.KonuIcerik from tblKisiler inner join tblKonular on tblKonular.Kisiid=tblKisiler.Kisiid where Konuid={0}", konuid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.konuid = Convert.ToInt32(okunan["Konuid"]);
                veriler.konuBaslik = okunan["KonuBaslik"].ToString();
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.kAdi = okunan["KullaniciAdi"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.konuIcerik = okunan["KonuIcerik"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public List<Veriler> KategorileriGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select Kategori from tblKategoriler");
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.kategori = okunan["Kategori"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public int Kategoriidgetir(string kategori)
        {
            sorgu = string.Format("Select Kategoriid from tblKategoriler where Kategori='{0}'", kategori);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int kategoriid = Convert.ToInt32(cmd.ExecuteScalar());
            return kategoriid;
        }
        public bool KonuEkle()
        {
            bool etkilendimi = false;
            sorgu = string.Format("insert into tblKonular (KonuBaslik,KonuIcerik,Kisiid,Kategoriid) values (@konuBaslik,@konuIcerik,@kisiid,@kategoriid)");
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            cmd.Parameters.AddWithValue("@konuBaslik", konuBaslik);
            cmd.Parameters.AddWithValue("@konuIcerik", konuIcerik);
            cmd.Parameters.AddWithValue("@kisiid", kisiid);
            cmd.Parameters.AddWithValue("@kategoriid", kategoriid);
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                etkilendimi = true;
            }
            Kullanicilar.Baglan().Close();
            return etkilendimi;
        }
        public string KonuBaslikGetir()
        {
            sorgu = string.Format("select KonuBaslik from tblKonular where Konuid={0}", konuid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            string gundembaslik = cmd.ExecuteScalar().ToString();
            Kullanicilar.Baglan().Close();
            return gundembaslik;
        }
    }
}
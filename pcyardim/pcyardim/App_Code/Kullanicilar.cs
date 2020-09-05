using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace pcyardim.App_Code
{
    public class Kullanicilar
    {
        public string sorgu, mail, kAdi, parola;
        int etkilenen;
        SqlCommand cmd;
        SqlDataReader oku;
        public static SqlConnection Baglan()
        {
            string kaynak = System.Configuration.ConfigurationManager.ConnectionStrings["baglantim"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(kaynak);
            SqlConnection.ClearAllPools();
            SqlConnection.ClearPool(baglanti);
            baglanti.Open();
            return baglanti;
        }
        public bool KAdiVarmi()
        {
            bool varmi = false;
            sorgu = string.Format("Select * from tblKisiler where KullaniciAdi='{0}'", kAdi);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public bool MailVarmi()
        {
            bool varmi = false;
            sorgu = string.Format("Select * from tblKisiler where Mail='{0}'", mail);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public bool KullaniciEkle()
        {
            bool eklendimi = false;
            sorgu = string.Format("Insert into tblKisiler (KullaniciAdi,Mail,Parola) values (@kAdi,@mail,@parola)");
            cmd = new SqlCommand(sorgu, Baglan());
            cmd.Parameters.AddWithValue("@kAdi", kAdi);
            cmd.Parameters.AddWithValue("@mail", mail);
            cmd.Parameters.AddWithValue("@parola", parola);
            etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                eklendimi = true;
            }
            Baglan().Close();
            return eklendimi;
        }
        public bool UyeGirisKontrol()
        {
            bool varmi = false;
            sorgu = string.Format("select * from tblKisiler where KullaniciAdi='{0}' and Parola='{1}'", mail, parola);
            cmd = new SqlCommand(sorgu, Baglan());
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                varmi = true;
            }
            Baglan().Close();
            return varmi;
        }
        public string KullaniciAdiDonder()
        {
            sorgu = string.Format("Select KullaniciAdi from tblKisiler where KullaniciAdi ='{0}' ", kAdi);
            cmd = new SqlCommand(sorgu, Baglan());
            string ad = Convert.ToString(cmd.ExecuteScalar());
            Baglan().Close();
            return ad;
        }
        public int KullaniciidDonder()
        {
            sorgu = string.Format("Select Kisiid from tblKisiler where KullaniciAdi ='{0}' ", kAdi);
            cmd = new SqlCommand(sorgu, Baglan());
            int kisiid = Convert.ToInt32(cmd.ExecuteScalar());
            Baglan().Close();
            return kisiid;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using pcyardim.App_Code;

namespace pcyardim.App
{
    public class Yorumlar
    {
        public int konuid,kisiid;
        public string yorum;
        List<Veriler> list;
        string sorgu;
        SqlCommand cmd;
        Veriler veriler = new Veriler();
        public List<Veriler> KonuYorumBilgiGetir()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblYorumlar.Yorum,tblYorumlar.Tarih,tblKisiler.Kisiid,tblKisiler.KullaniciAdi from tblYorumlar inner join tblKisiler on tblKisiler.Kisiid=tblYorumlar.Kisiid where Konuid={0}", konuid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.yorum = okunan["Yorum"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.kAdi = okunan["KullaniciAdi"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        public bool YorumEkle()
        {
            bool etkilendimi = false;
            sorgu = string.Format("insert into tblYorumlar (Yorum,Kisiid,Konuid) values (@yorum,@kisiid,@gundemid)");
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            cmd.Parameters.AddWithValue("@yorum", yorum);
            cmd.Parameters.AddWithValue("@kisiid", kisiid);
            cmd.Parameters.AddWithValue("@gundemid", konuid);
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                etkilendimi = true;
            }
            Kullanicilar.Baglan().Close();
            return etkilendimi;
        }
    }
}
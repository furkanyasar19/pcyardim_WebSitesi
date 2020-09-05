using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using pcyardim.App_Code;

namespace pcyardim.App
{
    public class Veriler
    {
        public int konuid { get; set; }
        public string konuBaslik { get; set; }
        public string kategori { get; set; }
        public string kAdi { get; set; }
        public int kisiid { get; set; }
        public DateTime tarih { get; set; }
        public string konuIcerik { get; set; }
        public string yorum { get; set; }
        public string mail { get; set; }
        public SqlDataReader VeriOku(string sorgu)
        {
            SqlCommand cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            return cmd.ExecuteReader();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FirstProject
{
    public partial class Deneme : System.Web.UI.Page
    {
        SqlConnection baglanti = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            string conString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            baglanti = new SqlConnection(conString);
           
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {

            
            string kadi = txt_username.Text;
            string sifre = txt_password.Text;

            if (kadi !=null && sifre != null && kadi !="" && sifre !="")
            {
                baglanti.Open();
                string strSelect = "Select * From login where kullaniciAdi = @kadi and sifre=@sifre";
                SqlCommand cmd = new SqlCommand(strSelect, baglanti);
                cmd.Parameters.AddWithValue("@kadi", kadi);
                cmd.Parameters.AddWithValue("@sifre", sifre);
                int records = (int)cmd.ExecuteScalar();
                if (records == 1)
                {
                    Session.Add("kadi", kadi);
                    Session.Add("sifre", sifre);
                    Session.Timeout = 1;
                    Response.Redirect("tablo.aspx");

                }
                  
                baglanti.Close();
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FirstProject
{
    public partial class kayitEkle : System.Web.UI.Page
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        [WebMethod]
        public static string SaveData(string name,string position,string office, string salary)
        {
            string conString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(conString);
           
            string strSelect = "insert into Employee(Name,Position,Office,Salary) values (@name,@position,@office,@salary)";
            SqlCommand cmd = new SqlCommand(strSelect, baglanti);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@position", position);
            cmd.Parameters.AddWithValue("@office", office);
            cmd.Parameters.AddWithValue("@salary", salary);
            baglanti.Open();
            cmd.ExecuteNonQuery();
            baglanti.Close();

            return "submit";
        }

    }
}
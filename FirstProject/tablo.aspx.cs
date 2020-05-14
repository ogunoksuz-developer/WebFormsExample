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
    public partial class tablo : System.Web.UI.Page
    {
        SqlConnection baglanti = null;
     
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string.IsNullOrEmpty(Session["kadi"].ToString());
                string.IsNullOrEmpty(Session["sifre"].ToString());

                if (!string.IsNullOrEmpty(Session["sifre"].ToString()) && !string.IsNullOrEmpty(Session["kadi"].ToString()))
                {
                    string kadi = Session["kadi"].ToString();
                    string sifre = Session["sifre"].ToString();

                    string conString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
                    baglanti = new SqlConnection(conString);

                    GetEmployee();
                }
                else
                {
                    Response.Redirect("Deneme.aspx");
                }
            }
            catch (Exception)
            {

                Response.Write("hata");
            }
            
           
           
        }

        public void GetEmployee()
        {
            string strSelect = "select * from Employee";
            SqlCommand cmd = new SqlCommand(strSelect, baglanti);
            SqlDataReader reader;

            baglanti.Open();
            reader = cmd.ExecuteReader();
            repeater.DataSource = reader;
            repeater.DataBind();
            reader.Close();

        }

        [WebMethod]
        public static string DeleteData(string id)
        {
            string conString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
            SqlConnection baglanti = new SqlConnection(conString);

            string strSelect = "DELETE from Employee where EmployeeID=@EmployeeID";
            SqlCommand cmd = new SqlCommand(strSelect, baglanti);
            cmd.Parameters.AddWithValue("@EmployeeID",id);
            baglanti.Open();
            cmd.ExecuteNonQuery();
            baglanti.Close();

            return "Success";
        }

        [WebMethod]
        public static string EditData(string id, string name, string position, string office, string salary)
        {
        string conString = ConfigurationManager.ConnectionStrings["dbConnection"].ConnectionString;
        SqlConnection baglanti = new SqlConnection(conString);
        string strSelect = "update Employee set Name=@Name,Position=@Position,Office=@Office,Salary=@Salary where EmployeeID=@EmployeeID";
            SqlCommand cmd = new SqlCommand(strSelect, baglanti);
            cmd.Parameters.AddWithValue("@EmployeeID", id);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Position", position);
            cmd.Parameters.AddWithValue("@Office", office);
            cmd.Parameters.AddWithValue("@Salary", salary);
            baglanti.Open();
            cmd.ExecuteNonQuery();
            baglanti.Close();

            return "Success";
        }

       
    }

   
}


    
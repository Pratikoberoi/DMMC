using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMMC
{
	public partial class _Default : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			ListPatients();
			Medication();
			Symptom();
		}
		public void ListPatients()
		{
			string conString = "Data Source=Pratik-Desktop;Initial Catalog=DMMC;Integrated Security=True";


			SqlConnection conn = new SqlConnection(conString);
			SqlDataAdapter da = new SqlDataAdapter();
			SqlCommand cmd = conn.CreateCommand();
			cmd.CommandText = "select * from PatientDetails";
			da.SelectCommand = cmd;
			DataSet ds = new DataSet();

			conn.Open();
			da.Fill(ds);
			GridView1.DataSource = ds;
			GridView1.DataBind();
			conn.Close();
		}

		public void Medication()
		{
			string conString = "Data Source=Pratik-Desktop;Initial Catalog=DMMC;Integrated Security=True";


			SqlConnection conn = new SqlConnection(conString);
			SqlDataAdapter da = new SqlDataAdapter();
			SqlCommand cmd = conn.CreateCommand();
			cmd.CommandText = "select * from MedicationMaster";
			da.SelectCommand = cmd;
			DataSet ds = new DataSet();

			conn.Open();
			da.Fill(ds);
			//ddlMedication.DataSource = ds.Tables[0];
			//ddlMedication.DataTextField = "Medication";
			//ddlMedication.DataValueField = "MedicationID";
			//ddlMedication.DataBind();


			conn.Close();
		}
		public void Symptom()
		{
			string conString = "Data Source=Pratik-Desktop;Initial Catalog=DMMC;Integrated Security=True";


			SqlConnection conn = new SqlConnection(conString);
			SqlDataAdapter da = new SqlDataAdapter();
			SqlCommand cmd = conn.CreateCommand();
			cmd.CommandText = "select * from SymptomMaster ";
			da.SelectCommand = cmd;
			DataSet ds = new DataSet();

			conn.Open();
			da.Fill(ds);
			ddlSymptoms.DataSource = ds.Tables[0];
			ddlSymptoms.DataTextField = "Symptom";
			ddlSymptoms.DataValueField = "SymptomID";
			ddlSymptoms.DataBind();


			conn.Close();
		}
		protected void btnGetSelectedValues_Click(object sender, EventArgs e)
		{
			string selectedValues = string.Empty;
			foreach (ListItem li in ddlSymptoms.Items)
			{
				if (li.Selected == true)
				{
					selectedValues += li.Text + ",";
				}
			}
			Response.Write(selectedValues.ToString());
		}

		[WebMethod]
		public static List<string> SearchCustomers(string prefixText, int count)
		{
			using (SqlConnection conn = new SqlConnection())
			{
				conn.ConnectionString = "Data Source=Pratik-Desktop;Initial Catalog=DMMC;Integrated Security=True";
				using (SqlCommand cmd = new SqlCommand())
				{
					cmd.CommandText = "select Symptom from SymptomMaster where Symptom like '%' + @SearchText + '%'";
					cmd.Parameters.AddWithValue("@SearchText", prefixText);
					cmd.Connection = conn;
					conn.Open();
					List<string> customers = new List<string>();
					using (SqlDataReader sdr = cmd.ExecuteReader())
					{
						while (sdr.Read())
						{
							customers.Add(sdr["Symptom"].ToString());
						}
					}
					conn.Close();

					return customers;
				}
			}
		}
		[WebMethod]
		public static List<string> GetEmployeeName(string empName)
		{
			List<string> empResult = new List<string>();
			using (SqlConnection con = new SqlConnection())
			{
				con.ConnectionString = "Data Source=Pratik-Desktop;Initial Catalog=DMMC;Integrated Security=True";
				using (SqlCommand cmd = new SqlCommand())
				{
					cmd.CommandText = "select Symptom from SymptomMaster where Symptom like '%' + @SearchText + '%'";
					cmd.Connection = con;
					con.Open();
					cmd.Parameters.AddWithValue("@SearchEmpName", empName);
					SqlDataReader dr = cmd.ExecuteReader();
					while (dr.Read())
					{
						empResult.Add(dr["Symptom"].ToString());
					}
					con.Close();
					return empResult;
				}
			}
		}
	}
}
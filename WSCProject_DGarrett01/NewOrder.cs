using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;

namespace WSCPreBuild
{
    public partial class NewOrder : Form
    {
        public NewOrder()
        {
            InitializeComponent();
            fillCustomerCombobox();
            fillPaymentCombobox();
            fillMediaComboBox();
        }

        void fillPaymentCombobox()
        {
            string connectionString = "Data Source=.\\SQLExpress; Database=WSCDatabase; Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(connectionString);
            string query = "select PaymentType from dbo.[PAYMENT_TYPE]";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            // Open connection
            conn.Open();

            // Populate DataTable and Customer comboBox
            DataTable table = new DataTable();
            adapter.Fill(table);
            comboBoxPaymentType.DataSource = table;
            adapter.Dispose();

            // Close connection
            conn.Close();
        }
        
        void fillCustomerCombobox()
        {
            // Database connection parameters
            string connectionString = "Data Source=.\\SQLExpress; Database=WSCDatabase; Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(connectionString);
            string query = "select C_Email from dbo.[CUSTOMER]";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            // Open connection
            conn.Open();

            // Populate DataTable and Customer comboBox
            DataTable table = new DataTable();
            adapter.Fill(table);
            comboBoxCustomer.DataSource = table;
            adapter.Dispose();
            
            // Close connection
            conn.Close();
        }

        void fillMediaComboBox()
        {
            string connectionString = "Data Source=.\\SQLExpress; Database=WSCDatabase; Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(connectionString);
            string query = "select MediaType from dbo.[MEDIA]";
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            // Open connection
            conn.Open();

            // Populate DataTable and Customer comboBox
            DataTable table = new DataTable();
            adapter.Fill(table);
            comboBoxMedia.DataSource = table;
            adapter.Dispose();

            // Close connection
            conn.Close();
        }
        
        private void NewOrder_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'wSCDatabaseDataSet.MEDIA' table. You can move, or remove it, as needed.
            this.mEDIATableAdapter.Fill(this.wSCDatabaseDataSet.MEDIA);
            // TODO: This line of code loads data into the 'wSCDatabaseDataSet.PAYMENT_TYPE' table. You can move, or remove it, as needed.
            this.pAYMENT_TYPETableAdapter.Fill(this.wSCDatabaseDataSet.PAYMENT_TYPE);
                        

        }

        private void customersToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.cUSTOMERTableAdapter.Customers(this.wSCDatabaseDataSet.CUSTOMER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void customersToolStripButton_Click_1(object sender, EventArgs e)
        {
            try
            {
                this.cUSTOMERTableAdapter.Customers(this.wSCDatabaseDataSet.CUSTOMER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void comboBoxCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

                 
    }
}

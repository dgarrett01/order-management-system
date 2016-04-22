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
    public partial class CreateCustomer : Form
    {
        public CreateCustomer()
        {
            InitializeComponent();


        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            // Set up Database connection
            string connectionString = "Data Source=.\\SQLExpress; Database=WSCDatabase; Trusted_Connection=yes";
            SqlConnection conn = new SqlConnection(connectionString);
            string query = "INSERT INTO [dbo].[CUSTOMER] " +
           "( [C_FName]" +
           ", [C_LName]" +
           ", [C_Address]" +
           ", [C_City]" +
           ", [C_State]" +
           ", [C_ZIP]" +
           ", [C_Email]" +
           ", [C_Phone])" +
     "VALUES " +
           "(N'"+ textBoxFirstName.Text + "'" +
           ", N'" + textBoxLastName.Text + "'" +
           ", N'" + textBoxAddress.Text + "'" +
           ", N'" + textBoxCity.Text + "'" +
           ", N'" + maskedTextBoxState.Text + "'" +
           ", N'" + maskedTextBoxZIP.Text + "'" +
           ", N'" + textBoxEmail.Text + "'" +
           ", N'" + maskedTextBoxPhone.Text + "')";

            // Open connection
            conn.Open();

            
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();

            MessageBox.Show("Customer added to database.");

            conn.Close();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            textBoxFirstName.Text = null;
            textBoxLastName.Text = null;
            textBoxAddress.Text = null;
            textBoxCity.Text = null;
            maskedTextBoxState.Text = null;
            maskedTextBoxZIP.Text = null;
            maskedTextBoxPhone.Text = null;
            textBoxEmail.Text = null;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }



    }
}

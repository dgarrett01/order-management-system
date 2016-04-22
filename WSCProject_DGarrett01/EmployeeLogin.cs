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
    public partial class frmEmployeeLogin : Form
    {
        public frmEmployeeLogin()
        {
            InitializeComponent();
            textBoxPassword.UseSystemPasswordChar = true;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            // Set up connection string
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLExpress; Database=WSCDatabase; Trusted_Connection=yes");
            
            // Set up SQL parameters
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader1 = null;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;

            // Open connection
            conn.Open();

            // Get input from textBoxes
            string username = textBoxUsername.Text;
            string password = textBoxPassword.Text;
            
            // Login query
            SqlCommand userName = new SqlCommand();
            userName.Connection = conn;
            userName.CommandText = "SELECT UserName, UserPassword FROM dbo.[USER] WHERE UserName = '" + username + "' AND UserPassword = '" + password + "'";
                        
            // Execute query
            reader1 = userName.ExecuteReader();

            if (reader1.HasRows)
            {
                while (reader1.Read())
	            {

                string userNameQuery = reader1.GetString(0);
                string userPasswordQuery = reader1.GetString(1);
                            
	
                if ((userNameQuery == username) && (userPasswordQuery == password))
                {
                    // Choose which homescreen to show
                    switch (username)
                    {
                        case "salesperson": SalesPersonHome formSalesPerson = new SalesPersonHome();
                            formSalesPerson.Show();
                            break;
                        case "opsmanager": OpsManagerHome formOpsManager = new OpsManagerHome();
                            formOpsManager.Show();
                            break;
                        case "production": ProductionHome formProduction = new ProductionHome();
                            formProduction.Show();
                            break;
                        case "shipping": ShippingHome formShipping = new ShippingHome();
                            formShipping.Show();
                            break;
                        default: MessageBox.Show("Thanks for logging in, unspecified user.");
                            break;
                    }
                }
                else
                {
                    MessageBox.Show("Login failed.");
                }
              } 
            }
            else
            {
                MessageBox.Show("Could not find the user.");
            }
                        
            // Close connection
            conn.Close();

            textBoxUsername.Text = null;
            textBoxPassword.Text = null;
        }

        private void btnQuit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        
    }
}

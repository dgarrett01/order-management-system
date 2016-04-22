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
    public partial class SalesPersonHome : Form
    {
        public SalesPersonHome()
        {
            InitializeComponent();

            // Set up connection string
            SqlConnection conn = new SqlConnection("Data Source=.\\SQLExpress; Database=WSCDatabase; Trusted_Connection=yes;");

            // Set up SQL parameters
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader = null;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;

            // Open connection
            conn.Open();

            // TODO
            cmd.CommandText = "SELECT OrderID,  FROM dbo.[ORDER] WHERE ";

            // Close database connection
            conn.Close();
        }

        private void btnNewOrder_Click(object sender, EventArgs e)
        {
            NewOrder newOrderForm = new NewOrder();
            newOrderForm.Show();
        }

        private void btnCreateCustomer_Click(object sender, EventArgs e)
        {
            CreateCustomer newCustomerForm = new CreateCustomer();
            newCustomerForm.Show();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void SalesPersonHome_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'wSCDatabaseDataSet.ORDER' table. You can move, or remove it, as needed.
            this.oRDERTableAdapter.Fill(this.wSCDatabaseDataSet.ORDER);
            // TODO: This line of code loads data into the 'wSCDatabaseDataSet.ORDER' table. You can move, or remove it, as needed.
            this.oRDERTableAdapter.Fill(this.wSCDatabaseDataSet.ORDER);
            // TODO: This line of code loads data into the 'wSCDatabaseDataSet.ORDER' table. You can move, or remove it, as needed.
            this.oRDERTableAdapter.Fill(this.wSCDatabaseDataSet.ORDER);

        }

        private void rejectedOrdersToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void rejectedOrders1ToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders1(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void rejectedOrdersToolStripButton_Click_1(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void rejectedOrders2ToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders2(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void rejectedOrders3ToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders3(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void rejectedOrders1ToolStripButton_Click_1(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders1(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders1(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }

        private void listBoxDelivered_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void lblDelivered_Click(object sender, EventArgs e)
        {

        }

        private void deliveredOrdersToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.DeliveredOrders(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.DeliveredOrders(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }

        private void rejectedOrders4ToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders4(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void btnRefreshRejected_Click(object sender, EventArgs e)
        {
            try
            {
                this.oRDERTableAdapter.RejectedOrders4(this.wSCDatabaseDataSet.ORDER);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }
    }
}

namespace WSCPreBuild
{
    partial class SalesPersonHome
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnNewOrder = new System.Windows.Forms.Button();
            this.btnCreateCustomer = new System.Windows.Forms.Button();
            this.lblRejected = new System.Windows.Forms.Label();
            this.btnExit = new System.Windows.Forms.Button();
            this.lblDelivered = new System.Windows.Forms.Label();
            this.listBoxRejectedOrders = new System.Windows.Forms.ListBox();
            this.oRDERBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.wSCDatabaseDataSet = new WSCPreBuild.WSCDatabaseDataSet();
            this.oRDERBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.listBoxDeliveredOrders = new System.Windows.Forms.ListBox();
            this.oRDERTableAdapter = new WSCPreBuild.WSCDatabaseDataSetTableAdapters.ORDERTableAdapter();
            this.rejectedOrders4ToolStrip = new System.Windows.Forms.ToolStrip();
            this.rejectedOrders4ToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.btnRefreshRejected = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.oRDERBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.wSCDatabaseDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.oRDERBindingSource)).BeginInit();
            this.rejectedOrders4ToolStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnNewOrder
            // 
            this.btnNewOrder.Location = new System.Drawing.Point(106, 524);
            this.btnNewOrder.Name = "btnNewOrder";
            this.btnNewOrder.Size = new System.Drawing.Size(113, 23);
            this.btnNewOrder.TabIndex = 0;
            this.btnNewOrder.Text = "New Order";
            this.btnNewOrder.UseVisualStyleBackColor = true;
            this.btnNewOrder.Click += new System.EventHandler(this.btnNewOrder_Click);
            // 
            // btnCreateCustomer
            // 
            this.btnCreateCustomer.Location = new System.Drawing.Point(106, 495);
            this.btnCreateCustomer.Name = "btnCreateCustomer";
            this.btnCreateCustomer.Size = new System.Drawing.Size(113, 23);
            this.btnCreateCustomer.TabIndex = 1;
            this.btnCreateCustomer.Text = "Create Customer";
            this.btnCreateCustomer.UseVisualStyleBackColor = true;
            this.btnCreateCustomer.Click += new System.EventHandler(this.btnCreateCustomer_Click);
            // 
            // lblRejected
            // 
            this.lblRejected.AutoSize = true;
            this.lblRejected.Location = new System.Drawing.Point(7, 37);
            this.lblRejected.Name = "lblRejected";
            this.lblRejected.Size = new System.Drawing.Size(84, 13);
            this.lblRejected.TabIndex = 3;
            this.lblRejected.Text = "Rejected Orders";
            // 
            // btnExit
            // 
            this.btnExit.Location = new System.Drawing.Point(256, 495);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(75, 23);
            this.btnExit.TabIndex = 4;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // lblDelivered
            // 
            this.lblDelivered.AutoSize = true;
            this.lblDelivered.Location = new System.Drawing.Point(17, 296);
            this.lblDelivered.Name = "lblDelivered";
            this.lblDelivered.Size = new System.Drawing.Size(86, 13);
            this.lblDelivered.TabIndex = 5;
            this.lblDelivered.Text = "Delivered Orders";
            this.lblDelivered.Click += new System.EventHandler(this.lblDelivered_Click);
            // 
            // listBoxRejectedOrders
            // 
            this.listBoxRejectedOrders.DataSource = this.oRDERBindingSource1;
            this.listBoxRejectedOrders.DisplayMember = "OrderID";
            this.listBoxRejectedOrders.FormattingEnabled = true;
            this.listBoxRejectedOrders.Location = new System.Drawing.Point(10, 54);
            this.listBoxRejectedOrders.Name = "listBoxRejectedOrders";
            this.listBoxRejectedOrders.Size = new System.Drawing.Size(228, 173);
            this.listBoxRejectedOrders.TabIndex = 6;
            // 
            // oRDERBindingSource1
            // 
            this.oRDERBindingSource1.DataMember = "ORDER";
            this.oRDERBindingSource1.DataSource = this.wSCDatabaseDataSet;
            // 
            // wSCDatabaseDataSet
            // 
            this.wSCDatabaseDataSet.DataSetName = "WSCDatabaseDataSet";
            this.wSCDatabaseDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // oRDERBindingSource
            // 
            this.oRDERBindingSource.DataMember = "ORDER";
            this.oRDERBindingSource.DataSource = this.wSCDatabaseDataSet;
            // 
            // listBoxDeliveredOrders
            // 
            this.listBoxDeliveredOrders.FormattingEnabled = true;
            this.listBoxDeliveredOrders.Location = new System.Drawing.Point(13, 313);
            this.listBoxDeliveredOrders.Name = "listBoxDeliveredOrders";
            this.listBoxDeliveredOrders.Size = new System.Drawing.Size(225, 147);
            this.listBoxDeliveredOrders.TabIndex = 7;
            // 
            // oRDERTableAdapter
            // 
            this.oRDERTableAdapter.ClearBeforeFill = true;
            // 
            // rejectedOrders4ToolStrip
            // 
            this.rejectedOrders4ToolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.rejectedOrders4ToolStripButton});
            this.rejectedOrders4ToolStrip.Location = new System.Drawing.Point(0, 0);
            this.rejectedOrders4ToolStrip.Name = "rejectedOrders4ToolStrip";
            this.rejectedOrders4ToolStrip.Size = new System.Drawing.Size(353, 25);
            this.rejectedOrders4ToolStrip.TabIndex = 8;
            this.rejectedOrders4ToolStrip.Text = "rejectedOrders4ToolStrip";
            // 
            // rejectedOrders4ToolStripButton
            // 
            this.rejectedOrders4ToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.rejectedOrders4ToolStripButton.Name = "rejectedOrders4ToolStripButton";
            this.rejectedOrders4ToolStripButton.Size = new System.Drawing.Size(97, 22);
            this.rejectedOrders4ToolStripButton.Text = "RejectedOrders4";
            this.rejectedOrders4ToolStripButton.Click += new System.EventHandler(this.rejectedOrders4ToolStripButton_Click);
            // 
            // btnRefreshRejected
            // 
            this.btnRefreshRejected.Location = new System.Drawing.Point(245, 125);
            this.btnRefreshRejected.Name = "btnRefreshRejected";
            this.btnRefreshRejected.Size = new System.Drawing.Size(75, 23);
            this.btnRefreshRejected.TabIndex = 9;
            this.btnRefreshRejected.Text = "Refresh";
            this.btnRefreshRejected.UseVisualStyleBackColor = true;
            this.btnRefreshRejected.Click += new System.EventHandler(this.btnRefreshRejected_Click);
            // 
            // SalesPersonHome
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(353, 567);
            this.Controls.Add(this.btnRefreshRejected);
            this.Controls.Add(this.rejectedOrders4ToolStrip);
            this.Controls.Add(this.listBoxDeliveredOrders);
            this.Controls.Add(this.listBoxRejectedOrders);
            this.Controls.Add(this.lblDelivered);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.lblRejected);
            this.Controls.Add(this.btnCreateCustomer);
            this.Controls.Add(this.btnNewOrder);
            this.Name = "SalesPersonHome";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sales";
            this.Load += new System.EventHandler(this.SalesPersonHome_Load);
            ((System.ComponentModel.ISupportInitialize)(this.oRDERBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.wSCDatabaseDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.oRDERBindingSource)).EndInit();
            this.rejectedOrders4ToolStrip.ResumeLayout(false);
            this.rejectedOrders4ToolStrip.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnNewOrder;
        private System.Windows.Forms.Button btnCreateCustomer;
        private System.Windows.Forms.Label lblRejected;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Label lblDelivered;
        private System.Windows.Forms.ListBox listBoxRejectedOrders;
        private System.Windows.Forms.ListBox listBoxDeliveredOrders;
        private WSCDatabaseDataSet wSCDatabaseDataSet;
        private System.Windows.Forms.BindingSource oRDERBindingSource;
        private WSCDatabaseDataSetTableAdapters.ORDERTableAdapter oRDERTableAdapter;
        private System.Windows.Forms.BindingSource oRDERBindingSource1;
        private System.Windows.Forms.ToolStrip rejectedOrders4ToolStrip;
        private System.Windows.Forms.ToolStripButton rejectedOrders4ToolStripButton;
        private System.Windows.Forms.Button btnRefreshRejected;
    }
}
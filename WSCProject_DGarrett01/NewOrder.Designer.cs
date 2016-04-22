namespace WSCPreBuild
{
    partial class NewOrder
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
            this.comboBoxPaymentType = new System.Windows.Forms.ComboBox();
            this.pAYMENTTYPEBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.wSCDatabaseDataSet = new WSCPreBuild.WSCDatabaseDataSet();
            this.lblPaymentType = new System.Windows.Forms.Label();
            this.lblCustomer = new System.Windows.Forms.Label();
            this.wSCDatabaseDataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cUSTOMERBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cUSTOMERTableAdapter = new WSCPreBuild.WSCDatabaseDataSetTableAdapters.CUSTOMERTableAdapter();
            this.cUSTOMERBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.comboBoxCustomer = new System.Windows.Forms.ComboBox();
            this.cUSTOMERBindingSource2 = new System.Windows.Forms.BindingSource(this.components);
            this.pAYMENT_TYPETableAdapter = new WSCPreBuild.WSCDatabaseDataSetTableAdapters.PAYMENT_TYPETableAdapter();
            this.lblContent = new System.Windows.Forms.Label();
            this.textBoxContent = new System.Windows.Forms.TextBox();
            this.lblDepositPaid = new System.Windows.Forms.Label();
            this.maskedTextBoxDepositAmount = new System.Windows.Forms.MaskedTextBox();
            this.lblAmountDue = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.lblDepositRequired = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.lblQuantity = new System.Windows.Forms.Label();
            this.textBoxQuantity = new System.Windows.Forms.TextBox();
            this.lblMedia = new System.Windows.Forms.Label();
            this.comboBoxMedia = new System.Windows.Forms.ComboBox();
            this.mEDIABindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.mEDIATableAdapter = new WSCPreBuild.WSCDatabaseDataSetTableAdapters.MEDIATableAdapter();
            this.lblClosed = new System.Windows.Forms.Label();
            this.checkBoxClosed = new System.Windows.Forms.CheckBox();
            ((System.ComponentModel.ISupportInitialize)(this.pAYMENTTYPEBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.wSCDatabaseDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.wSCDatabaseDataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cUSTOMERBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cUSTOMERBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cUSTOMERBindingSource2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mEDIABindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // comboBoxPaymentType
            // 
            this.comboBoxPaymentType.DataSource = this.pAYMENTTYPEBindingSource;
            this.comboBoxPaymentType.DisplayMember = "PaymentType";
            this.comboBoxPaymentType.FormattingEnabled = true;
            this.comboBoxPaymentType.Location = new System.Drawing.Point(103, 49);
            this.comboBoxPaymentType.Name = "comboBoxPaymentType";
            this.comboBoxPaymentType.Size = new System.Drawing.Size(185, 21);
            this.comboBoxPaymentType.TabIndex = 0;
            // 
            // pAYMENTTYPEBindingSource
            // 
            this.pAYMENTTYPEBindingSource.DataMember = "PAYMENT_TYPE";
            this.pAYMENTTYPEBindingSource.DataSource = this.wSCDatabaseDataSet;
            // 
            // wSCDatabaseDataSet
            // 
            this.wSCDatabaseDataSet.DataSetName = "WSCDatabaseDataSet";
            this.wSCDatabaseDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // lblPaymentType
            // 
            this.lblPaymentType.AutoSize = true;
            this.lblPaymentType.Location = new System.Drawing.Point(15, 56);
            this.lblPaymentType.Name = "lblPaymentType";
            this.lblPaymentType.Size = new System.Drawing.Size(78, 13);
            this.lblPaymentType.TabIndex = 1;
            this.lblPaymentType.Text = "Payment Type:";
            // 
            // lblCustomer
            // 
            this.lblCustomer.AutoSize = true;
            this.lblCustomer.Location = new System.Drawing.Point(39, 24);
            this.lblCustomer.Name = "lblCustomer";
            this.lblCustomer.Size = new System.Drawing.Size(54, 13);
            this.lblCustomer.TabIndex = 2;
            this.lblCustomer.Text = "Customer:";
            // 
            // wSCDatabaseDataSetBindingSource
            // 
            this.wSCDatabaseDataSetBindingSource.DataSource = this.wSCDatabaseDataSet;
            this.wSCDatabaseDataSetBindingSource.Position = 0;
            // 
            // cUSTOMERBindingSource
            // 
            this.cUSTOMERBindingSource.DataMember = "CUSTOMER";
            this.cUSTOMERBindingSource.DataSource = this.wSCDatabaseDataSetBindingSource;
            // 
            // cUSTOMERTableAdapter
            // 
            this.cUSTOMERTableAdapter.ClearBeforeFill = true;
            // 
            // cUSTOMERBindingSource1
            // 
            this.cUSTOMERBindingSource1.DataMember = "CUSTOMER";
            this.cUSTOMERBindingSource1.DataSource = this.wSCDatabaseDataSet;
            // 
            // comboBoxCustomer
            // 
            this.comboBoxCustomer.DataSource = this.cUSTOMERBindingSource2;
            this.comboBoxCustomer.DisplayMember = "C_Email";
            this.comboBoxCustomer.FormattingEnabled = true;
            this.comboBoxCustomer.Location = new System.Drawing.Point(103, 16);
            this.comboBoxCustomer.Name = "comboBoxCustomer";
            this.comboBoxCustomer.Size = new System.Drawing.Size(185, 21);
            this.comboBoxCustomer.TabIndex = 3;
            this.comboBoxCustomer.SelectedIndexChanged += new System.EventHandler(this.comboBoxCustomer_SelectedIndexChanged);
            // 
            // cUSTOMERBindingSource2
            // 
            this.cUSTOMERBindingSource2.DataMember = "CUSTOMER";
            this.cUSTOMERBindingSource2.DataSource = this.wSCDatabaseDataSet;
            // 
            // pAYMENT_TYPETableAdapter
            // 
            this.pAYMENT_TYPETableAdapter.ClearBeforeFill = true;
            // 
            // lblContent
            // 
            this.lblContent.AutoSize = true;
            this.lblContent.Location = new System.Drawing.Point(24, 127);
            this.lblContent.Name = "lblContent";
            this.lblContent.Size = new System.Drawing.Size(150, 13);
            this.lblContent.TabIndex = 4;
            this.lblContent.Text = "Text To Be Printed/Engraved:";
            // 
            // textBoxContent
            // 
            this.textBoxContent.Location = new System.Drawing.Point(27, 143);
            this.textBoxContent.Multiline = true;
            this.textBoxContent.Name = "textBoxContent";
            this.textBoxContent.Size = new System.Drawing.Size(261, 131);
            this.textBoxContent.TabIndex = 5;
            // 
            // lblDepositPaid
            // 
            this.lblDepositPaid.AutoSize = true;
            this.lblDepositPaid.Location = new System.Drawing.Point(20, 356);
            this.lblDepositPaid.Name = "lblDepositPaid";
            this.lblDepositPaid.Size = new System.Drawing.Size(70, 13);
            this.lblDepositPaid.TabIndex = 6;
            this.lblDepositPaid.Text = "Deposit Paid:";
            // 
            // maskedTextBoxDepositAmount
            // 
            this.maskedTextBoxDepositAmount.Location = new System.Drawing.Point(97, 350);
            this.maskedTextBoxDepositAmount.Mask = "$990.00";
            this.maskedTextBoxDepositAmount.Name = "maskedTextBoxDepositAmount";
            this.maskedTextBoxDepositAmount.Size = new System.Drawing.Size(185, 20);
            this.maskedTextBoxDepositAmount.TabIndex = 7;
            // 
            // lblAmountDue
            // 
            this.lblAmountDue.AutoSize = true;
            this.lblAmountDue.Location = new System.Drawing.Point(21, 388);
            this.lblAmountDue.Name = "lblAmountDue";
            this.lblAmountDue.Size = new System.Drawing.Size(69, 13);
            this.lblAmountDue.TabIndex = 8;
            this.lblAmountDue.Text = "Amount Due:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(97, 382);
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.Size = new System.Drawing.Size(185, 20);
            this.textBox1.TabIndex = 9;
            // 
            // lblDepositRequired
            // 
            this.lblDepositRequired.AutoSize = true;
            this.lblDepositRequired.Location = new System.Drawing.Point(-2, 324);
            this.lblDepositRequired.Name = "lblDepositRequired";
            this.lblDepositRequired.Size = new System.Drawing.Size(92, 13);
            this.lblDepositRequired.TabIndex = 10;
            this.lblDepositRequired.Text = "Deposit Required:";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(97, 318);
            this.textBox2.Name = "textBox2";
            this.textBox2.ReadOnly = true;
            this.textBox2.Size = new System.Drawing.Size(185, 20);
            this.textBox2.TabIndex = 11;
            // 
            // lblQuantity
            // 
            this.lblQuantity.AutoSize = true;
            this.lblQuantity.Location = new System.Drawing.Point(44, 280);
            this.lblQuantity.Name = "lblQuantity";
            this.lblQuantity.Size = new System.Drawing.Size(46, 13);
            this.lblQuantity.TabIndex = 12;
            this.lblQuantity.Text = "Quantity";
            // 
            // textBoxQuantity
            // 
            this.textBoxQuantity.Location = new System.Drawing.Point(97, 280);
            this.textBoxQuantity.Name = "textBoxQuantity";
            this.textBoxQuantity.Size = new System.Drawing.Size(185, 20);
            this.textBoxQuantity.TabIndex = 13;
            // 
            // lblMedia
            // 
            this.lblMedia.AutoSize = true;
            this.lblMedia.Location = new System.Drawing.Point(54, 82);
            this.lblMedia.Name = "lblMedia";
            this.lblMedia.Size = new System.Drawing.Size(36, 13);
            this.lblMedia.TabIndex = 14;
            this.lblMedia.Text = "Media";
            // 
            // comboBoxMedia
            // 
            this.comboBoxMedia.DataSource = this.mEDIABindingSource;
            this.comboBoxMedia.DisplayMember = "MediaType";
            this.comboBoxMedia.FormattingEnabled = true;
            this.comboBoxMedia.Location = new System.Drawing.Point(103, 82);
            this.comboBoxMedia.Name = "comboBoxMedia";
            this.comboBoxMedia.Size = new System.Drawing.Size(185, 21);
            this.comboBoxMedia.TabIndex = 15;
            // 
            // mEDIABindingSource
            // 
            this.mEDIABindingSource.DataMember = "MEDIA";
            this.mEDIABindingSource.DataSource = this.wSCDatabaseDataSet;
            // 
            // mEDIATableAdapter
            // 
            this.mEDIATableAdapter.ClearBeforeFill = true;
            // 
            // lblClosed
            // 
            this.lblClosed.AutoSize = true;
            this.lblClosed.Location = new System.Drawing.Point(24, 437);
            this.lblClosed.Name = "lblClosed";
            this.lblClosed.Size = new System.Drawing.Size(71, 13);
            this.lblClosed.TabIndex = 16;
            this.lblClosed.Text = "Order Closed:";
            // 
            // checkBoxClosed
            // 
            this.checkBoxClosed.AutoSize = true;
            this.checkBoxClosed.Location = new System.Drawing.Point(102, 437);
            this.checkBoxClosed.Name = "checkBoxClosed";
            this.checkBoxClosed.Size = new System.Drawing.Size(15, 14);
            this.checkBoxClosed.TabIndex = 17;
            this.checkBoxClosed.UseVisualStyleBackColor = true;
            // 
            // NewOrder
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(330, 530);
            this.Controls.Add(this.checkBoxClosed);
            this.Controls.Add(this.lblClosed);
            this.Controls.Add(this.comboBoxMedia);
            this.Controls.Add(this.lblMedia);
            this.Controls.Add(this.textBoxQuantity);
            this.Controls.Add(this.lblQuantity);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.lblDepositRequired);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.lblAmountDue);
            this.Controls.Add(this.maskedTextBoxDepositAmount);
            this.Controls.Add(this.lblDepositPaid);
            this.Controls.Add(this.textBoxContent);
            this.Controls.Add(this.lblContent);
            this.Controls.Add(this.comboBoxCustomer);
            this.Controls.Add(this.lblCustomer);
            this.Controls.Add(this.lblPaymentType);
            this.Controls.Add(this.comboBoxPaymentType);
            this.Name = "NewOrder";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "New Order";
            this.Load += new System.EventHandler(this.NewOrder_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pAYMENTTYPEBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.wSCDatabaseDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.wSCDatabaseDataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cUSTOMERBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cUSTOMERBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cUSTOMERBindingSource2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mEDIABindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox comboBoxPaymentType;
        private System.Windows.Forms.Label lblPaymentType;
        private System.Windows.Forms.Label lblCustomer;
        private System.Windows.Forms.BindingSource wSCDatabaseDataSetBindingSource;
        private WSCDatabaseDataSet wSCDatabaseDataSet;
        private System.Windows.Forms.BindingSource cUSTOMERBindingSource;
        private WSCDatabaseDataSetTableAdapters.CUSTOMERTableAdapter cUSTOMERTableAdapter;
        private System.Windows.Forms.BindingSource cUSTOMERBindingSource1;
        private System.Windows.Forms.ComboBox comboBoxCustomer;
        private System.Windows.Forms.BindingSource cUSTOMERBindingSource2;
        private System.Windows.Forms.BindingSource pAYMENTTYPEBindingSource;
        private WSCDatabaseDataSetTableAdapters.PAYMENT_TYPETableAdapter pAYMENT_TYPETableAdapter;
        private System.Windows.Forms.Label lblContent;
        private System.Windows.Forms.TextBox textBoxContent;
        private System.Windows.Forms.Label lblDepositPaid;
        private System.Windows.Forms.MaskedTextBox maskedTextBoxDepositAmount;
        private System.Windows.Forms.Label lblAmountDue;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label lblDepositRequired;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label lblQuantity;
        private System.Windows.Forms.TextBox textBoxQuantity;
        private System.Windows.Forms.Label lblMedia;
        private System.Windows.Forms.ComboBox comboBoxMedia;
        private System.Windows.Forms.BindingSource mEDIABindingSource;
        private WSCDatabaseDataSetTableAdapters.MEDIATableAdapter mEDIATableAdapter;
        private System.Windows.Forms.Label lblClosed;
        private System.Windows.Forms.CheckBox checkBoxClosed;
    }
}
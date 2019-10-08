namespace QuanLyQuanKaraoke
{
    partial class Phong
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Phong));
            this.lbPhong = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.lb_TinhTrang = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // lbPhong
            // 
            this.lbPhong.AutoSize = true;
            this.lbPhong.Location = new System.Drawing.Point(93, 14);
            this.lbPhong.Name = "lbPhong";
            this.lbPhong.Size = new System.Drawing.Size(77, 17);
            this.lbPhong.TabIndex = 0;
            this.lbPhong.Text = "Phòng 101";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(96, 61);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(100, 84);
            this.pictureBox1.TabIndex = 1;
            this.pictureBox1.TabStop = false;
            // 
            // lb_TinhTrang
            // 
            this.lb_TinhTrang.AutoSize = true;
            this.lb_TinhTrang.Location = new System.Drawing.Point(68, 178);
            this.lb_TinhTrang.Name = "lb_TinhTrang";
            this.lb_TinhTrang.Size = new System.Drawing.Size(138, 17);
            this.lb_TinhTrang.TabIndex = 2;
            this.lb_TinhTrang.Text = "Sẵn sàng đón khách";
            // 
            // Phong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.lb_TinhTrang);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lbPhong);
            this.Name = "Phong";
            this.Size = new System.Drawing.Size(262, 226);
            this.Load += new System.EventHandler(this.Phong_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbPhong;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lb_TinhTrang;
    }
}

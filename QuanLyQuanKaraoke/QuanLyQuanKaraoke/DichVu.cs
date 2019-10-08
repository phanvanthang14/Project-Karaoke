using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanKaraoke
{
    public partial class DichVu : Form
    {
        public DichVu()
        {
            InitializeComponent();
        }

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void DichVu_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataQuanLy.DichVu' table. You can move, or remove it, as needed.
            this.dichVuTableAdapter.Fill(this.dataQuanLy.DichVu);

        }



    }
}

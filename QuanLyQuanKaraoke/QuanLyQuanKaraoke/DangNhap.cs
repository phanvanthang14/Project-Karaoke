using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Control_DangNhap;
using System.Data.SqlClient;

namespace QuanLyQuanKaraoke
{
    public partial class DangNhap : Form
    {
        public DangNhap()
        {
            InitializeComponent();
        }

        private void DangNhap_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=LAPTOP-FI63BATD;Initial Catalog=quanlyquankaraoke;User ID=sa; Password=phamvanhiep");
            Control_dangnhap.ketnoisql = conn;
            Control_dangnhap.tenbang = "QL_TaiKhoan";
            Control_dangnhap.txt1 = "tendangnhap";
            Control_dangnhap.txt2 = "matkhau";
            Control_dangnhap.form_Dong = this;            
            FormMain fm1 = new FormMain();
            Control_dangnhap.form_DuocMo = fm1;
        }
    }
}

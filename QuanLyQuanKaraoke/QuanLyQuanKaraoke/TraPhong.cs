using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace QuanLyQuanKaraoke
{
    public partial class TraPhong : Form
    {
        public TraPhong()
        {
            InitializeComponent();
            autoText();
        }
        void autoText()
        {
            txtTK.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
            txtTK.AutoCompleteSource = AutoCompleteSource.CustomSource;
            AutoCompleteStringCollection coll = new AutoCompleteStringCollection();

            try
            {
                SqlConnection conn = new SqlConnection();
                Connection kn = new Connection();
                conn = Connection.GetDBConnection();
                conn.Open();
                string s = "select * from dichvu";
                SqlCommand cmd = new SqlCommand(s, conn);
                SqlDataReader rd;
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    //String ten = rd.GetString("TENKH");
                    coll.Add(rd["TenDichVu"].ToString());
                }
                txtTK.AutoCompleteMode = AutoCompleteMode.SuggestAppend;
                txtTK.AutoCompleteSource = AutoCompleteSource.CustomSource;
                txtTK.AutoCompleteCustomSource = coll;

            }
            catch { MessageBox.Show("Lỗi"); }

        }
        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void groupPanel2_Click(object sender, EventArgs e)
        {

        }
          private string _message;
        public TraPhong(string Message)
            : this()
        {
            _message = Message;
            txtTenPhong.Text = _message;
        }
        private void TraPhong_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataQuanLy.DichVu' table. You can move, or remove it, as needed.
            this.dichVuTableAdapter.Fill(this.dataQuanLy.DichVu);
            // TODO: This line of code loads data into the 'dataQuanLy.HoaDon_Tam' table. You can move, or remove it, as needed.
            this.hoaDon_TamTableAdapter.Fill(this.dataQuanLy.HoaDon_Tam);
            lbKetThuc.Text = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
            try
            {
                this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, txtTenPhong.Text.Substring(6,3));
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
             SqlConnection conn = new SqlConnection();
            Connection kn = new Connection();
            conn = Connection.GetDBConnection();
            conn.Open();
            DataSet ds = new DataSet();
            if (conn.State.ToString() == "Open")
            {
                string tinhtrang = "select giobd from hoadon_tam where maphong='" + txtTenPhong.Text.Substring(6, 3) + "'";

                
                //DataTable tb = new DataTable();
                SqlDataAdapter com = new SqlDataAdapter(tinhtrang, conn);
                com.Fill(ds, "giobd");
                DataRow dr = ds.Tables["giobd"].Rows[0];
                lbBatDau.Text = dr["giobd"].ToString();
            }
            string thoigian = "SELECT DATEDIFF(minute,'" + lbBatDau.Text + "','" + lbKetThuc.Text + "')";
            SqlCommand cmd = new SqlCommand(thoigian, conn);
            int tg = (int)cmd.ExecuteScalar();
            txtThoiGian.Text = tg.ToString();


        }

        private void TraPhong_FormClosing(object sender, FormClosingEventArgs e)
        {
            FormMain mh = new FormMain();

            mh.Show();
        }

        private void hoaDon_TamBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.hoaDon_TamBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataQuanLy);

        }

        
    }
}

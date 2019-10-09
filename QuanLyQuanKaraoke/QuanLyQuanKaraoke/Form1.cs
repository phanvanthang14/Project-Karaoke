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
using Control_DangNhap;

namespace QuanLyQuanKaraoke
{
    public partial class FormMain : Form
    {
        string maphong;
        string tinhtrang;

        SqlConnection kn = Connection.GetDBConnection();
 
        public FormMain()
        {
            InitializeComponent();
        }

        private void applicationButton1_Click(object sender, EventArgs e)
        {

        }

        private void ribbonBar10_ItemClick(object sender, EventArgs e)
        {

        }

        private void buttonItem5_Click(object sender, EventArgs e)
        {
            BanHang banhang = new BanHang();
            banhang.Show();
        }

        private void ribbonPanel1_Click(object sender, EventArgs e)
        {

        }


        public void load_phong() 
        {
            SqlConnection conn = new SqlConnection();
            Connection kn = new Connection();
            conn = Connection.GetDBConnection();
            conn.Open();
            if (conn.State.ToString() == "Open")
            {
                string sophong = "select count(*) from phong";
                SqlCommand cmd = new SqlCommand(sophong,conn);
                int i = 0;
                int j = 0;
                int slPHat = 0;
                int slpDon = 0;
                int slPBaoTri = 0;
                int slpTrong = 0;
                //--------------------------
                string sql_phong = "select * from phong";
                SqlCommand cmd1 = new SqlCommand(sql_phong, conn);
                SqlDataAdapter com = new SqlDataAdapter(cmd1);
                DataTable table = new DataTable();//tạo bảng ảo trong hệ thống
                com.Fill(table);// đổ dữ liệu vào bảng ảo
                foreach (DataRow row in table.Rows)
                {
                    
                            Button b = new Button();
                            Label lb = new Label();
                            b.Name = row[1].ToString();
                            b.Width = 150;
                            b.Height = 150;
                            b.Top = 185 + i * 170;
                            b.Left = 20 + j * 170;
                            if (row[3].ToString() == "Đang Dọn")
                            {
                                b.BackColor = System.Drawing.Color.Orange;
                                slpDon++;
                                tinhtrang = "Đang dọn";
                            }
                            else
                                if (row[3].ToString() == "Đang Hát")
                                {
                                    b.BackColor = System.Drawing.Color.Red;
                                    slPHat++;
                                    tinhtrang = "Đang hát";
                                }
                                else
                                    if (row[3].ToString() == "Bảo Trì")
                                    {
                                        b.BackColor = System.Drawing.Color.Brown;
                                        slPBaoTri++;
                                        tinhtrang = "Bảo trì";
                                    }
                                    else
                                    {
                                        b.BackColor = System.Drawing.Color.Green;
                                        slpTrong++;
                                    }
                            b.Text = "Phòng "+row[0].ToString();
                            b.ForeColor = System.Drawing.Color.White;
                            b.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                            lb.Text = row[3].ToString();
                            lb.Width = 120;
                            lb.Top = 305 + i * 170;
                            lb.Left = 35 + j * 170;
                            lb.TextAlign = ContentAlignment.BottomCenter;
                            lb.ForeColor = System.Drawing.Color.Green;
                            lb.BackColor = System.Drawing.Color.White;
                            lb.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0))); 
                            this.Controls.Add(lb);
                            ///b.Image = Image.FromFile(@"C:\Users\phanv\Desktop\QuanLyQuanKaraoke\Project-Karaoke\QuanLyQuanKaraoke\QuanLyQuanKaraoke\image\icons8-microphone-64.png");
                            b.TextAlign = ContentAlignment.TopCenter;
                            this.Controls.Add(b);
                            b.Click += new System.EventHandler(b_Click);
                            j++;
                            if (j == 5)
                            {
                                i++;
                                j = 0;
                            }
                        }
                            btnTrong.Text = "Phòng trống: " + slpTrong.ToString();
                            btnBaoTri.Text = "Bảo trì: " + slPBaoTri.ToString();
                            btnDangDon.Text = "Đang dọn: " + slpDon.ToString();
                            btnDangHat.Text = "Đang hát: " + slPHat.ToString();
             
            }
           
            
        }
        public delegate void delPassData(String text);
        void b_Click(object sender, EventArgs e)
        {
              maphong = ((Button)sender).Text.ToString();
            SqlConnection conn = new SqlConnection();
            Connection kn = new Connection();
            conn = Connection.GetDBConnection();
            conn.Open();
            if (conn.State.ToString() == "Open")
            {
                string tinhtrang = "select tinhtrang from phong where maphong='"+maphong.Substring(6,3).ToString()+"'";
                //MessageBox.Show(maphong);
               // SqlCommand cmd = new SqlCommand(tinhtrang,conn);
                DataSet ds = new DataSet();
                //DataTable tb = new DataTable();
                SqlDataAdapter com = new SqlDataAdapter(tinhtrang,conn);
                com.Fill(ds,"TinhTrang");
                DataRow dr = ds.Tables["TinhTrang"].Rows[0];
                string tinhtrangp = dr["tinhtrang"].ToString();
                if (tinhtrangp == "Trống")
                {
                    BanHang bh = new BanHang(maphong);
                    this.Hide();
                    bh.Show();
                }
                else
                    if (tinhtrangp == "Đang Hát")
                    {
                        TraPhong tp = new TraPhong(maphong);
                        this.Hide();
                        tp.Show();
                    }
                    else
                        if (tinhtrangp == "Đang Dọn")
                        {
                            MessageBox.Show("Bạn có muốn kết thúc dọn phòng không ?");
                        }        
                }
           
        }
      
        private void FormMain_Load(object sender, EventArgs e)
        {
            kn.Open();
            timer1.Interval = 1000;
            timer1.Start();
            load_phong();            
            load_PhanQuyen(Control_dangnhap.get_TenDangNhap);
        }

        private void load_PhanQuyen(string tenDN)
        {
            string sql_PhanQuyen = "select * from QL_PhanQuyenTaiKhoan where TenDN='"+tenDN+"'";
            SqlCommand cmd_PhanQuyen = new SqlCommand(sql_PhanQuyen, kn);
            SqlDataAdapter adt = new SqlDataAdapter(cmd_PhanQuyen);
            DataTable table = new DataTable();
            adt.Fill(table);
            foreach (DataRow item in table.Rows)
            {                
                if (item[1].ToString() == "CN01" && (bool)item[2]==false)
                    CN01.Visible = false;
                if (item[1].ToString() == "CN02" && (bool)item[2] == false)
                    CN02.Visible = false;
                if (item[1].ToString() == "CN03" && (bool)item[2] == false)
                    CN03.Visible = false;
                if (item[1].ToString() == "CN04" && (bool)item[2] == false)
                    CN04.Visible = false;
                if (item[1].ToString() == "CN05" && (bool)item[2] == false)
                    CN05.Visible = false;
                if (item[1].ToString() == "CN06" && (bool)item[2] == false)
                    CN06.Visible = false;
                if (item[1].ToString() == "CN07" && (bool)item[2] == false)
                    CN07.Visible = false;
                if (item[1].ToString() == "CN08" && (bool)item[2] == false)
                    CN08.Visible = false;
                if (item[1].ToString() == "CN09" && (bool)item[2] == false)
                    CN09.Visible = false;
                if (item[1].ToString() == "CN10" && (bool)item[2] == false)
                    CN10.Visible = false;
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            btnNgayGio.Text = DateTime.Now.ToString();
            
        }

        private void rbQuanLy_Click(object sender, EventArgs e)
        {

        }

        private void buttonItem3_Click(object sender, EventArgs e)
        {
            GiaoCa gc = new GiaoCa();
            gc.Show();
        }

        private void btnTK_Click(object sender, EventArgs e)
        {
            QuanLyTaiKhoan tk = new QuanLyTaiKhoan();
            tk.Show();
        }

        private void btnDoiMK_Click(object sender, EventArgs e)
        {

        }

        private void btnNhanVien_Click(object sender, EventArgs e)
        {
            frmNhanVien nv = new frmNhanVien();
            nv.Show();
        }

       

        private void contextMenuStrip1_MouseClick(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
                contextMenuStrip1.Show(new Point(e.X,e.Y));
        }

        private void btnAnUong_Click(object sender, EventArgs e)
        {
            DichVu dv = new DichVu();
            this.Hide();
            dv.ShowDialog();
            this.Show();
        }

        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            kn.Close();
        }



    }
}

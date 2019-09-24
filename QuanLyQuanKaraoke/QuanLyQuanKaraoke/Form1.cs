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
    public partial class FormMain : Form
    {
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
       
        public void load_phong() {
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
                            b.Top = 160 + i * 170;
                            b.Left = 20 + j * 170;
                            if (row[3].ToString() == "Đang Dọn")
                            {
                                b.BackColor = System.Drawing.Color.Orange;
                                slpDon++;
                            }
                            else
                                if (row[3].ToString() == "Đang Hát")
                                {
                                    b.BackColor = System.Drawing.Color.Red;
                                    slPHat++;
                                }
                                else
                                    if (row[3].ToString() == "Bảo Trì")
                                    {
                                        b.BackColor = System.Drawing.Color.Brown;
                                        slPBaoTri++;
                                    }
                                    else
                                    {
                                        b.BackColor = System.Drawing.Color.Green;
                                        slpTrong++;
                                    }
                            b.Text = row[0].ToString();
                            lb.Text = row[3].ToString();
                            lb.Width = 120;
                            lb.Top = 280 + i * 170;
                            lb.Left = 35 + j * 170;
                            lb.TextAlign = ContentAlignment.BottomCenter;
                            lb.ForeColor = System.Drawing.Color.Green;
                            lb.BackColor = System.Drawing.Color.White;
                            this.Controls.Add(lb);
                            b.Image = Image.FromFile(@"C:\Users\phanv\Desktop\QuanLyQuanKaraoke\Project-Karaoke\QuanLyQuanKaraoke\QuanLyQuanKaraoke\image\icons8-microphone-64.png");
                            b.TextAlign = ContentAlignment.TopCenter;
                            this.Controls.Add(b);
                            j++;
                            if (j == 7)
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
        private void FormMain_Load(object sender, EventArgs e)
        {
            timer1.Interval = 1000;
            timer1.Start();
           
              load_phong();
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
            ResetPassWord reset = new ResetPassWord();
            reset.Show();
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
    }
}

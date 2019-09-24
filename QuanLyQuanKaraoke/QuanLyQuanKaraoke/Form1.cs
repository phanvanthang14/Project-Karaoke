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
                 string phongTrong = "select count(*) from phong where tinhtrang =N'Trống'";
                SqlCommand cmd = new SqlCommand(phongTrong,conn);
                int slPhongTrong = (int)cmd.ExecuteScalar();
                int sodong = slPhongTrong / 5;
                int sodu = slPhongTrong % 5;

                for (int i = 0; i < sodong; i++)
                {
                    for (int j = 0; j < 5; j++)
                    {
                        Button b = new Button();
                        Label lb = new Label();
                        b.Name = i.ToString() + "Phòng 101" + j.ToString();
                        b.Width = 150;
                        b.Height = 150;
                        b.Top = 160 + i * 150;
                        b.Left = 20 + j * 150;
                        b.BackColor = System.Drawing.Color.White;
                        b.Text = "Phòng 101";
                        lb.Text = "Sẵn sàng đón khách";
                        lb.Width = 120;
                        lb.Top = 280 + i * 150;
                        lb.Left = 35 + j * 150;
                        lb.TextAlign = ContentAlignment.BottomCenter;
                        lb.ForeColor = System.Drawing.Color.Green;
                        lb.BackColor = System.Drawing.Color.White;
                        this.Controls.Add(lb);
                        b.Image = Image.FromFile(@"C:\Users\phanv\Desktop\QuanLyQuanKaraoke\Project-Karaoke\QuanLyQuanKaraoke\QuanLyQuanKaraoke\image\icons8-microphone-64.png");
                        b.TextAlign = ContentAlignment.TopCenter;
                        this.Controls.Add(b);
                    }
                }
                for (int a = 0; a < sodu; a++)
                {
                    Button b = new Button();
                    Label lb = new Label();
                    int dongcuoi = sodong;
                    b.Name = dongcuoi.ToString() + "Phòng 101" + a.ToString();
                    b.Width = 150;
                    b.Height = 150;
                    b.Top = 160 + dongcuoi * 150;
                    b.Left = 20 + a * 150;
                    b.BackColor = System.Drawing.Color.White;
                    b.Text = "Phòng 101";
                    lb.Text = "Sẵn sàng đón khách";
                    lb.Width = 120;
                    lb.Top = 280 + dongcuoi * 150;
                    lb.Left = 35 + a * 150;
                    lb.TextAlign = ContentAlignment.BottomCenter;
                    lb.ForeColor = System.Drawing.Color.Green;
                    lb.BackColor = System.Drawing.Color.White;
                    this.Controls.Add(lb);
                    b.Image = Image.FromFile(@"C:\Users\phanv\Desktop\QuanLyQuanKaraoke\Project-Karaoke\QuanLyQuanKaraoke\QuanLyQuanKaraoke\image\icons8-microphone-64.png");
                    b.TextAlign = ContentAlignment.TopCenter;
                    this.Controls.Add(b);
                }
               
                
            }
           
            
        }
        private void FormMain_Load(object sender, EventArgs e)
        {
            timer1.Interval = 1000;
            timer1.Start();
            //  for (int i = 0; i < 2; i++)
            //{
            //    for (int j = 0; j < 2; j++)
            //    {
            //        Button b = new Button();
            //        Label lb = new Label();
            //        b.Name = i.ToString() + "Phòng 101" + j.ToString();
            //        b.Width = 150;
            //        b.Height = 150;
            //        b.Top = 160 + i * 150;
            //        b.Left = 20 + j * 150;
            //        b.BackColor = System.Drawing.Color.White;
            //        b.Text = "Phòng 101";
            //        lb.Text = "Sẵn sàng đón khách";
            //        lb.Width = 120;
            //        lb.Top = 280 + i * 150;
            //        lb.Left = 35 + j * 150;
            //        lb.TextAlign = ContentAlignment.BottomCenter;
            //        lb.ForeColor = System.Drawing.Color.Green;
            //        lb.BackColor = System.Drawing.Color.White;
            //        this.Controls.Add(lb);
            //        b.Image = Image.FromFile(@"C:\Users\phanv\Desktop\QuanLyQuanKaraoke\Project-Karaoke\QuanLyQuanKaraoke\QuanLyQuanKaraoke\image\icons8-microphone-64.png");
            //        b.TextAlign = ContentAlignment.TopCenter;
            //        this.Controls.Add(b);  
            //    }
            
            //}
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
    }
}

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
using System.Runtime;

namespace QuanLyQuanKaraoke
{
    public partial class BanHang : Form
    {
        public BanHang()
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
        private string _message;
        public BanHang(string Message)
            : this()
        {
            _message = Message;
            test.Text = _message;
        }
        private void BanHang_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataQuanLy.KhachHang' table. You can move, or remove it, as needed.
            this.khachHangTableAdapter.Fill(this.dataQuanLy.KhachHang);
            // TODO: This line of code loads data into the 'dataQuanLy.HoaDon_Tam' table. You can move, or remove it, as needed.
            this.hoaDon_TamTableAdapter.Fill(this.dataQuanLy.HoaDon_Tam);
            // TODO: This line of code loads data into the 'dataQuanLy.HoaDonTam' table. You can move, or remove it, as needed.
           // this.hoaDonTamTableAdapter.Fill(this.dataQuanLy.HoaDonTam);
            // TODO: This line of code loads data into the 'dataQuanLy.CTHD_Tam' table. You can move, or remove it, as needed.
            this.cTHD_TamTableAdapter.Fill(this.dataQuanLy.CTHD_Tam);
            // TODO: This line of code loads data into the 'dataQuanLy.DichVu' table. You can move, or remove it, as needed.
            this.dichVuTableAdapter.Fill(this.dataQuanLy.DichVu);
            // TODO: This line of code loads data into the 'dataSet1.DichVu' table. You can move, or remove it, as needed.
            //this.dichVuTableAdapter.Fill(this.dataSet1.DichVu);
             DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
            dichVuDataGridView.Columns.Add(btn);
            btn.HeaderText = "Thêm";
            btn.Text = "Thêm";
            btn.Name = "btn";
            btn.UseColumnTextForButtonValue = true;
            DataGridViewButtonColumn btn1 = new DataGridViewButtonColumn();
                tamTinhDataGridView.Columns.Add(btn1);
            btn1.HeaderText = "Trả lại";
            btn1.Text = "-";
            btn1.Name = "btn1";
            btn1.UseColumnTextForButtonValue = true;
         
            try
            {
                this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, test.Text.Substring(6,3).ToString());
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
           

        }

        private void dichVuDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //string date = DateTime.Now.ToString();
            //int i = dichVuDataGridView.CurrentCell.RowIndex;
            //string madv = dichVuDataGridView.Rows[i].Cells[0].Value.ToString();
            //hoaDon_TamTableAdapter.Insert(test.Text.Substring(6, 3).ToString(), test.Text.Substring(6, 3).ToString(), khachHangComboBox.SelectedValue.ToString(), DateTime.Now);
            //if (dichVuDataGridView.CurrentCell.RowIndex.ToString()!="")
            //{
            //    cTHD_TamTableAdapter.Insert(test.Text.Substring(6, 3).ToString(), madv, 1, dichVuDataGridView.Rows[i].Cells[4].Value.ToString());
            //    this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, test.Text.Substring(6, 3).ToString());
            //}
            //txtTK.Text = madv;
        }

        private void dichVuDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            string date = DateTime.Now.ToString();
            int i = dichVuDataGridView.CurrentCell.RowIndex;
            string madv = dichVuDataGridView.Rows[i].Cells[0].Value.ToString();
            SqlConnection conn = new SqlConnection();
            Connection kn = new Connection();
            conn = Connection.GetDBConnection();
            conn.Open();
            string ktrama = "select count(*) from hoadon_tam where maphucvu='" + test.Text.Substring(6, 3).ToString() + "'";
            txtTK.Text = madv;
             SqlCommand cmd = new SqlCommand(ktrama, conn);
                    int j = (int)cmd.ExecuteScalar();
                    if (j < 1)
                    {
                        hoaDon_TamTableAdapter.Insert(test.Text.Substring(6, 3).ToString(), test.Text.Substring(6, 3).ToString(), khachHangComboBox.SelectedValue.ToString(), DateTime.Now);
                    }
                    string ktramapv = "select count(*) from hoadon_tam, cthd_tam where hoadon_tam.maphucvu=cthd_tam.mapv and madv='"+madv+"' and maphong='" + test.Text.Substring(6, 3).ToString() + "'";
                    SqlCommand cmd1 = new SqlCommand(ktramapv, conn);
                    int dem = (int)cmd1.ExecuteScalar();
                    if (dem < 1)
                    {
                        if (dichVuDataGridView.CurrentCell.RowIndex.ToString() != "")
                        {
                            cTHD_TamTableAdapter.Insert(test.Text.Substring(6, 3).ToString(), madv, 0, dichVuDataGridView.Rows[i].Cells[4].Value.ToString());
                          
                            this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, test.Text.Substring(6, 3).ToString());
                             
                              this.dichVuTableAdapter.Fill(this.dataQuanLy.DichVu);

                        }
                    }
                    else
                    {
                        MessageBox.Show("Dịch vụ này đã thêm");
                    }
        }

        private void tamTinhDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //SqlConnection conn = new SqlConnection();
            //Connection kn = new Connection();
            //conn = Connection.GetDBConnection();
            //conn.Open();
            //int i = tamTinhDataGridView.CurrentCell.RowIndex;
            //string madv = tamTinhDataGridView.Rows[i].Cells[0].Value.ToString();
            //txtTK.Text = madv;
            //string updatedv = "update dichvu set soluong=soluong+" + (int)tamTinhDataGridView.Rows[i].Cells[2].Value + " where madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "'";
            //SqlCommand com2 = new SqlCommand(updatedv, conn);
            //com2.ExecuteNonQuery();
            //this.dichVuTableAdapter.Fill(this.dataQuanLy.DichVu);
            ////cTHD_TamTableAdapter.Delete(test.Text.Substring(6, 3).ToString(), tamTinhDataGridView.Rows[i].Cells[5].Value.ToString(), (int)tamTinhDataGridView.Rows[i].Cells[1].Value, tamTinhDataGridView.Rows[i].Cells[3].Value.ToString());
            //string updatehdtam = "delete from cthd_tam where mapv='" + test.Text.Substring(6, 3).ToString() + "' and madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "'";
            //SqlCommand cmd = new SqlCommand(updatehdtam, conn);
            //cmd.ExecuteNonQuery();
            //this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, test.Text.Substring(6, 3).ToString());
           
           
        }

        private void tamTinhDataGridView_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                Connection kn = new Connection();
                conn = Connection.GetDBConnection();
                conn.Open();
                int i = tamTinhDataGridView.CurrentCell.RowIndex;
                string madv = tamTinhDataGridView.Rows[i].Cells[0].Value.ToString();
                txtTK.Text = madv;
                string updatedv = "update dichvu set soluong=soluong+" + (int)tamTinhDataGridView.Rows[i].Cells[2].Value + " where madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "'";
                SqlCommand com2 = new SqlCommand(updatedv, conn);
                com2.ExecuteNonQuery();
                this.dichVuTableAdapter.Fill(this.dataQuanLy.DichVu);
                //cTHD_TamTableAdapter.Delete(test.Text.Substring(6, 3).ToString(), tamTinhDataGridView.Rows[i].Cells[5].Value.ToString(), (int)tamTinhDataGridView.Rows[i].Cells[1].Value, tamTinhDataGridView.Rows[i].Cells[3].Value.ToString());
                string updatehdtam = "delete from cthd_tam where mapv='" + test.Text.Substring(6, 3).ToString() + "' and madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "'";
                SqlCommand cmd = new SqlCommand(updatehdtam, conn);
                cmd.ExecuteNonQuery();
                this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, test.Text.Substring(6, 3).ToString());
               
            }
            catch {
                MessageBox.Show("Errol 404 !!!");
            }
        }

      

        private void btnLuu_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            Connection kn = new Connection();
            conn = Connection.GetDBConnection();
            conn.Open();
            int sldat;
            for (int i = 0; i < tamTinhDataGridView.Rows.Count - 1; i++)
            {
                if (tamTinhDataGridView.Rows[i].Cells[2].Value.ToString() != null)
                {
                    sldat = (int)tamTinhDataGridView.Rows[i].Cells[2].Value;
                    string slcon = "select soluong from dichvu where madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "'";
                    SqlCommand sl = new SqlCommand(slcon, conn);
                    int slcon1 = (int)sl.ExecuteScalar();

                    string slht = "select soluong from cthd_tam where madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "' and mapv='" + test.Text.Substring(6, 3).ToString() + "'";
                    SqlCommand slht1 = new SqlCommand(slht, conn);

                    int slh = (int)slht1.ExecuteScalar();

                    if (sldat < slcon1 && sldat != slh)
                    {
                        string updatedv = "update dichvu set soluong=soluong+" + slh + "-" + (int)tamTinhDataGridView.Rows[i].Cells[2].Value + " where madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "'";
                        SqlCommand com2 = new SqlCommand(updatedv, conn);
                        com2.ExecuteNonQuery();
                        string updatecthdtam = "update cthd_tam set soluong=" + (int)tamTinhDataGridView.Rows[i].Cells[2].Value + " where mapv='" + test.Text.Substring(6, 3).ToString() + "' and madv='" + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + "'"; ;
                        SqlCommand com = new SqlCommand(updatecthdtam, conn);
                        com.ExecuteNonQuery();
                    }
                    else if (sldat == slh)
                    {
                        this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, test.Text.Substring(6, 3).ToString());
                    }
                    else
                    {
                        MessageBox.Show("Dịch vụ " + tamTinhDataGridView.Rows[i].Cells[0].Value.ToString() + " không đủ số lượng cung cấp");
                        break;
                    }
                }
                else
                    break;
            }
            this.tamTinhTableAdapter.Fill(this.dataQuanLy.TamTinh, test.Text.Substring(6, 3).ToString());
            this.dichVuTableAdapter.Fill(this.dataQuanLy.DichVu);
            string updatephong = "update phong set tinhtrang=N'Đang Hát' where maphong='"+test.Text.Substring(6, 3).ToString()+"'";
            SqlCommand cnPhong = new SqlCommand(updatephong, conn);
            cnPhong.ExecuteNonQuery();
            this.Close();
            
        }

        private void BanHang_FormClosing(object sender, FormClosingEventArgs e)
        {
           
            FormMain mh = new FormMain();
           
            mh.Show();
        }

        private void btnTK_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection();
                Connection kn = new Connection();
                conn = Connection.GetDBConnection();
                conn.Open();

                string tk = "select * from dichvu where tendichvu =N'" + txtTK.Text + "'";
                SqlCommand cmd = new SqlCommand(tk, conn);

                SqlDataAdapter com = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();//tạo bảng ảo trong hệ thống
                com.Fill(table);// đổ dữ liệu vào bảng ảo
                dichVuDataGridView.DataSource = table;
            }
            catch {
                MessageBox.Show("Giá trị bạn nhập chưa chính xác");
            }
            
        }

      

       

        
    }
}

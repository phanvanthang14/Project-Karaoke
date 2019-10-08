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
    public partial class QuanLyTaiKhoan : Form
    {
        public QuanLyTaiKhoan()
        {
            InitializeComponent();
        }

        SqlConnection kn = Connection.GetDBConnection();

        private void QuanLyTaiKhoan_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qL_TaiKhoan.QL_PhanQuyenTaiKhoan' table. You can move, or remove it, as needed.
            this.qL_PhanQuyenTaiKhoanTableAdapter.Fill(this.qL_TaiKhoan.QL_PhanQuyenTaiKhoan);
            // TODO: This line of code loads data into the 'qL_TaiKhoan._QL_TaiKhoan' table. You can move, or remove it, as needed.
            this.qL_TaiKhoanTableAdapter.Fill(this.qL_TaiKhoan._QL_TaiKhoan);                  
            // TODO: This line of code loads data into the 'qL_TaiKhoan.QL_PhanQuyen' table. You can move, or remove it, as needed.
            this.qL_PhanQuyenTableAdapter.Fill(this.qL_TaiKhoan.QL_PhanQuyen);
            // TODO: This line of code loads data into the 'qL_TaiKhoan.QL_NhomNguoiDung' table. You can move, or remove it, as needed.
            this.qL_NhomNguoiDungTableAdapter.Fill(this.qL_TaiKhoan.QL_NhomNguoiDung);
            // TODO: This line of code loads data into the 'qL_TaiKhoan.DataTable1' table. You can move, or remove it, as needed.
            this.dataTable1TableAdapter.Fill_tk(this.qL_TaiKhoan.DataTable1);
            //load bảng phân quyền theo nhóm chức năng
            this.tableAdapterTableAdapter.Fill(this.qL_TaiKhoan.PhanQuyenTheoNhomND, cbb_NhomND.SelectedValue.ToString());
            //load bảng phân quyền theo tài khoản
            this.phanQuyenTheoTaiKhoanTableAdapter.Fill(this.qL_TaiKhoan.PhanQuyenTheoTaiKhoan, cbb_tentaikhoan.SelectedValue.ToString());

            kn.Open();
            binding();
        }


        private void binding()
        {
            cbbnhomND.DataBindings.Clear();
            cbbnhomND.DataBindings.Add("text", dgvTaiKhoan.DataSource, "TenNhom");
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (kn.State == ConnectionState.Open)
            {
                kn.Close();
            }
            this.Hide();
            ThemTaiKhoan themtk = new ThemTaiKhoan();
            themtk.ShowDialog();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult r = MessageBox.Show("Bạn có chắc chắn muốn đổi thông tin của tài khoản " + txtTaiKhoan.Text + " !", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (r == DialogResult.OK)
                {
                    bool hd;
                    if (ckbHoatDong.Checked == true)
                        hd = true;
                    else
                        hd = false;
                    string sql_updateTK = "update QL_TaiKhoan set HoatDong='"+hd+"', NhomNguoiDung='"+cbbnhomND.SelectedValue.ToString()+"' where TenDangNhap='"+txtTaiKhoan.Text+"'";
                    SqlCommand cmd = new SqlCommand(sql_updateTK, kn);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Sửa thành công !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    CapNhatQuyenTheoNhomND(cbbnhomND.SelectedValue.ToString(), txtTaiKhoan.Text);
                    this.dataTable1TableAdapter.Fill_tk(this.qL_TaiKhoan.DataTable1);
                    binding();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult r = MessageBox.Show("Bạn có chắc chắn muốn reset mật khẩu của tài khoản " + txtTaiKhoan.Text + " !", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (r == DialogResult.OK)
                {
                    string sql_resetmk = "update QL_TaiKhoan set MatKhau='11111' where TenDangNhap='" + txtTaiKhoan.Text + "'";
                    SqlCommand cmd = new SqlCommand(sql_resetmk, kn);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Reset mật khẩu thành công! Mật Khẩu mặc đinh là: 11111", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                if (KT_TrongNhomND())
                {
                    qL_NhomNguoiDungTableAdapter.Insert(txtmanhom.Text, txttennhom.Text, txtghichu.Text);
                    this.qL_NhomNguoiDungTableAdapter.Fill(this.qL_TaiKhoan.QL_NhomNguoiDung);
                    MessageBox.Show("Thêm nhóm người dùng thành công !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch
            {
                MessageBox.Show("Mã nhóm người dùng đã tồn tại !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void bntchange_Click(object sender, EventArgs e)
        {
            if (KT_TrongNhomND())
            {
                string maNh = dgvNhomNguoiDung.CurrentRow.Cells[0].Value.ToString();
                string tenNh = dgvNhomNguoiDung.CurrentRow.Cells[1].Value.ToString();
                string GC = dgvNhomNguoiDung.CurrentRow.Cells[2].Value.ToString();
                int kq = qL_NhomNguoiDungTableAdapter.Update(maNh, tenNh, GC, maNh, tenNh, GC);
                if (kq == 1)
                    MessageBox.Show("Sửa thành công!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Lỗi", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void bntdelete_Click(object sender, EventArgs e)
        {
            DialogResult r = MessageBox.Show("Bạn có chắc chắn muốn xóa nhóm người dùng " + txttennhom.Text + " !", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (r == DialogResult.OK)
            {
                string maNh = dgvNhomNguoiDung.CurrentRow.Cells[0].Value.ToString();
                string tenNh = dgvNhomNguoiDung.CurrentRow.Cells[1].Value.ToString();
                string GC = dgvNhomNguoiDung.CurrentRow.Cells[2].Value.ToString();
                int kq = qL_NhomNguoiDungTableAdapter.Delete(maNh, tenNh, GC);
                this.qL_NhomNguoiDungTableAdapter.Fill(this.qL_TaiKhoan.QL_NhomNguoiDung);
                if (kq == 1)
                    MessageBox.Show("Xóa thành công!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                else
                    MessageBox.Show("Đang có tài khoản thuộc nhóm này, Không thể xóa Nhóm !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private bool KT_TrongNhomND()
        {
            if (string.IsNullOrEmpty(this.txtmanhom.Text))
            {
                MessageBox.Show("Không được bỏ trống mã nhóm !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.txtmanhom.Focus();
                return false;
            }

            if (string.IsNullOrEmpty(this.txttennhom.Text))
            {
                MessageBox.Show("Không được bỏ trống tên nhóm !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.txttennhom.Focus();
                return false;
            }
            return true;
        }

        private void qL_NhomNguoiDungComboBoxEx_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.tableAdapterTableAdapter.Fill(this.qL_TaiKhoan.PhanQuyenTheoNhomND, cbb_NhomND.SelectedValue.ToString());
            }
            catch (System.Exception ex)
            {
                //System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                string maCN=null;
                string maND = cbb_NhomND.SelectedValue.ToString();
                bool CoQuyen;
                int tongsodong= dvgPhanQuyenTheoNhom.Rows.Count;
                for (int i = 0; i <tongsodong-1 ; i++)
                {
                    maCN = dvgPhanQuyenTheoNhom.Rows[i].Cells[0].Value.ToString();
                    try //chưa được thiết lập trong DTB nên giá trị checkbox NULL
                    {
                        CoQuyen = (bool)dvgPhanQuyenTheoNhom.Rows[i].Cells[2].Value;
                    }
                    catch
                    {
                        CoQuyen = false;
                    }
                    try
                    {
                        this.qL_PhanQuyenTableAdapter.Insert(maND, maCN, CoQuyen);
                    }
                    catch
                    {
                        MessageBox.Show("update");
                        //this.qL_PhanQuyenTableAdapter.Update();
                    }
                }
                MessageBox.Show("Cập nhật quyền thành công !","Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void QuanLyTaiKhoan_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (kn.State == ConnectionState.Open)
            {
                kn.Close();
            }
        }

        private void cbb_tentaikhoan_SelectedIndexChanged(object sender, EventArgs e)
        {            
            try
            {
                this.phanQuyenTheoTaiKhoanTableAdapter.Fill(this.qL_TaiKhoan.PhanQuyenTheoTaiKhoan, cbb_tentaikhoan.SelectedValue.ToString());
            }
            catch (System.Exception ex)
            {
                //System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }

        private void btn_luu_pqtk_Click(object sender, EventArgs e)
        {

        }

        public void CapNhatQuyenTheoNhomND(string manhom, string tendangnhap)
        {
            try
            {
                string maCN = null;
                bool quyen;
                string sql_updateQuyenTheoNhomND = "select * from QL_PhanQuyen where QL_PhanQuyen.MaNhomNguoiDung='"+manhom+"'";
                SqlCommand cmdread = new SqlCommand(sql_updateQuyenTheoNhomND,kn);
                SqlDataReader read= cmdread.ExecuteReader();               
                while(read.Read())
                {
                    maCN= read.GetString(1);
                    quyen= read.GetBoolean(2);
                    try
                    {
                        this.qL_PhanQuyenTaiKhoanTableAdapter.Insert(tendangnhap,maCN,quyen);
                    }
                    catch
                    {
                        //this.qL_PhanQuyenTaiKhoanTableAdapter.Update();
                    }
                }
                read.Close();
                MessageBox.Show("Cập nhật quyền thành công !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
             catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

 
    }
}

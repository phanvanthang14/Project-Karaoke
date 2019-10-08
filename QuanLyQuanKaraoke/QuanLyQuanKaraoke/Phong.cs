using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace QuanLyQuanKaraoke
{
    public partial class Phong : UserControl
    {
        public Phong()
        {
            InitializeComponent();
        }

        private void Phong_Load(object sender, EventArgs e)
        {
            
            SqlConnection conn = new SqlConnection();
            conn = Connection.GetDBConnection();
            conn.Open();
            
        }
    }
}

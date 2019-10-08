using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanKaraoke
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            try
            {
                SqlConnection kn = new SqlConnection(Properties.Settings.Default.strString);
                kn.Open();
                kn.Close();
                Application.Run(new QuanLyTaiKhoan());
            }
            catch
            {
                Application.Run(new TaoKetNoi());

            }
        }
    }
}

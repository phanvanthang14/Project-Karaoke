using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace QuanLyQuanKaraoke
{
    class Connection
    {
        public static SqlConnection
                GetDBConnection()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-6KEP9GD\SQLEXPRESS;Initial Catalog=QuanLyQuanKaraoke;Integrated Security=True");
            return conn;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LibraryManagement
{

    public class ReaderBasic
    {
        public int readerId { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
    }

    public class Reader : ReaderBasic
    {
        public string CNP { get; set; }
        public string adressId { get; set; }
        public int genderId { get; set; }
        public string email { get; set; }
        public string phoneNumber { get; set; }

    }

    public class EmployeeDataAccessLayer
    {
        public static List<ReaderBasic> GetAllReadersBasicDetails()
        {
            List<ReaderBasic> listReaders = new List<ReaderBasic>();

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new
                    SqlCommand("Select reader_id, first_name, last_name from tblReader", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    ReaderBasic readerBasic = new ReaderBasic();
                    readerBasic.readerId = Convert.ToInt32(rdr["reader_id"]);
                    readerBasic.firstName = rdr["first_name"].ToString();
                    readerBasic.lastName = rdr["last_name"].ToString();

                    listReaders.Add(readerBasic);
                }
            }

            return listReaders;
        }


    }

            
    }

    
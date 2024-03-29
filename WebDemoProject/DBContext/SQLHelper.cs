﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;

namespace WebDemoProject.DBContext
{
    public class SQLHelper : IDisposable
    {
        private readonly SqlConnection _connection;
        private readonly SqlCommand _command;
        private readonly SqlDataReader _reader;
        string connectionString = ConfigurationManager.ConnectionStrings["TestDBConnection"].ConnectionString;
        public SQLHelper()
        {
            _connection = new SqlConnection(connectionString);
            _command = new SqlCommand();
            _connection.Open();
            _command.Connection = _connection;
        }

        public void Dispose()
        {
            _reader.Dispose();
            _command.Dispose();
            _connection.Close();

        }

        public int ExecuteNonQuery(string sql)
        {
            return 0;
        }
        public int ExecuteNonQuery(string sql, SqlParameter[] sqlParameters)
        {
            return 0;
        }
        public int ExecuteScalarByProc(string procName, SqlParameter[] sqlParameters)
        {
            SqlParameter[] pram= new SqlParameter[sqlParameters.Length];
            _command.CommandText= procName;
            _command.CommandType = CommandType.StoredProcedure;
            _command.Parameters.AddRange(sqlParameters);
            return (int)_command.ExecuteScalar();

        }
        public DataSet GetDataSetByProc(string procName, SqlParameter[] sqlParameters)
        {
            SqlParameter[] pram = new SqlParameter[sqlParameters.Length];
            _command.CommandText = procName;
            _command.CommandType = CommandType.StoredProcedure;
            _command.Parameters.AddRange(sqlParameters);
            SqlDataAdapter ad = new SqlDataAdapter(_command);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            return ds;

        }


    }
}
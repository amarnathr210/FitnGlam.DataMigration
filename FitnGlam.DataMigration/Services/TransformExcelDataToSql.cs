using ExcelDataReader;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;
using System;
using FitnGlam.DataMigration.Utility;
using Microsoft.Extensions.Logging;
using System.Linq;

namespace FitnGlam.DataMigration.Services
{
    public class TransformExcelDataToSql : ITransformExcelDataToSql
    {
        private readonly Tables _tables;
        private readonly ILogger _logger;
        public TransformExcelDataToSql(Tables tables,ILogger<TransformExcelDataToSql> logger)
        {
            _tables = tables;
            _logger = logger;
        }
        public async Task<DataTable> TransformDataToDataTable(string file)
        {
            DataSet ds;
            using (var stream = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            {
                IExcelDataReader reader = ExcelReaderFactory.CreateReader(stream);                
                ds = reader.AsDataSet(new ExcelDataSetConfiguration()
                {
                    UseColumnDataType = false,
                    ConfigureDataTable = (tableReader) => new ExcelDataTableConfiguration()
                    {
                        UseHeaderRow = true
                    }
                });
            }   
            return ds.Tables[0];
        }
        public async Task BulkInsert(DataTable dataTable,string TableName)
        {
            var Tableinfo = _tables.TableInfo.Where(a=>a.Name==TableName).FirstOrDefault();
            
            if (!(!string.IsNullOrEmpty(TableName) && Tableinfo.Columns.Count > 0))
                return;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Environment.GetEnvironmentVariable("DataMigrationFitnGlam_ConnectionString");
            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            objbulk.BulkCopyTimeout = 1000;
            objbulk.DestinationTableName = Tableinfo.DbName;
            foreach (var column in Tableinfo.Columns)
            {
                objbulk.ColumnMappings.Add(column.ExcelName, column.DBName);
            }
            con.Open();
            await objbulk.WriteToServerAsync(dataTable);
            con.Close();
        }
    }
}
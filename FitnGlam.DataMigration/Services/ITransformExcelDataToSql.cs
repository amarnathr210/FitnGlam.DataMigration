using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace FitnGlam.DataMigration.Services
{
    public interface ITransformExcelDataToSql
    {
        Task<DataTable> TransformDataToDataTable(string fileName);
        Task BulkInsert(DataTable dataTable, string TableName);
    }
}

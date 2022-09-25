using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FitnGlam.DataMigration.Utility
{
    public class Tables
    {
        public List<Table> TableInfo { get; set; }
    }
    public class Table
    {
        public string Name { get; set; }
        public string UiName { get; set; }
        public string DbName { get; set; }        

        public List<Column> Columns { get; set; }
    }

    public class Column
    {
        public string ExcelName { get; set; }
        public string DBName { get; set; }
    }

}

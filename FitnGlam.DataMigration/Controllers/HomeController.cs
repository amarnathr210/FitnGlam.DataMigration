using FitnGlam.DataMigration.Models;
using FitnGlam.DataMigration.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using FitnGlam.DataMigration.Utility;

namespace FitnGlam.DataMigration.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ITransformExcelDataToSql _transformExcelDataToSql;
        private readonly Tables _tables;
        public HomeController(ILogger<HomeController> logger, ITransformExcelDataToSql transformExcelDataToSql,Tables tables)
        {
            _logger = logger;
            _transformExcelDataToSql = transformExcelDataToSql;
            _tables = tables;
        }

        public IActionResult Index()
        {            
            return View(_tables.TableInfo.ToDictionary(a => a.Name, a => a.UiName));
        }

        [HttpPost]
        public async Task<IActionResult> Upload(IFormCollection formCollection)
        {
            try
            {
                var httpPostedFile = Request.Form.Files["postedFile"];
                string newFileName = string.Format("{0}_{1}{2}", Guid.NewGuid().ToString(), Path.GetFileNameWithoutExtension(httpPostedFile.FileName), Path.GetExtension(httpPostedFile.FileName));
                var fileName = Path.GetFileName(httpPostedFile.FileName);
                var path = Path.Combine(@"D:\FitnGlam\Files", newFileName);
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    await httpPostedFile.CopyToAsync(stream);
                }                
                DataTable dataTable = await _transformExcelDataToSql.TransformDataToDataTable(path);
                await _transformExcelDataToSql.BulkInsert(dataTable, formCollection["SelectFile"]);
                return View("Index", _tables.TableInfo.ToDictionary(a => a.Name, a => a.UiName));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                throw;
            }
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

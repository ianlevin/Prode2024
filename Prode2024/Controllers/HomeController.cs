using Microsoft.AspNetCore.Mvc;
using Prode2024.Models;
using System.Diagnostics;

namespace Prode2024.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }
		public IActionResult Partidos(int idUsuario)
		{
            ViewBag.ListaApuestas = BD.ObtenerApuestas(idUsuario);
            List<Match> partidosApostados = BD.ObtenerPartidosApostados(idUsuario);
            ViewBag.ListaPartidosApostados = partidosApostados;
			ViewBag.ListaPartidosSinApostar = BD.ObtenerPartidosSinApuesta(idUsuario, partidosApostados);
			ViewBag.ListaPaises = BD.ObtenerPaises();
            ViewBag.idUsuario = idUsuario;
			return View("Inicio");
		}
		public IActionResult Elegir(int idPartido, int idUsuario)
		{
            ViewBag.Partido = BD.ObtenerPartido(idPartido);
            ViewBag.Paises = BD.ObtenerPaisesPartido(idPartido);
            ViewBag.idPartido = idPartido;
            ViewBag.idUsuario = idUsuario;
			return View();
		}
		public IActionResult Apuesta(int idPartido, int idusuario, int winner)
		{
            BD.Apostar(idPartido,idusuario,winner);
			return RedirectToAction("Partidos",new {idUsuario = idusuario });
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
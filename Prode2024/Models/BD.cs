using System.Data.SqlClient;
using System.Xml.Linq;
using Dapper;

namespace Prode2024.Models
{
	public class BD
	{
		private static string ConnectionString { get; set; } = @"Server=DESKTOP-5VP95V6\SQLEXPRESS;DataBase=Prode2024;Trusted_Connection=True;";

		public static List<Match> ObtenerPartidos()
		{
			List<Match> user = new List<Match>();
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "SELECT * FROM Match";
				user = db.Query<Match>(sql).ToList();
			}
			return user;
		}

		public static List<Country> ObtenerPaises()
		{
			List<Country> user = new List<Country>();
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "SELECT * FROM Country";
				user = db.Query<Country>(sql).ToList();
			}
			return user;
		}

		public static List<Match> ObtenerPartidosApostados(int id)
		{
			List<int> apuestas = new List<int>();
			List<Match> partidos = new List<Match>();
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "SELECT idMatch FROM Apuesta WHERE idUser = @pid";
				apuestas = db.Query<int>(sql, new {pid = id}).ToList();

				for (int i = 0; i<apuestas.Count; i++)
				{
					sql = "SELECT * FROM Match WHERE id = @pid";
					partidos.Add(db.QueryFirstOrDefault<Match>(sql, new { pid = apuestas[i] }));
				}
			}
			return partidos;
		}

		public static List<Match> ObtenerPartidosSinApuesta(int idUsuario, List<Match> partidosApostados)
		{
			List<Match> partidosSinApostar = new List<Match>();
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "SELECT * FROM Match";
				partidosSinApostar = db.Query<Match>(sql).ToList();

				bool encontrado = false;
				int j = 0;
				for (int i = 0; i<partidosApostados.Count; i++)
				{
					j = 0;
					encontrado = false;
					while (encontrado == false)
					{
						if (partidosSinApostar[j].id == partidosApostados[i].id)
						{
							partidosSinApostar.RemoveAt(j);
							encontrado = true;
						}
						j++;
					}
				}
			}
			return partidosSinApostar;
		}

		public static List<Apuesta> ObtenerApuestas(int id)
		{
			List<Apuesta> user = new List<Apuesta>();
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "SELECT * FROM Apuesta WHERE idUser = @pid";
				user = db.Query<Apuesta>(sql, new { pid = id }).ToList();
			}
			return user;
		}
		public static Match ObtenerPartido(int id)
		{
			Match match = new Match();
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "SELECT * FROM Match WHERE id = @pid";
				match = db.QueryFirstOrDefault<Match>(sql, new { pid = id });
			}
			return match;
		}
		public static List<Country> ObtenerPaisesPartido(int id)
		{
			Match match = new Match();
			List<Country> paises = new List<Country>();
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "SELECT * FROM Match WHERE id = @pid";
				match = db.QueryFirstOrDefault<Match>(sql, new { pid = id });

				sql = "SELECT * FROM Country WHERE id = @id OR id = @id2";
				paises = db.Query<Country>(sql, new { id = match.idRival1,id2 = match.idRival2 }).ToList();
			}
			return paises;
		}
		public static void Apostar(int idPartido, int idUsuario,int winner)
		{
			using (SqlConnection db = new SqlConnection(ConnectionString))
			{
				string sql = "INSERT INTO Apuesta (idUser,idMatch,winner) VALUES (@idusuario,@idmatch,@pwinner)";
				db.Execute(sql, new { idusuario = idUsuario,idmatch = idPartido, pwinner = winner });
			}
		}
	}
}

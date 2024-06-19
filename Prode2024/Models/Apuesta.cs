namespace Prode2024.Models
{
	public class Apuesta
	{
		public int Id { get; set; }
		public int IdUser { get; set; }
		public int IdMatch { get; set; }
		public int Winner { get; set; }

		public Apuesta() { }

		public Apuesta(int id, int iduser, int idmatch, int idwinner)
		{
			Id = id;
			IdUser = iduser;
			IdMatch = idmatch;
			Winner = idwinner;
		}
	}
}

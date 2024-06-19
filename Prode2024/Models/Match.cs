namespace Prode2024.Models
{
	public class Match
	{
		public int id { get; set; }
		public int idRival1 { get; set; }
		public int idRival2 { get; set; }
		public DateTime date { get;}

		public Match() { }
		public Match(int Id, int rival1, int rival2, DateTime Date)
		{
			id = Id;
			idRival1 = rival1;
			idRival2 = rival2;
			date = Date;
		}
	}
}

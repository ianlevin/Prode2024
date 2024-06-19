namespace Prode2024.Models
{
	public class Country
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public string Image { get; set; }

		public Country(int id,string name,string image)
		{
			Id = id;
			Name = name;
			Image = image;
		}
	}
}

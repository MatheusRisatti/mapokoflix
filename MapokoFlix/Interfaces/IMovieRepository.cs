using MapokoFlix.Models;

namespace MapokoFlix.Interfaces;

public interface IMovieRepository : IRepository<Movie>
{
    List<Movie> ReadAllDetailed();

    Movie ReadByIdDetailed(int id);
}

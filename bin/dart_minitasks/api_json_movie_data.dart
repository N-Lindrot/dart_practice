import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  String jsonData=jsonDataFunction(); // jsondata are stored in String jsonData using jsonDataFunction below.

var decodeData = jsonDecode(jsonData) as Map<String, dynamic>;
final moviesData = decodeData['movies'] as List;

// print(moviesData);
// Create a List<Movie>
List<Movie> movies = [];
for (var movieData in moviesData) {
  final movie = Movie (
  movieData['title'],
  movieData['year'],
  movieData['genre'],
  movieData['rating'],
  movieData['director'],
  List<String>.from(movieData['actors']),
  );
  movies.add(movie);
}

print("Enter a movie title to search for:");
String searchTerm = stdin.readLineSync()!.toLowerCase();

List<Movie> matchingMovies = [];
for (var movie in movies) {
  if (movie.title.toLowerCase().contains(searchTerm)) {
    matchingMovies.add(movie);
  }
}

if (matchingMovies.isNotEmpty) {
  print("Matching movies:");
  for (var movie in matchingMovies) {
    print(movie); // if class Movie did not return string toString, can use the line below to print movie
    // CAN ALCO USE print("Title: ${movie.title}, Year: ${movie.year}, Genre: ${movie.genre}, Rating: ${movie.rating}");
  }
} else {
  print("No movies found matching '$searchTerm'");
}

}

class Movie {
  String title;
  int year;
  String genre;
  double rating;
  String director;
  List<String> actors;

  Movie(this.title, this.year, this.genre, this.rating, this.director, this.actors);

  @override
  String toString() {
    return 'Title: $title, Year: $year, Genre: $genre, Rating: $rating, Director: $director, Actors: $actors';
  }

  // CAN ALSO USE A DIFFERENT WAY TO RETURN VALUE, USING A DIFFERENT CONSTRUCTOR
  printDetails(String format) {
    switch(format) {
      case 'title':
      print(title);
      case 'year':
      print(year);
      case 'genre':
      print(genre);
      case 'director':
      print(director);
      case 'actors':
      print(actors);
    }
  }

}



// jsonData of movies are seperated here so it doesnt take too much space upfront
jsonDataFunction() {
  const jsonData = '''
{
  "movies": [
    {
      "title": "The Shawshank Redemption",
      "year": 1994,
      "genre": "Drama",
      "rating": 9.3,
      "director": "Frank Darabont",
      "actors": ["Tim Robbins", "Morgan Freeman", "Bob Gunton"]
    },
    {
      "title": "The Godfather",
      "year": 1972,
      "genre": "Crime, Drama",
      "rating": 9.2,
      "director": "Francis Ford Coppola",
      "actors": ["Marlon Brando", "Al Pacino", "James Caan"]
    },
    {
      "title": "The Dark Knight",
      "year": 2008,
      "genre": "Action, Crime, Drama",
      "rating": 9.0,
      "director": "Christopher Nolan",
      "actors": ["Christian Bale", "Heath Ledger", "Aaron Eckhart"]
    },
    {
      "title": "Pulp Fiction",
      "year": 1994,
      "genre": "Crime, Drama",
      "rating": 8.9,
      "director": "Quentin Tarantino",
      "actors": ["John Travolta", "Samuel L. Jackson", "Uma Thurman"]
    },
    {
      "title": "12 Angry Men",
      "year": 1957,
      "genre": "Drama",
      "rating": 9.0,
      "director": "Sidney Lumet",
      "actors": ["Henry Fonda", "Lee J. Cobb", "Martin Balsam"]
    },
    {
      "title": "The Lord of the Rings: The Return of the King",
      "year": 2003,
      "genre": "Adventure, Drama, Fantasy",
      "rating": 9.0,
      "director": "Peter Jackson",
      "actors": ["Elijah Wood", "Viggo Mortensen", "Ian McKellen"]
    },
    {
      "title": "Inception",
      "year": 2010,
      "genre": "Action, Sci-Fi, Thriller",
      "rating": 8.8,
      "director": "Christopher Nolan",
      "actors": ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Ellen Page"]
    },
    {
      "title": "Fight Club",
      "year": 1999,
      "genre": "Drama",
      "rating": 8.8,
      "director": "David Fincher",
      "actors": ["Brad Pitt", "Edward Norton", "Meat Loaf"]
    },
    {
      "title": "The Matrix",
      "year": 1999,
      "genre": "Action, Sci-Fi",
      "rating": 8.7,
      "director": "Lana Wachowski",
      "actors": ["Keanu Reeves", "Carrie-Anne Moss", "Laurence Fishburne"]
    },
    {
      "title": "Schindler's List",
      "year": 1993,
      "genre": "Biography, Drama, History",
      "rating": 8.9,
      "director": "Steven Spielberg",
      "actors": ["Liam Neeson", "Ben Kingsley", "Ralph Fiennes"]
    },
    {
      "title": "Spirited Away",
      "year": 2001,
      "genre": "Animation, Adventure, Family",
      "rating": 8.6,
      "director": "Hayao Miyazaki",
      "actors": ["Rumi Hiiragi", "Miyu Irino", "Mari Natsuki"]
    },
    {
      "title": "The Silence of the Lambs",
      "year": 1991,
      "genre": "Crime, Drama, Thriller",
      "rating": 8.6,
      "director": "Jonathan Demme",
      "actors": ["Jodie Foster", "Anthony Hopkins", "Scott Glenn"]
    },
    {
      "title": "Forrest Gump",
      "year": 1994,
      "genre": "Comedy, Drama, Romance",
      "rating": 8.8,
      "director": "Robert Zemeckis",
      "actors": ["Tom Hanks", "Robin Wright", "Gary Sinise"]
    },
    {
      "title": "Goodfellas",
      "year": 1990,
      "genre": "Biography, Crime, Drama",
      "rating": 8.7,
      "director": "Martin Scorsese",
      "actors": ["Robert De Niro", "Ray Liotta", "Joe Pesci"]
    },
    {
      "title": "The Green Mile",
      "year": 1999,
      "genre": "Crime, Drama, Fantasy",
      "rating": 8.6,
      "director": "Frank Darabont",
      "actors": ["Tom Hanks", "Michael Clarke Duncan", "David Morse"]
    },
    {
      "title": "Se7en",
      "year": 1995,
      "genre": "Crime, Drama, Thriller",
      "rating": 8.6,
      "director": "David Fincher",
      "actors": ["Morgan Freeman", "Brad Pitt", "Kevin Spacey"]
    },
    {
      "title": "Life Is Beautiful",
      "year": 1997,
      "genre": "Comedy, Drama, War",
      "rating": 8.6,
      "director": "Roberto Benigni",
      "actors": ["Roberto Benigni", "Nicoletta Braschi", "Giorgio Cantarini"]
    },
    {
      "title": "Parasite",
      "year": 2019,
      "genre": "Comedy, Drama, Thriller",
      "rating": 8.6,
      "director": "Bong Joon-ho",
      "actors": ["Song Kang-ho", "Lee Sun-kyun", "Choi Woo-shik"]
    },
    {
      "title": "The Lion King",
      "year": 1994,
      "genre": "Animation, Adventure, Drama",
      "rating": 8.5,
      "director": "Roger Allers",
      "actors": ["Matthew Broderick", "James Earl Jones", "Jeremy Irons"]
    },
    {
      "title": "Avengers: Endgame",
      "year": 2019,
      "genre": "Action, Adventure, Sci-Fi",
      "rating": 8.4,
      "director": "Anthony Russo",
      "actors": ["Robert Downey Jr.", "Chris Evans", "Mark Ruffalo"]
    }
  ]
}
''';
return jsonData;
}

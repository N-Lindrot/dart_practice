/* THIS CONTINUE THE api_json_movie_data program AND INRODUCE A DIFFERENT FUNCTION
IT WILL BE A QUIZZ

first making a list out of movies title and generate one movie title
ask other information about that movie
check if the answer is correct, if correct mark correct +1
if not correct mark wrong +1
pick next movie title and ask random question about it
*/

import 'dart:convert';
import 'dart:io';
import 'dart:math';

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

  // SETTING UP A LIST OF MOVIES AND A LIST OF RELEASE YEARS
  List<String> movieTitles = movies.map((movie) => movie.title).toList();
  List<String> movieDirectors = movies.map((movie) => movie.director).toList();

  print("Welcome to test your knowledge of movies");
  print("Answer by pressing entering y/n");
  
  // setting up counter
  var correctAnswer = 0;
  var wrongAnswer = 0;


  while (movieTitles.isNotEmpty) {
    Random random = Random();
    final randomIndex = random.nextInt(movieTitles.length);
    String selectedMovieTitle = movieTitles[randomIndex]; // GENERATING RANDOM MOVIE FROM THE MOVIELIST

    // FIND THE MOVIE THAT MATCH RANDOMLY SELECTEDMOVIE AND HOLE ITS VALUES
    Movie selectedMovie = movies.firstWhere((movie) => movie.title == selectedMovieTitle);


    String randomDirector = movieDirectors[randomIndex];

    print('Is this movie: ${selectedMovie.title} directed by $randomDirector');

    var answer = stdin.readLineSync()!.toLowerCase();
    bool answerBool;
    
    if (answer == 'y' || answer == 'yes' || answer == 'yea' || answer == 'yeah') {
      answerBool = true;
    } else if (answer == 'n' || answer == 'no' || answer == 'nah' || answer == 'naah') {
      answerBool = false;
    } else {
      print('Please answer with y/n or yes/no.');
      continue;
    }

    if (answerBool) {
      correctAnswer++;
      print('Correct!');
    } else {
      wrongAnswer++;
      print('Wrong answer! The ${selectedMovie.title} is released in ${selectedMovie.director}');
    }

    print('You have answerd correctly $correctAnswer times');
    print('You have answerd wrong $wrongAnswer times');
    
    print('Do you want to continue? (y/n)');
    var continueAnswer = stdin.readLineSync()!.toLowerCase();
    if (continueAnswer != 'y') {
      break;
    }
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
    },
    {
      "title": "Interstellar",
      "year": 2014,
      "genre": "Adventure, Drama, Sci-Fi",
      "rating": 8.6,
      "director": "Christopher Nolan",
      "actors": ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain"]
    },
    {
      "title": "The Usual Suspects",
      "year": 1995,
      "genre": "Crime, Drama, Mystery",
      "rating": 8.5,
      "director": "Bryan Singer",
      "actors": ["Kevin Spacey", "Gabriel Byrne", "Chazz Palminteri"]
    },
    {
      "title": "Saving Private Ryan",
      "year": 1998,
      "genre": "Drama, War",
      "rating": 8.6,
      "director": "Steven Spielberg",
      "actors": ["Tom Hanks", "Matt Damon", "Tom Sizemore"]
    },
    {
      "title": "The Prestige",
      "year": 2006,
      "genre": "Drama, Mystery, Sci-Fi",
      "rating": 8.5,
      "director": "Christopher Nolan",
      "actors": ["Christian Bale", "Hugh Jackman", "Scarlett Johansson"]
    },
    {
      "title": "Gladiator",
      "year": 2000,
      "genre": "Action, Adventure, Drama",
      "rating": 8.5,
      "director": "Ridley Scott",
      "actors": ["Russell Crowe", "Joaquin Phoenix", "Connie Nielsen"]
    },
    {
      "title": "The Departed",
      "year": 2006,
      "genre": "Crime, Drama, Thriller",
      "rating": 8.5,
      "director": "Martin Scorsese",
      "actors": ["Leonardo DiCaprio", "Matt Damon", "Jack Nicholson"]
    },
    {
      "title": "Whiplash",
      "year": 2014,
      "genre": "Drama, Music",
      "rating": 8.5,
      "director": "Damien Chazelle",
      "actors": ["Miles Teller", "J.K. Simmons", "Paul Reiser"]
    },
    {
      "title": "The Intouchables",
      "year": 2011,
      "genre": "Biography, Comedy, Drama",
      "rating": 8.5,
      "director": "Olivier Nakache",
      "actors": ["François Cluzet", "Omar Sy", "Anne Le Ny"]
    },
    {
      "title": "The Pianist",
      "year": 2002,
      "genre": "Biography, Drama, Music",
      "rating": 8.5,
      "director": "Roman Polanski",
      "actors": ["Adrien Brody", "Thomas Kretschmann", "Frank Finlay"]
    },
    {
      "title": "American History X",
      "year": 1998,
      "genre": "Drama",
      "rating": 8.5,
      "director": "Tony Kaye",
      "actors": ["Edward Norton", "Edward Furlong", "Beverly D'Angelo"]
    }
  ]
}
''';
return jsonData;
}

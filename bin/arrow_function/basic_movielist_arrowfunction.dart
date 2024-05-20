void main(List<String> args) {
  List<Movie> movies = [
    Movie(title: 'Inception', director: 'Christopher Nolan', year: 2010),
    Movie(title: 'The Matrix', director: 'Lana Wachowski', year: 1999),
    Movie(title: 'Interstellar', director: 'Christopher Nolan', year: 2014),
    Movie(title: 'Fight Club', director: 'David Fincher', year: 1999),
    Movie(title: 'The Social Network', director: 'David Fincher', year: 2010),
    Movie(title: 'The Lord of the Rings: The Fellowship of the Ring', director: 'Peter Jackson', year: 2001),
    Movie(title: 'The Lord of the Rings: The Two Towers', director: 'Peter Jackson', year: 2002),
    Movie(title: 'The Lord of the Rings: The Return of the King', director: 'Peter Jackson', year: 2003),
    Movie(title: 'Avengers: Infinity War', director: 'Anthony Russo', year: 2018),
    Movie(title: 'Avengers: Endgame', director: 'Anthony Russo', year: 2019),
    Movie(title: 'The Dark Knight Rises', director: 'Christopher Nolan', year: 2012),
    Movie(title: 'The Prestige', director: 'Christopher Nolan', year: 2006),
    Movie(title: 'Memento', director: 'Christopher Nolan', year: 2000),
    Movie(title: 'Shutter Island', director: 'Martin Scorsese', year: 2010),
    Movie(title: 'The Departed', director: 'Martin Scorsese', year: 2006),
    Movie(title: 'Goodfellas', director: 'Martin Scorsese', year: 1990),
    Movie(title: 'The Wolf of Wall Street', director: 'Martin Scorsese', year: 2013),
    Movie(title: 'Gladiator', director: 'Ridley Scott', year: 2000),
    Movie(title: 'The Silence of the Lambs', director: 'Jonathan Demme', year: 1991),
    Movie(title: 'Braveheart', director: 'Mel Gibson', year: 1995),
    Movie(title: 'Saving Private Ryan', director: 'Steven Spielberg', year: 1998),
    Movie(title: 'Schindler\'s List', director: 'Steven Spielberg', year: 1993),
    Movie(title: 'Jurassic Park', director: 'Steven Spielberg', year: 1993),
    Movie(title: 'American Psycho', director: 'Mary Harron', year: 2000),
    Movie(title: 'The Sixth Sense', director: 'M. Night Shyamalan', year: 1999)
  ];

  List<Movie> nolanMovies = movies.where((movie) => movie.director == 'Christopher Nolan').toList();

  // nolanMovies.forEach((movie) => print(movie.title));
  // INSTEAD OF ARROW FUNCTION, CAN ALSO USE FOR LOOPS THE CLASSIC WAY
  print('The following movies are directed by Christopher Nolan');
  for (var i = 0; i<nolanMovies.length; i++) {
    var movieTitle = nolanMovies[i].title;
    var releaseYear = nolanMovies[i].year;
    print('Title: $movieTitle, released: $releaseYear');
  }

  // USINF ARROW FUNCTION TO SHORTEN THE CODE AND PRINT MOVIES RELEASED AFTER YEAR 2005
  List<Movie> printYear = movies.where((movie) => movie.year >= 2005).toList();
  print('The following movies are released after 2005');
  printYear.forEach((movie) => print('${movie.title} : ${movie.year}'));
}

class Movie {
  String title;
  String director;
  int year;

  Movie({required  this.title, required this.director, required this.year});
}
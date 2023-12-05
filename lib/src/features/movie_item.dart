class MovieItem {
  MovieItem(this.id, this.title, this.description, this.year, this.duration,
      this.genre, this.imdbRating, this.coverAsset);

  final int id;
  final String title;
  final String description;
  final int year;
  final Duration duration;
  final String genre;
  final double imdbRating;
  final String coverAsset;
}

// map movie id with my review list
Map<int, List<String>> myReview = {
  1: [],
  2: [],
  3: [],
  4: [],
  5: [],
  6: [],
  7: [],
  8: [],
  9: [],
  10: [],
  11: [],
  12: [],
};

List<MovieItem> movieItems = [
  MovieItem(
      1,
      'Oppenheimer',
      'The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.',
      2023,
      const Duration(hours: 3),
      'Biography, Drama, History',
      8.5,
      'assets/images/oppenheimer.jpeg'),
  MovieItem(
      2,
      'Tenet',
      'Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.',
      2020,
      const Duration(hours: 2, minutes: 30),
      'Action, Sci-Fi, Thriller',
      7.3,
      'assets/images/tenet.jpg'),
  MovieItem(
      3,
      'Dunkirk',
      'Allied soldiers from Belgium, the British Commonwealth and Empire, and France are surrounded by the German Army and evacuated during a fierce battle in World War II.',
      2017,
      const Duration(hours: 1, minutes: 46),
      'Action, Drama, History',
      7.8,
      'assets/images/dunkirk.jpeg'),
  MovieItem(
      4,
      'Interstellar',
      'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.',
      2014,
      const Duration(hours: 2, minutes: 49),
      'Adventure, Drama, Sci-Fi',
      8.7,
      'assets/images/interstellar.jpg'),
  MovieItem(
      5,
      'The Dark Knight Rises',
      'Eight years after the Joker\'s reign of chaos, Batman is coerced out of exile with the assistance of the mysterious Selina Kyle in order to defend Gotham City from the vicious guerrilla terrorist Bane.',
      2012,
      const Duration(hours: 2, minutes: 44),
      'Action, Drama, Thriller',
      8.4,
      'assets/images/the-dark-knight-rises.jpg'),
  MovieItem(
      6,
      'Inception',
      'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.',
      2010,
      const Duration(hours: 2, minutes: 28),
      'Action, Adventure, Sci-Fi',
      8.8,
      'assets/images/inception.jpeg'),
  MovieItem(
      7,
      'The Dark Knight',
      'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      2008,
      const Duration(hours: 2, minutes: 32),
      'Action, Crime, Drama',
      9.0,
      'assets/images/the-dark-knight.jpg'),
  MovieItem(
      8,
      'The Prestige',
      'After a tragic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.',
      2006,
      const Duration(hours: 2, minutes: 10),
      'Drama, Mystery, Sci-Fi',
      8.5,
      'assets/images/the-prestige.jpg'),
  MovieItem(
      9,
      'Batman Begins',
      'After witnessing his parents\' death, Bruce learns the art of fighting to confront injustice. When he returns to Gotham as Batman, he must stop a secret society that intends to destroy the city.',
      2005,
      const Duration(hours: 2, minutes: 20),
      'Action, Crime, Drama',
      8.2,
      'assets/images/batman-begins.jpg'),
  MovieItem(
      10,
      'Insomnia',
      'Two Los Angeles homicide detectives are dispatched to a northern town where the sun doesn\'t set to investigate the methodical murder of a local teen.',
      2002,
      const Duration(hours: 1, minutes: 58),
      'Drama, Mystery, Thriller',
      7.2,
      'assets/images/insomnia.jpg'),
  MovieItem(
      11,
      'Memento',
      'A man with short-term memory loss attempts to track down his wife\'s murderer.',
      2000,
      const Duration(hours: 1, minutes: 53),
      'Mystery, Thriller',
      8.4,
      'assets/images/memento.jpeg'),
  MovieItem(
      12,
      'Following',
      'A young writer who follows strangers for material meets a thief who takes him under his wing.',
      1998,
      const Duration(hours: 1, minutes: 9),
      'Crime, Mystery, Thriller',
      7.5,
      'assets/images/following.jpg'),
];

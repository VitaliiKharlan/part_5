import 'package:flutter/material.dart';
import 'package:flutter_lessons_lesson_39/images.dart';
import 'package:google_fonts/google_fonts.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: AppImages.gameOfThrones.assetName,
      title: 'Game Of Thrones',
      time: 'April 18, 2011',
      description:
          'Game of Thrones is an American fantasy drama television series '
          'created by David Benioff and D. B. Weiss for HBO',
    ),
    Movie(
      imageName: AppImages.gameOfThrones.assetName,
      title: 'Band Of Brothers',
      time: 'April 18, 2011',
      description:
          'Game of Thrones is an American fantasy drama television series '
          'created by David Benioff and D. B. Weiss for HBO',
    ),
    Movie(
      imageName: AppImages.gameOfThrones.assetName,
      title: 'The Godfather',
      time: 'April 18, 2011',
      description:
          'Game of Thrones is an American fantasy drama television series '
          'created by David Benioff and D. B. Weiss for HBO',
    ),
    Movie(
      imageName: AppImages.gameOfThrones.assetName,
      title: 'Titanic',
      time: 'April 18, 2011',
      description:
          'Game of Thrones is an American fantasy drama television series '
          'created by David Benioff and D. B. Weiss for HBO',
    ),
    Movie(
      imageName: AppImages.gameOfThrones.assetName,
      title: 'Shrek',
      time: 'April 18, 2011',
      description:
          'Game of Thrones is an American fantasy drama television series '
          'created by David Benioff and D. B. Weiss for HBO',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final searchQuery = _searchController.text;
    if (searchQuery.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 80),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          itemCount: _filteredMovies.length,
          itemExtent: 160,
          itemBuilder: (BuildContext context, int index) {
            final movieOne = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(4, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image.asset(
                          movieOne.imageName,
                          width: 100,
                          height: 160,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                movieOne.title,
                                style: GoogleFonts.robotoMono(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                movieOne.time,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                movieOne.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

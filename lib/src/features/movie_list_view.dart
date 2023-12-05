import 'package:flutter/material.dart';

import 'movie_item.dart';
import 'movie_details_view.dart';

class MovieListView extends StatefulWidget {
  const MovieListView(
      {super.key, required this.gridCount, required this.items});
  final int gridCount;
  final List<MovieItem> items;

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: widget.gridCount,
      crossAxisSpacing: 8,
      mainAxisSpacing: 16,
      childAspectRatio: 0.75,
      children: widget.items.map((item) {
        return Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              //  Gambar Cover
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Image.asset(
                  item.coverAsset,
                  fit: BoxFit.cover,
                ),
              ),
              //  Title
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    ('${item.title} (${item.year})'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Rating
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellow,
                          ),
                        ),
                        TextSpan(
                            text: item.imdbRating.toString(),
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MovieDetailsView(item: item);
                    }));
                  },
                  splashColor: Colors.white.withOpacity(0.3),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

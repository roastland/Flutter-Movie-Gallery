import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'movie_item.dart';

class DetailMobilePage extends StatefulWidget {
  const DetailMobilePage({super.key, required this.item, this.review});
  final MovieItem item;
  final Map<int, List<String>>? review;

  @override
  State<DetailMobilePage> createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gambar Cover
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.asset(widget.item.coverAsset,
                        fit: BoxFit.cover))),
          ),
          // Title
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              widget.item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Details Icon
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Released Year
                Column(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.item.year.toString(),
                    ),
                  ],
                ),
                // Duration
                Column(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(height: 8.0),
                    Text(
                      ('${widget.item.duration.inHours}h ${widget.item.duration.inMinutes - (60 * widget.item.duration.inHours)}m'),
                    ),
                  ],
                ),
                // Genre
                Column(
                  children: [
                    const Icon(Icons.category),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.item.genre,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Rating
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Wrap(
                children: [
                  RatingBarIndicator(
                    rating: widget.item.imdbRating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 10,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  Text("(${widget.item.imdbRating})"),
                ],
              ),
            ),
          ),
          // Desc
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.item.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          // My Review List
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'My Review',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: (widget.review![widget.item.id] != null)
                ? ListView.builder(
                    itemCount: widget.review![widget.item.id]!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                          key: Key(widget.review![widget.item.id]![index]),
                          child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              title:
                                  Text(widget.review![widget.item.id]![index]),
                              trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      widget.review![widget.item.id]!
                                          .removeAt(index);
                                    });
                                  }),
                            ),
                          ));
                    })
                : Container(),
          ),
        ],
      ),
    );
  }
}

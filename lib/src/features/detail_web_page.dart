import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'movie_item.dart';

class DetailWebPage extends StatefulWidget {
  const DetailWebPage({super.key, required this.item, this.review});
  final MovieItem item;
  final Map<int, List<String>>? review;

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width <= 1200 ? 800 : 1200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar Cover
                    Flexible(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: Image.asset(widget.item.coverAsset,
                                  fit: BoxFit.contain))),
                    ),
                    const SizedBox(width: 32),
                    // Details Card
                    Flexible(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // Title
                              Text(
                                widget.item.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Released Year
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      widget.item.year.toString(),
                                    ),
                                  ],
                                ),
                              ),
                              // Duration
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.access_time),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      ('${widget.item.duration.inHours}h ${widget.item.duration.inMinutes - (60 * widget.item.duration.inHours)}m'),
                                    ),
                                  ],
                                ),
                              ),
                              // Genre
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.category),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      widget.item.genre,
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
                                        itemBuilder: (context, index) =>
                                            const Icon(
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  widget.item.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
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
                                key:
                                    Key(widget.review![widget.item.id]![index]),
                                child: Card(
                                  elevation: 4,
                                  margin: const EdgeInsets.all(8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ListTile(
                                    title: Text(
                                        widget.review![widget.item.id]![index]),
                                    trailing: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
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
          ),
        ),
      ),
    );
  }
}

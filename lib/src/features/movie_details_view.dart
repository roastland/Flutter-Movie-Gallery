import 'package:flutter/material.dart';

import 'detail_mobile_page.dart';
import 'detail_web_page.dart';
import 'movie_item.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, this.item});
  final MovieItem? item;

  static const routeName = '/movie_item';

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  String input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      // Add Review Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: const Text(
                    'Add My Review',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            myReview[widget.item!.id]!.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add_comment,
        ),
      ),
      // Responsive Details View
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 800) {
            return DetailMobilePage(item: widget.item!, review: myReview);
          } else {
            return DetailWebPage(item: widget.item!, review: myReview);
          }
        },
      ),
    );
  }
}

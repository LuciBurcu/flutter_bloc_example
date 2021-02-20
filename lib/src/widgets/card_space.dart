import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class CardSpace extends StatelessWidget {
  const CardSpace(
      {Key key, @required this.imageUrl, @required this.title, @required this.summary, @required this.publishedAt})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String summary;
  final String publishedAt;

  Widget _mobileCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Image.network(imageUrl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(summary),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(publishedAt),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _webCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Image.network(imageUrl),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(summary),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(publishedAt),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? _webCard() : _mobileCard();
  }
}

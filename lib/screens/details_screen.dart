import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/casting_cards.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards()
            ],
          ),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text('movie.originalTitle',
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.bodySmall,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        "Aliquip deserunt aliqua magna sunt mollit voluptate aliquip est sit ut aliqua.Ullamco anim nisi reprehenderit Lorem deserunt incididunt sit.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;

  final VoidCallback? loadNextPage;
  const MovieHorizontalListView(
      {super.key, required this.movies, this.title, this.subTitle, this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if ( title != null || subTitle != null )
            _Title( title: title, subTitle: subTitle, ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  
  final String? title;
  final String? subTitle;
  
  const _Title({
    super.key, this.title, this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only( top: 10 ),
      margin: const EdgeInsets.symmetric( horizontal:  10 ),
      child: Row(
        children: [
          if ( title != null )
            Text(
              title!,
              style: titleStyle
            ),
          const Spacer(),
          if ( subTitle != null )
            FilledButton.tonal(
              onPressed: () {
                
              },
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact
              ) , 
              child: Text( subTitle! ),
            )
        ],
      ),
    );
  }
}

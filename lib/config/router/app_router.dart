import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state){
        int page = int.parse(  state.pathParameters['page'] ?? '0' );;
        if ( page > 2 || page < 0 ) {
          page = 0;
        }
        return HomeScreen( pageIndex: page );
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'not-id';
            return MovieScreen( movieId: movieId, );
          },
        ),
      ]
    ),
    GoRoute(
      path: '/',
      redirect: ( _, __ ) => '/home/0',
    )
  ],
);
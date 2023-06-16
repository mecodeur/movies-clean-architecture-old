import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../../../core/utils/service_locator.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('01 - Movies Bloc Hash Code ====== ${sl<MoviesBloc>().hashCode}');

    return BlocProvider(
      //create: (context) => MoviesBloc(GetNowPlayingMoviesUseCase(sl.get<MoviesRepository>()))..add(GetNowPlayingMoviesEvent()),
      //create: (context) => MoviesBloc(sl.get<GetNowPlayingMoviesUseCase>())..add(GetNowPlayingMoviesEvent()),
      create: (context) =>
          sl.get<MoviesBloc>()..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}

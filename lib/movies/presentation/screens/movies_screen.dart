import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_clean_architecture/movies/presentation/controller/movies_bloc/movies_bloc.dart';

import '../../../core/utils/service_locator.dart';
import '../../data/repository/movies_repository.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print('1 - Movies Repository Hash Code ====== ${sl<MoviesRepository>().hashCode}');

    return BlocProvider(
      create: (context) => MoviesBloc(GetNowPlayingMoviesUseCase(sl.get<MoviesRepository>()))..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}

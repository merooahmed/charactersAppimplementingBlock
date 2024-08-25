import 'package:breakingbadproject/businesslogic/cubit/characters_cubit.dart';
import 'package:breakingbadproject/data/repositories/character_repository.dart';
import 'package:breakingbadproject/data/web_services.dart';
import 'package:breakingbadproject/representation/screens/characteres_screen.dart';
import 'package:breakingbadproject/representation/screens/characters_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';

class AppRouter {
   late CharactersRepo charactersRepo; ///////////??
 late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepo = CharactersRepo(ApiService());
    charactersCubit = CharactersCubit(charactersRepo);
  }
   Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstscreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      charactersCubit,
                  child: const CharactersScreen(),
                ));
      case secondscreen:
        return MaterialPageRoute(
            builder: (_) => const CharacteresdetailsScreen());
    }
    return null;
  }
}

import 'package:bloc/bloc.dart';
import 'package:breakingbadproject/data/models/charactersmodel.dart';
import 'package:breakingbadproject/data/repositories/character_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
   List<CharactersModel> characters=[];
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());

  List<CharactersModel> getAllCharacters() {
    charactersRepo.getCharacters().then((characters) {
      
      emit(AllCharactersLoaded(characters));//////////////////??
      this.characters = characters;
    });
    return characters;
  }
}

part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

final class CharactersInitial extends CharactersState {}
class AllCharactersLoaded extends CharactersState {
  final List<CharactersModel> characters;

  AllCharactersLoaded(this.characters);
}
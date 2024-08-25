import 'package:breakingbadproject/data/models/charactersmodel.dart';
import 'package:breakingbadproject/data/web_services.dart';

class CharactersRepo {
  final ApiService _apiService;
  CharactersRepo(this._apiService);
  Future<List<CharactersModel>> getCharacters() async {
    try {
      final characters = await _apiService.getCharacters();
      return characters.map((character) =>CharactersModel.fromJson(character) ).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

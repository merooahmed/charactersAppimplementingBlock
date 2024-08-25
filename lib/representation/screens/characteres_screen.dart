import 'package:breakingbadproject/businesslogic/cubit/characters_cubit.dart';
import 'package:breakingbadproject/constants/colors.dart';
import 'package:breakingbadproject/constants/strings.dart';
import 'package:breakingbadproject/data/models/charactersmodel.dart';
import 'package:breakingbadproject/representation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharactersModel> charactersList;
  late List<CharactersModel> charactersSearchedList;
  bool isSearching = false;
  final searchTextController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
        controller: searchTextController,
        cursorColor: grey,
        decoration: const InputDecoration(
          hintText: 'Find your character.....',
          border: InputBorder.none,
          hintStyle: TextStyle(color: grey, fontSize: 18),
        ),
        style: const TextStyle(color: grey, fontSize: 18),
        onChanged: (charactersearchText) {
          filterSearchedList(charactersearchText);
        });
  }

  void filterSearchedList(String charactersearchText) {
    charactersSearchedList = charactersList
        .where((character) =>
            character.name.toLowerCase().startsWith(charactersearchText))
        .toList();
    setState(() {});
  }

  List<Widget> buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: grey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: startSearch,
            icon: const Icon(
              Icons.search,
              color: grey,
            ))
      ];
    }
  }

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: stopSearch,
      ),
    );
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is AllCharactersLoaded) {
        charactersList = state.characters;
        return buildLoadedListWidget();
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: grey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            childAspectRatio: 3 / 2),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: searchTextController.text.isEmpty
            ? charactersList.length
            : charactersSearchedList.length,
        itemBuilder: (context, index) {
          return CharacterItem(
            character: searchTextController.text.isEmpty
                ? charactersList[index]
                : charactersSearchedList[index],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        title: isSearching
            ? buildSearchField()
            : const Text(
                'Characters',
                style: TextStyle(color: grey),
              ),
        leading: isSearching
            ? const BackButton(
                color: grey,
              )
            : Container(),
        actions: buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}

import 'package:breakingbadproject/constants/colors.dart';
import 'package:breakingbadproject/data/models/charactersmodel.dart';
import 'package:flutter/material.dart';

class CharacteresdetailsScreen extends StatelessWidget {
  const CharacteresdetailsScreen({super.key, required this.character});
  final CharactersModel character;

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: grey,
      flexibleSpace: FlexibleSpaceBar(
        
        centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(color: Colors.white),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: yellow,
      height: 40,
      thickness: 3,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        characterInfo(
                          'Status: ',
                          character.status,
                        ),
                        buildDivider(690),
                        characterInfo(
                          'gender: ',
                          character.gender,
                        ),
                        buildDivider(685),
                        characterInfo(
                          'location: ',
                          character.location.name,
                        ),
                        buildDivider(680),
                        characterInfo(
                          'episodes: ',
                          character.episode.join(' / '),
                        ),
                        buildDivider(650),
                        const SizedBox(
                          height: 20,
                        )
                      ]),
                ),
                const SizedBox(
                  height: 900,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

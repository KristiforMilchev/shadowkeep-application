import 'package:application/implementations/mocks/mock_chapter_service.dart';
import 'package:domain/models/chapter.dart';
import 'package:domain/models/character.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';

class MockCharacterService extends MockChapterService
    implements ICharacterService {
  List<Character> _characters = [
    Character(
      id: 1,
      bookId: 1,
      firstName: "Steve",
      lastName: "Osmar",
      gender: true,
      age: 22,
      description:
          "Steve is a smart bloke, he likes to dabble into technology.",
    ),
    Character(
      id: 2,
      bookId: 1,
      firstName: "Penny",
      lastName: "Osmar",
      gender: false,
      age: 19,
      description:
          "Penny is pretty although not the brightest bulb in the room.",
    ),
    Character(
      id: 3,
      bookId: 1,
      firstName: "Omini",
      lastName: "Komar",
      gender: true,
      age: 25,
      description:
          "Omini is an evil person that is really good at manipulating people, he dreams of seeing the world burn.",
    ),
  ];

  @override
  Future<bool> addCharacter(Character character) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _characters.add(character);
    return true;
  }

  @override
  Future<List<Chapter>> getMentions(int characterId) {
    return getChaptersIncludingCharacter([characterId]);
  }

  @override
  Future<List<Character>> getRelatedCharacters(int bookId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [_characters.first, _characters.elementAt(1)];
  }

  @override
  Future<bool> removeCharacter(int characterId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _characters.removeWhere((element) => element.id == characterId);

    return true;
  }
}

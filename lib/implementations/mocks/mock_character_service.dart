import 'package:application/implementations/mocks/mock_chapter_service.dart';
import 'package:domain/models/chapter.dart';
import 'package:domain/models/character.dart';
import 'package:infrastructure/interfaces/icharacter_service.dart';

class MockCharacterService extends MockChapterService
    implements ICharacterService {
  @override
  Future<bool> addCharacter(Character character) {
    // TODO: implement addCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<Chapter>> getMentions(int characterId) {
    // TODO: implement getMentions
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> getRelatedCharacters(int bookId) {
    // TODO: implement getRelatedCharacters
    throw UnimplementedError();
  }

  @override
  Future<bool> removeCharacter(int characterId) {
    // TODO: implement removeCharacter
    throw UnimplementedError();
  }
}

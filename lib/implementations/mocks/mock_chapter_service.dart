import 'package:application/implementations/mocks/mock_page_service.dart';
import 'package:domain/models/chapter.dart';
import 'package:domain/models/page.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';

class MockChapterService extends MockPageService implements IChapterService {
  @override
  Future<bool> addChapter(Chapter chapter) {
    // TODO: implement addChapter
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteChapter(Chapter chapter) {
    // TODO: implement deleteChapter
    throw UnimplementedError();
  }

  @override
  Future<bool> editChapter(Chapter chapter) {
    // TODO: implement editChapter
    throw UnimplementedError();
  }

  @override
  Future<Page> getPages(int chapterId) {
    // TODO: implement getChapterPages
    throw UnimplementedError();
  }

  @override
  Future<bool> setBookId(int bookId) {
    // TODO: implement setBookId
    throw UnimplementedError();
  }

  @override
  Future<List<Chapter>> getChaptersIncludingCharacter(List<int> characters) {
    // TODO: implement getChaptersIncludingCharacter
    throw UnimplementedError();
  }
}

import 'package:application/implementations/mocks/mock_page_service.dart';
import 'package:domain/models/chapter.dart';
import 'package:domain/models/page.dart';
import 'package:infrastructure/interfaces/ichapter_service.dart';

class MockChapterService extends MockPageService implements IChapterService {
  // ignore: unused_field
  int _book = 0;
  List<Chapter> _chapters = [
    Chapter(id: 1, bookId: 1, pageTitle: "Test", pages: []),
    Chapter(id: 2, bookId: 1, pageTitle: "test 2", pages: [], relatedTo: 1),
    Chapter(id: 2, bookId: 1, pageTitle: "test 2", pages: [], relatedTo: 2),
  ];

  @override
  Future<bool> addChapter(Chapter chapter) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _chapters.add(chapter);
    return true;
  }

  @override
  Future<bool> deleteChapter(Chapter chapter) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _chapters.removeWhere((element) => element.id == chapter.id);

    return true;
  }

  @override
  Future<bool> editChapter(Chapter chapter) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _chapters.removeWhere((element) => element.id == chapter.id);
    _chapters.add(chapter);
    return true;
  }

  @override
  Future<List<Page>> getPages(int chapterId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return getChapterPages(chapterId);
  }

  @override
  Future<bool> setBookId(int bookId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _book = bookId;

    return true;
  }

  @override
  Future<List<Chapter>> getChaptersIncludingCharacter(
      List<int> characters) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [];
  }

  @override
  Future<List<Chapter>> getAllChapters(int bookId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _chapters.where((element) => element.bookId == bookId).toList();
  }
}

import 'package:collection/collection.dart';
import 'package:domain/models/page.dart';
import 'package:infrastructure/interfaces/ipage_service.dart';

class MockPageService implements IPageService {
  int _bookId = 0;
  List<Page> _pages = [
    Page(id: 1, content: ["dwadwa"], bookId: 1, chapterId: 1),
    Page(id: 2, content: ["dwadwa"], bookId: 1, chapterId: 1),
    Page(id: 3, content: ["dwadwa"], bookId: 1, chapterId: 1),
    Page(id: 4, content: ["dwadwa"], bookId: 1, chapterId: 1),
    Page(id: 5, content: ["dwadwa"], bookId: 1, chapterId: 1),
    Page(id: 6, content: ["dwadwa"], bookId: 1, chapterId: 1),
    Page(id: 7, content: ["dwadwa"], bookId: 1, chapterId: 2),
    Page(id: 8, content: ["dwadwa"], bookId: 1, chapterId: 2),
    Page(id: 9, content: ["dwadwa"], bookId: 1, chapterId: 2),
    Page(id: 10, content: ["dwadwa"], bookId: 1, chapterId: 2),
    Page(id: 11, content: ["dwadwa"], bookId: 1, chapterId: 3),
  ];

  @override
  Future<bool> addPage(Page current) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _pages.add(current);
    return true;
  }

  @override
  Future<bool> deletePage(int pageId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    var page = _pages.firstWhereOrNull(
        (element) => element.id == pageId && element.bookId == _bookId);
    if (page == null) return false;

    _pages.remove(page);
    return true;
  }

  @override
  Future<bool> editPage(Page page) async {
    await deletePage(page.id);

    return addPage(page);
  }

  @override
  Future<List<Page>> getChapterPages(int chapterId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _pages
        .where((element) =>
            element.chapterId == chapterId && element.bookId == _bookId)
        .toList();
  }

  @override
  Future<Page> getPage(int pageId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return _pages.firstWhere((element) => element.id == pageId);
  }

  @override
  Future<bool> setBookId(int bookId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _bookId = bookId;
    return true;
  }
}

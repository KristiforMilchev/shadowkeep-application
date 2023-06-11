import 'package:domain/models/page.dart';
import 'package:infrastructure/interfaces/ipage_service.dart';

class MockPageService implements IPageService {
  @override
  Future<bool> addPage(Page current) {
    // TODO: implement addPage
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePage(int pageId) {
    // TODO: implement deletePage
    throw UnimplementedError();
  }

  @override
  Future<bool> editPage(int pageId) {
    // TODO: implement editPage
    throw UnimplementedError();
  }

  @override
  Future<List<Page>> getChapterPages(int chapterId) {
    // TODO: implement getChapterPages
    throw UnimplementedError();
  }

  @override
  Future<Page> getPage(int pageId) {
    // TODO: implement getPage
    throw UnimplementedError();
  }

  @override
  Future<bool> setBookId(int bookId) {
    // TODO: implement setBookId
    throw UnimplementedError();
  }
}

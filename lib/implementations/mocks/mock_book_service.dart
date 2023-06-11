import 'package:domain/models/book.dart';
import 'package:infrastructure/interfaces/ibook_service.dart';

class MockBookService implements IBookService {
  @override
  Future<bool> addBook(Book book) {
    // TODO: implement addBook
    throw UnimplementedError();
  }

  @override
  getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }

  @override
  Future<Book> openBook(int id) {
    // TODO: implement openBook
    throw UnimplementedError();
  }

  @override
  Future<bool> removeBook(int id) {
    // TODO: implement removeBook
    throw UnimplementedError();
  }
}

import 'package:collection/collection.dart';
import 'package:domain/models/book.dart';
import 'package:domain/models/user.dart';
import 'package:infrastructure/interfaces/ibook_service.dart';

class MockBookService implements IBookService {
  List<Book> _books = [
    Book(
      id: 1,
      title: "Fable Stories",
    ),
    Book(
      id: 2,
      title: "How did it happen?",
    ),
    Book(
      id: 3,
      title: "Is it any better",
    ),
  ];

  @override
  Future<bool> addBook(Book book) async {
    await Future.delayed(const Duration(milliseconds: 500));

    _books.add(book);
    return true;
  }

  @override
  Future<List<Book>> getBooks() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _books.toList();
  }

  @override
  Future<Book> openBook(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _books.firstWhere((element) => element.id == id);
  }

  @override
  Future<bool> removeBook(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var book = _books.firstWhereOrNull((element) => element.id == id);

    if (book == null) return false;

    return true;
  }

  User getAuthor() {
    return User(
      firstName: "J",
      lastName: "Martin",
      email: "martin@book.com",
      initials: "JJM",
    );
  }
}

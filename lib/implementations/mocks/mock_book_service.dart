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
    _books.add(book);
    return true;
  }

  @override
  Future<List<Book>> getBooks() async {
    return _books.toList();
  }

  @override
  Future<Book> openBook(int id) async {
    return _books.firstWhere((element) => element.id == id);
  }

  @override
  Future<bool> removeBook(int id) async {
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

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Book {
  String name;
  String author;
  Book({required this.name, required this.author});
}

// 1
class BookStateNotifier extends StateNotifier<List<Book>> {
  // 2
  BookStateNotifier() : super([]);

  // 3
  void addBook(Book bookToAdd) => state = [...state, bookToAdd];

  // 4
  void removeBook(Book booktoRemove) => state = [
        for (final book in state)
          if (book != booktoRemove) book,
      ];
}

// 5
final StateNotifierProvider<BookStateNotifier, List<Book>> booksProvider =
    StateNotifierProvider((ref) => BookStateNotifier());

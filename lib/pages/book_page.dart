import 'package:flutter/material.dart';
import 'package:http_example/models/book_model.dart';
import 'package:http_example/models/category_model.dart';
import 'package:http_example/repositories/repository.dart';

class BooksPage extends StatefulWidget {
  final Category category;

  const BooksPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Book> booksList = [];
  bool isLoading = true;
  final BooksRepository repository = BooksRepository();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      getDataAndUpdateUI();
    });
    super.initState();
  }

  void getDataAndUpdateUI() async {
    setState(() {
      isLoading = true;
    });
    final books = await repository.getBooks(widget.category);
    setState(() {
      booksList = books;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books from ${widget.category.displayName}')),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator.adaptive()),
        replacement: Visibility(
          visible: booksList.isEmpty,
          child: Center(
            child: ElevatedButton(
              child: Text('No Books, Try again?'),
              onPressed: () => getDataAndUpdateUI(),
            ),
          ),
          replacement: ListView.builder(
            itemCount: booksList.length,
            itemBuilder: (BuildContext context, int index) {
              final book = booksList.elementAt(index);
              return ListTile(
                title: Text(book.title),
                subtitle: Text('Author: ${book.author}'),
              );
            },
          ),
        ),
      ),
    );
  }
}

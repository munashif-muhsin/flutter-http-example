import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_example/models/book_model.dart';
import 'package:http_example/models/category_model.dart';

const baseUrl = 'https://api.nytimes.com/svc/books/v3/';
const categoriesUrl = 'lists/names';
const booksUrl = 'lists.json';
const apiKey = 'DtPXd80ya5sykKemLplpBziQaZaLhGiU';

class BooksRepository {
  var client = http.Client();

  /// Get List of [Category]
  Future<List<Category>> getCategories() async {
    // await Future.delayed(Duration(seconds: 1));
    final url = Uri.parse('$baseUrl$categoriesUrl?api-key=$apiKey');
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    return responseBody['results']
        .map<Category>((item) => Category.fromJson(item))
        .toList();
  }

  /// Get List of [Book] from a category
  Future<List<Book>> getBooks(Category category) async {
    final url = Uri.parse(
      '$baseUrl$booksUrl?api-key=$apiKey&list=${category.listNameEncoded}',
    );
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    final results = responseBody['results'];
    return results
        .map<Book>((item) => Book.fromJson(item['book_details'][0]))
        .toList();
  }
}

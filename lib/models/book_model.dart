class Book {
  Book({
    required this.title,
    required this.description,
    required this.contributor,
    required this.author,
    required this.contributorNote,
    required this.price,
    required this.ageGroup,
    required this.publisher,
    required this.primaryIsbn13,
    required this.primaryIsbn10,
  });

  final String title;
  final String description;
  final String contributor;
  final String author;
  final String contributorNote;
  final String price;
  final String ageGroup;
  final String publisher;
  final String primaryIsbn13;
  final String primaryIsbn10;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        description: json["description"],
        contributor: json["contributor"],
        author: json["author"],
        contributorNote: json["contributor_note"],
        price: json["price"],
        ageGroup: json["age_group"],
        publisher: json["publisher"],
        primaryIsbn13: json["primary_isbn13"],
        primaryIsbn10: json["primary_isbn10"],
      );
}

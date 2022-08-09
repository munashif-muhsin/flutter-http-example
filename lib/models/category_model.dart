class Category {
  Category({
    required this.listName,
    required this.displayName,
    required this.listNameEncoded,
    required this.oldestPublishedDate,
    required this.newestPublishedDate,
    required this.updated,
  });

  final String listName;
  final String displayName;
  final String listNameEncoded;
  final DateTime oldestPublishedDate;
  final DateTime newestPublishedDate;
  final String updated;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        listName: json["list_name"],
        displayName: json["display_name"],
        listNameEncoded: json["list_name_encoded"],
        oldestPublishedDate: DateTime.parse(json["oldest_published_date"]),
        newestPublishedDate: DateTime.parse(json["newest_published_date"]),
        updated: json["updated"],
      );
}

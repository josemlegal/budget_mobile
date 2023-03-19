class TransactionType {
  final String id;
  final String title;

  TransactionType({
    required this.id,
    required this.title,
  });

  factory TransactionType.fromJson(Map<String, dynamic> json) {
    return TransactionType(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }
}

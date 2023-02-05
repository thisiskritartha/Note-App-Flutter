class Note {
  String? id;
  String? email;
  String? title;
  String? content;
  DateTime? dateAdded;

  Note({this.id, this.email, this.title, this.content, this.dateAdded});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      email: json['email'],
      title: json['title'],
      content: json['content'],
      dateAdded: DateTime.tryParse(json['dateAdded']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['title'] = title;
    data['content'] = content;
    data['dateAdded'] = dateAdded!.toIso8601String();
    return data;
  }
}

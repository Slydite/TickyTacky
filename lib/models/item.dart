class Items {
  final String title;
  final String time;

  Items({required this.title, required this.time});

  Items.fromMap(Map map)
      : title = map['title'] as String,
        time = map['time'] as String;
  Map toMap() {
    return {
      'title': title,
      'time': time,
    };
  }
}

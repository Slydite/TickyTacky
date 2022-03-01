class Items {
  final String title;
  final String time;
  final String info;

  Items({required this.title, required this.time, required this.info});

  Items.fromMap(Map map)
      : title = map['title'] as String,
        time = map['time'] as String,
        info = map['info'] as String;
  Map toMap() {
    return {'title': title, 'time': time, 'info': info};
  }
}

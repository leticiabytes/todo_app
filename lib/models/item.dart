class Item {
  String title = '';
  bool done = false;

  Item({this.title = '', this.done = false});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['done'] = done;
    return data;
  }
}

class TodoNote {
  String uuid;
  bool isDone;
  String topic;
  String task;
  List<dynamic> tag;

  TodoNote({this.uuid, this.isDone, this.topic, this.task, this.tag});

  TodoNote.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    isDone = json['isDone'];
    topic = json['topic'];
    task = json['task'];
    tag = json['tag'].cast<dynamic>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['isDone'] = this.isDone;
    data['topic'] = this.topic;
    data['task'] = this.task;
    data['tag'] = this.tag;
    return data;
  }
}

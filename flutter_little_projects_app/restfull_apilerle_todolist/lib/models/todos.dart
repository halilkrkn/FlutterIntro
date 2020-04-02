class Todo {
  int id;
  int userId;
  bool completed;
  String title;

//*Constructer Bloğu oluşturuyoruzz.
  Todo(int id, int userId, bool completed, String title) {
    this.id = id;
    this.userId = userId;
    this.title = title;
    this.completed = completed;
  }

  //*Elimizdeki Apiyi oluşturduğumuz class haline çeviriyoruz.
  //*Json ın Todo Classına çevrilmesi;
  Todo.fromJson(Map json) {
    id = json['id'];
    userId = json["userId"];
    completed = json["completed"];
    title = json["title"];
  }

  //* Todo classının Jsona çevrilmesi;
  Map toJson() {
    return {"id": id, "userId": userId, 
    "completed": completed, "title": title};
  }
}

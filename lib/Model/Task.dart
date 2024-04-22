class Task {

  String title;
  String description;
  bool isDone;

  Task({required this.title, required this.description, this.isDone = false}); 

  Map<String,dynamic> toMap(){
    return {
      'title': title,
      'description': description,
      'isDone': isDone
    };
  } 

  
}
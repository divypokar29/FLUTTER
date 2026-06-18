class TodoModels {
  int? id;
  String? title;
  String? description;
  String? category;
  String? priority;
  String? status;
  String? duedate;
  String? createdAt;

  TodoModels({
    this.id,
    this.title,
    this.description,
    this.category,
    this.duedate,
    this.priority,
    this.status,
    this.createdAt,
  }); // contructructor creation

  // as we know that dart object does not read by sqflite database
  // so we have to convert dart object into map
  // to convert dart object into map we need to create one method

  /*
toMap : convert dart object into databse object (map formate)
frMap : convert back into databse object to dart object 
 */
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'description': description,
      'category': category,
      'duedate': duedate,
      'priority': priority,
      'status': status,
      'createdAt': createdAt,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  // now there are two contruct
  /* 
  normal constructor 
  factrory constructor : which is help to create data object from the database map data 

  */

  factory TodoModels.fromJson(Map<String, dynamic> map) {
    return TodoModels(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      duedate: map['duedate'],
      priority: map['priority'],
      status: map['status'],
      createdAt: map['createdAt'],
    );
  }
}

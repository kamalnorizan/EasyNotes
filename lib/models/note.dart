class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  set title(String newtitle) {
    if (newtitle.length <= 255) {
      this._title = newtitle;
    }
  }

  set description(String newdescription) {
    if (newdescription.length <= 255) {
      this._description = newdescription;
    }
  }

  set date(String newdate) {
    this._date = newdate;
  }

  set priority(int newpriority) {
    if (newpriority >= 1 && newpriority <= 2) {
      this._priority = newpriority;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = int.parse(map['id']);
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
    this._priority = int.parse(map['priority']);
  }
}

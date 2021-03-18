class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _prority;

  Note(this._title, this._date, this._prority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._prority,
      [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get prority => _prority;

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

  set prority(int newprority) {
    if (newprority >= 1 && newprority <= 2) {
      this._prority = newprority;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;
    map['prority'] = _prority;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = int.parse(map['id']);
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
    this._prority = int.parse(map['prority']);
  }
}

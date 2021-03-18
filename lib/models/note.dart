class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _prority;

  Note(this._title, this._date, this._prority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._prority,
      [this._description]);
}

import 'package:cloud_firestore/cloud_firestore.dart';
 
class Note {
  String _id;
  String _destinationName;
  String _address;
  DateTime _departureTime;
  String _driver;
  List _taggerAlongers;
  bool _isOffer;
  int _seats;



  //Note(this._id, this._destinationName, this._address, this._departureTime, this._driver, this._taggerAlongers, this._isOffer);
  Note(this._id, this._destinationName, this._address, this._departureTime, this._driver, this._taggerAlongers, this._isOffer, this._seats);



  Note.map(dynamic obj) {
    this._id = obj['id'];
    this._destinationName = obj['destinationName'];
    this._address = obj['address'];
    this._departureTime = obj['departureTime'];
    this._driver = obj['driver'];
    this._taggerAlongers = obj['taggerAlongers'];
    this._isOffer = obj['isOffer'];
    this._isOffer = obj['seats'];

  }
 
  String get id => _id;
  String get destinationName => _destinationName;
  String get address => _address;
  DateTime get departureTime => _departureTime;
  String get driver => _driver;
  List get taggerAlongers => _taggerAlongers;
  bool get isOffer => _isOffer;
  int get seats => _seats;
 
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['destinationName'] = _destinationName;
    map['address'] = _address;
    map['departureTime'] = _departureTime;
    map['driver'] = _driver;
    map['taggerAlongers'] = _taggerAlongers;
    map['isOffer'] = _isOffer;
    map['seats'] = _seats;
 
    return map;
  }
 
  Note.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._destinationName = map['destinationName'];
    this._address = map['address'];
    // how to convert timestamp to dateTime
    this._departureTime = map['departureTime'].toDate();
    //this._departureTime = new DateTime.fromMillisecondsSinceEpoch(2000);
    this._driver = map['driver'];
    this._taggerAlongers = map['taggerAlongers'];
    this._isOffer = map['isOffer'];
    this._seats = map['seats'];
  }
}
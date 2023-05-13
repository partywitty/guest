/// error : false
/// message : "Get NewOn Successfully."
/// data : [{"id":1,"user_id":1,"event_name":"Barbeque Nation","event_type_id":1,"start_date":"2023-04-12","end_date":"2023-04-13","photo":"/public/event_photo/1670665196.jpg","video":"/public/event_photo/1670665196.jpg","fee":2500,"entry_fees":2000,"artist_type":"party","artist_name":"test","created_at":"2023-04-12T03:28:10.000000Z","updated_at":"2023-04-12T03:28:10.000000Z","off":20,"rating":"4.5"},{"id":2,"user_id":1,"event_name":"Barbeque Nation","event_type_id":1,"start_date":"2023-04-12","end_date":"2023-04-13","photo":"/public/event_photo/1670665196.jpg","video":"/public/event_photo/1670665196.jpg","fee":2500,"entry_fees":2000,"artist_type":"party","artist_name":"test","created_at":"2023-04-12T03:28:13.000000Z","updated_at":"2023-04-12T03:28:13.000000Z","off":20,"rating":"4.5"}]

class NewOnM {
  NewOnM({
      bool? error, 
      String? message, 
      List<NewOnData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  NewOnM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(NewOnData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<NewOnData>? _data;
NewOnM copyWith({  bool? error,
  String? message,
  List<NewOnData>? data,
}) => NewOnM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<NewOnData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// user_id : 1
/// event_name : "Barbeque Nation"
/// event_type_id : 1
/// start_date : "2023-04-12"
/// end_date : "2023-04-13"
/// photo : "/public/event_photo/1670665196.jpg"
/// video : "/public/event_photo/1670665196.jpg"
/// fee : 2500
/// entry_fees : 2000
/// artist_type : "party"
/// artist_name : "test"
/// created_at : "2023-04-12T03:28:10.000000Z"
/// updated_at : "2023-04-12T03:28:10.000000Z"
/// off : 20
/// rating : "4.5"

class NewOnData {
  NewOnData({
      num? id, 
      num? userId, 
      String? eventName, 
      num? eventTypeId, 
      String? startDate, 
      String? endDate, 
      String? photo, 
      String? video, 
      num? fee, 
      num? entryFees, 
      String? artistType, 
      String? artistName, 
      String? createdAt, 
      String? updatedAt, 
      num? off, 
      String? rating,}){
    _id = id;
    _userId = userId;
    _eventName = eventName;
    _eventTypeId = eventTypeId;
    _startDate = startDate;
    _endDate = endDate;
    _photo = photo;
    _video = video;
    _fee = fee;
    _entryFees = entryFees;
    _artistType = artistType;
    _artistName = artistName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _off = off;
    _rating = rating;
}

  NewOnData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _eventName = json['event_name'];
    _eventTypeId = json['event_type_id'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _photo = json['photo'];
    _video = json['video'];
    _fee = json['fee'];
    _entryFees = json['entry_fees'];
    _artistType = json['artist_type'];
    _artistName = json['artist_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _off = json['off'];
    _rating = json['rating'];
  }
  num? _id;
  num? _userId;
  String? _eventName;
  num? _eventTypeId;
  String? _startDate;
  String? _endDate;
  String? _photo;
  String? _video;
  num? _fee;
  num? _entryFees;
  String? _artistType;
  String? _artistName;
  String? _createdAt;
  String? _updatedAt;
  num? _off;
  String? _rating;
  NewOnData copyWith({  num? id,
  num? userId,
  String? eventName,
  num? eventTypeId,
  String? startDate,
  String? endDate,
  String? photo,
  String? video,
  num? fee,
  num? entryFees,
  String? artistType,
  String? artistName,
  String? createdAt,
  String? updatedAt,
  num? off,
  String? rating,
}) => NewOnData(  id: id ?? _id,
  userId: userId ?? _userId,
  eventName: eventName ?? _eventName,
  eventTypeId: eventTypeId ?? _eventTypeId,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  photo: photo ?? _photo,
  video: video ?? _video,
  fee: fee ?? _fee,
  entryFees: entryFees ?? _entryFees,
  artistType: artistType ?? _artistType,
  artistName: artistName ?? _artistName,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  off: off ?? _off,
  rating: rating ?? _rating,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get eventName => _eventName;
  num? get eventTypeId => _eventTypeId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get photo => _photo;
  String? get video => _video;
  num? get fee => _fee;
  num? get entryFees => _entryFees;
  String? get artistType => _artistType;
  String? get artistName => _artistName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get off => _off;
  String? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['event_name'] = _eventName;
    map['event_type_id'] = _eventTypeId;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['photo'] = _photo;
    map['video'] = _video;
    map['fee'] = _fee;
    map['entry_fees'] = _entryFees;
    map['artist_type'] = _artistType;
    map['artist_name'] = _artistName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['off'] = _off;
    map['rating'] = _rating;
    return map;
  }

}
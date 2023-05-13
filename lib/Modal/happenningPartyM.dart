/// error : false
/// message : "Get Top Club Successfully."
/// data : [{"id":1,"club_id":274,"club_name":"Rohan","image":"public/uploads/live_club/190d4ef6bcc9baecc0fde4d154dba1a5.jpg","max_seating":200,"seating":200,"status":1,"created_at":"2023-04-07T07:50:02.000000Z","updated_at":"2023-04-07T07:50:02.000000Z"},{"id":2,"club_id":274,"club_name":"Rohan","image":"public/uploads/live_club/a779fa20960fa60b35754ee770b5c309.jpg","max_seating":200,"seating":200,"status":1,"created_at":"2023-04-07T07:50:02.000000Z","updated_at":"2023-04-07T07:50:02.000000Z"}]

class HappenningPartyM {
  HappenningPartyM({
      bool? error, 
      String? message, 
      List<HappenningPartyData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  HappenningPartyM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(HappenningPartyData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<HappenningPartyData>? _data;
HappenningPartyM copyWith({  bool? error,
  String? message,
  List<HappenningPartyData>? data,
}) => HappenningPartyM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<HappenningPartyData>? get data => _data;

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
/// club_id : 274
/// club_name : "Rohan"
/// image : "public/uploads/live_club/190d4ef6bcc9baecc0fde4d154dba1a5.jpg"
/// max_seating : 200
/// seating : 200
/// status : 1
/// created_at : "2023-04-07T07:50:02.000000Z"
/// updated_at : "2023-04-07T07:50:02.000000Z"

class HappenningPartyData {
  HappenningPartyData({
      num? id, 
      num? clubId, 
      String? clubName, 
      String? image, 
      num? maxSeating, 
      num? seating, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _clubId = clubId;
    _clubName = clubName;
    _image = image;
    _maxSeating = maxSeating;
    _seating = seating;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  HappenningPartyData.fromJson(dynamic json) {
    _id = json['id'];
    _clubId = json['club_id'];
    _clubName = json['club_name'];
    _image = json['image'];
    _maxSeating = json['max_seating'];
    _seating = json['seating'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _clubId;
  String? _clubName;
  String? _image;
  num? _maxSeating;
  num? _seating;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  HappenningPartyData copyWith({  num? id,
  num? clubId,
  String? clubName,
  String? image,
  num? maxSeating,
  num? seating,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => HappenningPartyData(  id: id ?? _id,
  clubId: clubId ?? _clubId,
  clubName: clubName ?? _clubName,
  image: image ?? _image,
  maxSeating: maxSeating ?? _maxSeating,
  seating: seating ?? _seating,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get clubId => _clubId;
  String? get clubName => _clubName;
  String? get image => _image;
  num? get maxSeating => _maxSeating;
  num? get seating => _seating;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['club_id'] = _clubId;
    map['club_name'] = _clubName;
    map['image'] = _image;
    map['max_seating'] = _maxSeating;
    map['seating'] = _seating;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
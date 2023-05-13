/// error : false
/// message : "Get Highly Recommended Successfully."
/// data : [{"id":1,"club_id":274,"club_name":"Rohan","image":"public/uploads/top_banner/01677074321.webp","address":"Delhi Aerocity, AeroCity","off":50,"status":1,"created_at":"2023-04-07T07:06:58.000000Z","updated_at":"2023-04-07T07:09:43.000000Z"},{"id":2,"club_id":274,"club_name":"Rohan","image":"public/uploads/top_banner/01677074321.webp","address":"Delhi Aerocity, AeroCity","off":50,"status":1,"created_at":"2023-04-07T07:06:58.000000Z","updated_at":"2023-04-07T07:09:45.000000Z"}]

class HighlyRecM {
  HighlyRecM({
      bool? error, 
      String? message, 
      List<HighlyRecData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  HighlyRecM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(HighlyRecData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<HighlyRecData>? _data;
HighlyRecM copyWith({  bool? error,
  String? message,
  List<HighlyRecData>? data,
}) => HighlyRecM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<HighlyRecData>? get data => _data;

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
/// image : "public/uploads/top_banner/01677074321.webp"
/// address : "Delhi Aerocity, AeroCity"
/// off : 50
/// status : 1
/// created_at : "2023-04-07T07:06:58.000000Z"
/// updated_at : "2023-04-07T07:09:43.000000Z"

class HighlyRecData {
  HighlyRecData({
      num? id, 
      num? clubId, 
      String? clubName, 
      String? image, 
      String? address, 
      num? off, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _clubId = clubId;
    _clubName = clubName;
    _image = image;
    _address = address;
    _off = off;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  HighlyRecData.fromJson(dynamic json) {
    _id = json['id'];
    _clubId = json['club_id'];
    _clubName = json['club_name'];
    _image = json['image'];
    _address = json['address'];
    _off = json['off'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _clubId;
  String? _clubName;
  String? _image;
  String? _address;
  num? _off;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  HighlyRecData copyWith({  num? id,
  num? clubId,
  String? clubName,
  String? image,
  String? address,
  num? off,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => HighlyRecData(  id: id ?? _id,
  clubId: clubId ?? _clubId,
  clubName: clubName ?? _clubName,
  image: image ?? _image,
  address: address ?? _address,
  off: off ?? _off,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get clubId => _clubId;
  String? get clubName => _clubName;
  String? get image => _image;
  String? get address => _address;
  num? get off => _off;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['club_id'] = _clubId;
    map['club_name'] = _clubName;
    map['image'] = _image;
    map['address'] = _address;
    map['off'] = _off;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
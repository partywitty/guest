/// error : false
/// message : "Get Best Offer Successfully."
/// data : [{"id":1,"club_id":274,"image":"public/uploads/top_banner/01677074321.webp","off":40,"offer":"Cafe on 3 - Holiday Inn ","status":1,"created_at":"2023-04-07T05:59:47.000000Z","updated_at":"2023-04-07T06:01:10.000000Z"},{"id":2,"club_id":274,"image":"public/uploads/top_banner/01677074321.webp","off":40,"offer":"Cafe on 3 - Holiday Inn ","status":1,"created_at":"2023-04-07T05:59:47.000000Z","updated_at":"2023-04-07T06:01:12.000000Z"}]

class BestofferM {
  BestofferM({
      bool? error, 
      String? message, 
      List<BestofferData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  BestofferM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BestofferData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<BestofferData>? _data;
BestofferM copyWith({  bool? error,
  String? message,
  List<BestofferData>? data,
}) => BestofferM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<BestofferData>? get data => _data;

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
/// image : "public/uploads/top_banner/01677074321.webp"
/// off : 40
/// offer : "Cafe on 3 - Holiday Inn "
/// status : 1
/// created_at : "2023-04-07T05:59:47.000000Z"
/// updated_at : "2023-04-07T06:01:10.000000Z"

class BestofferData {
  BestofferData({
      num? id, 
      num? clubId, 
      String? image, 
      num? off, 
      String? offer, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _clubId = clubId;
    _image = image;
    _off = off;
    _offer = offer;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  BestofferData.fromJson(dynamic json) {
    _id = json['id'];
    _clubId = json['club_id'];
    _image = json['image'];
    _off = json['off'];
    _offer = json['offer'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _clubId;
  String? _image;
  num? _off;
  String? _offer;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  BestofferData copyWith({  num? id,
  num? clubId,
  String? image,
  num? off,
  String? offer,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => BestofferData(  id: id ?? _id,
  clubId: clubId ?? _clubId,
  image: image ?? _image,
  off: off ?? _off,
  offer: offer ?? _offer,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get clubId => _clubId;
  String? get image => _image;
  num? get off => _off;
  String? get offer => _offer;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['club_id'] = _clubId;
    map['image'] = _image;
    map['off'] = _off;
    map['offer'] = _offer;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
/// error : false
/// message : "Get Top Club Successfully."
/// data : [{"id":1,"club_id":274,"image":"public/uploads/top_banner/01677074321.webp","status":1,"created_at":"2023-04-07T07:25:19.000000Z","updated_at":"2023-04-07T07:25:29.000000Z"},{"id":2,"club_id":274,"image":"public/uploads/top_banner/01677074321.webp","status":1,"created_at":"2023-04-07T07:25:19.000000Z","updated_at":"2023-04-07T07:25:32.000000Z"}]

class TopclubM {
  TopclubM({
      bool? error, 
      String? message, 
      List<TopclubData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  TopclubM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TopclubData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<TopclubData>? _data;
TopclubM copyWith({  bool? error,
  String? message,
  List<TopclubData>? data,
}) => TopclubM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<TopclubData>? get data => _data;

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
/// status : 1
/// created_at : "2023-04-07T07:25:19.000000Z"
/// updated_at : "2023-04-07T07:25:29.000000Z"

class TopclubData {
  TopclubData({
      num? id, 
      num? clubId, 
      String? image, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _clubId = clubId;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  TopclubData.fromJson(dynamic json) {
    _id = json['id'];
    _clubId = json['club_id'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _clubId;
  String? _image;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  TopclubData copyWith({  num? id,
  num? clubId,
  String? image,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => TopclubData(  id: id ?? _id,
  clubId: clubId ?? _clubId,
  image: image ?? _image,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get clubId => _clubId;
  String? get image => _image;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['club_id'] = _clubId;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
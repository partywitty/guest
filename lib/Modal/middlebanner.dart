/// error : false
/// message : "Get Guast middle Banner Successfully."
/// data : [{"id":1,"banner":"public/uploads/top_banner/01677074321.webp","status":1,"created_at":"2023-04-07T05:03:11.000000Z","updated_at":"2023-04-07T05:07:39.000000Z"},{"id":2,"banner":"public/uploads/top_banner/01677074321.webp","status":1,"created_at":"2023-04-07T05:03:11.000000Z","updated_at":"2023-04-07T05:07:42.000000Z"}]

class Middlebanner {
  Middlebanner({
      bool? error, 
      String? message, 
      List<MiddlebannerData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  Middlebanner.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MiddlebannerData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<MiddlebannerData>? _data;
Middlebanner copyWith({  bool? error,
  String? message,
  List<MiddlebannerData>? data,
}) => Middlebanner(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<MiddlebannerData>? get data => _data;

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
/// banner : "public/uploads/top_banner/01677074321.webp"
/// status : 1
/// created_at : "2023-04-07T05:03:11.000000Z"
/// updated_at : "2023-04-07T05:07:39.000000Z"

class MiddlebannerData {
  MiddlebannerData({
      num? id, 
      String? banner, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _banner = banner;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  MiddlebannerData.fromJson(dynamic json) {
    _id = json['id'];
    _banner = json['banner'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _banner;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  MiddlebannerData copyWith({  num? id,
  String? banner,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => MiddlebannerData(  id: id ?? _id,
  banner: banner ?? _banner,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get banner => _banner;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['banner'] = _banner;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
/// error : false
/// message : "Get Coupon Successfully."
/// data : [{"id":1,"image":"/public/event_photo/1670665196.jpg","off":40,"code":"ZOMTJPWI","created_at":"2023-04-12T04:48:06.000000Z","updated_at":"2023-04-12T04:58:56.000000Z"},{"id":2,"image":"/public/event_photo/1670665196.jpg","off":40,"code":"ZOMTJPWI","created_at":"2023-04-12T04:48:06.000000Z","updated_at":"2023-04-12T04:58:58.000000Z"}]

class CouponM {
  CouponM({
      bool? error, 
      String? message, 
      List<CouponData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  CouponM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CouponData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<CouponData>? _data;
CouponM copyWith({  bool? error,
  String? message,
  List<CouponData>? data,
}) => CouponM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<CouponData>? get data => _data;

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
/// image : "/public/event_photo/1670665196.jpg"
/// off : 40
/// code : "ZOMTJPWI"
/// created_at : "2023-04-12T04:48:06.000000Z"
/// updated_at : "2023-04-12T04:58:56.000000Z"

class CouponData {
  CouponData({
      num? id, 
      String? image, 
      num? off, 
      String? code, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _image = image;
    _off = off;
    _code = code;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CouponData.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _off = json['off'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _image;
  num? _off;
  String? _code;
  String? _createdAt;
  String? _updatedAt;
  CouponData copyWith({  num? id,
  String? image,
  num? off,
  String? code,
  String? createdAt,
  String? updatedAt,
}) => CouponData(  id: id ?? _id,
  image: image ?? _image,
  off: off ?? _off,
  code: code ?? _code,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get image => _image;
  num? get off => _off;
  String? get code => _code;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['off'] = _off;
    map['code'] = _code;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
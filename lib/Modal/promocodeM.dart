/// error : false
/// message : "Get Promo Code Successfully."
/// data : [{"id":1,"code":"NBKLHR","expire_date":"2023-07-06","off":40,"win":500,"created_at":"2023-04-12T05:18:27.000000Z","updated_at":"2023-04-12T05:19:01.000000Z"},{"id":2,"code":"NBKLHR","expire_date":"2023-07-06","off":40,"win":500,"created_at":"2023-04-12T05:18:27.000000Z","updated_at":"2023-04-12T05:19:04.000000Z"}]

class PromocodeM {
  PromocodeM({
      bool? error, 
      String? message, 
      List<PromocodeData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  PromocodeM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PromocodeData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<PromocodeData>? _data;
PromocodeM copyWith({  bool? error,
  String? message,
  List<PromocodeData>? data,
}) => PromocodeM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<PromocodeData>? get data => _data;

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
/// code : "NBKLHR"
/// expire_date : "2023-07-06"
/// off : 40
/// win : 500
/// created_at : "2023-04-12T05:18:27.000000Z"
/// updated_at : "2023-04-12T05:19:01.000000Z"

class PromocodeData {
  PromocodeData({
      num? id, 
      String? code, 
      String? expireDate, 
      num? off, 
      num? win, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _code = code;
    _expireDate = expireDate;
    _off = off;
    _win = win;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PromocodeData.fromJson(dynamic json) {
    _id = json['id'];
    _code = json['code'];
    _expireDate = json['expire_date'];
    _off = json['off'];
    _win = json['win'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _code;
  String? _expireDate;
  num? _off;
  num? _win;
  String? _createdAt;
  String? _updatedAt;
  PromocodeData copyWith({  num? id,
  String? code,
  String? expireDate,
  num? off,
  num? win,
  String? createdAt,
  String? updatedAt,
}) => PromocodeData(  id: id ?? _id,
  code: code ?? _code,
  expireDate: expireDate ?? _expireDate,
  off: off ?? _off,
  win: win ?? _win,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get code => _code;
  String? get expireDate => _expireDate;
  num? get off => _off;
  num? get win => _win;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code'] = _code;
    map['expire_date'] = _expireDate;
    map['off'] = _off;
    map['win'] = _win;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
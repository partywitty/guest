/// error : false
/// message : "Get Guast Top Banner Successfully."
/// data : [{"id":1,"banner":"public/uploads/top_banner/01677074321.webp","status":1,"created_at":"2023-04-07T05:03:11.000000Z","updated_at":"2023-04-07T05:07:39.000000Z"},{"id":2,"banner":"public/uploads/top_banner/01677074321.webp","status":1,"created_at":"2023-04-07T05:03:11.000000Z","updated_at":"2023-04-07T05:07:42.000000Z"}]

class Topbanner {
  Topbanner({
      bool? error, 
      String? message, 
      List<TopbannerData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  Topbanner.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TopbannerData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<TopbannerData>? _data;
Topbanner copyWith({  bool? error,
  String? message,
  List<TopbannerData>? data,
}) => Topbanner(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<TopbannerData>? get data => _data;

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

class TopbannerData {
  TopbannerData({
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

  TopbannerData.fromJson(dynamic json) {
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
  TopbannerData copyWith({  num? id,
  String? banner,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => TopbannerData(  id: id ?? _id,
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
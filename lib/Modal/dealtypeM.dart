/// error : false
/// message : "Get Deal Type Successfully."
/// data : [{"id":0,"name":"All Deals"},{"id":1,"name":"Club Deals"},{"id":2,"name":"Restaurant Deals"},{"id":3,"name":"Full Bottles Deals"},{"id":4,"name":"Jump start Deals"}]

class DealtypeM {
  DealtypeM({
      bool? error, 
      String? message, 
      List<DealtypeData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  DealtypeM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DealtypeData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<DealtypeData>? _data;
DealtypeM copyWith({  bool? error,
  String? message,
  List<DealtypeData>? data,
}) => DealtypeM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<DealtypeData>? get data => _data;

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

/// id : 0
/// name : "All Deals"

class DealtypeData {
  DealtypeData({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  DealtypeData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  DealtypeData copyWith({  num? id,
  String? name,
}) => DealtypeData(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}
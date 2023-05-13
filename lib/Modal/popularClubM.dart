/// error : false
/// message : "Get Popular Club Successfully."
/// data : [{"id":1,"image":"/public/event_photo/1670665196.jpg","name":"Y N  Road","start_price":"800.00","end_price":"5000.00","created_at":"2023-04-12T04:40:39.000000Z","updated_at":"2023-04-12T04:40:02.000000Z"},{"id":2,"image":"/public/event_photo/1670665196.jpg","name":"Y N  Road","start_price":"800.00","end_price":"5000.00","created_at":"2023-04-12T04:40:39.000000Z","updated_at":"2023-04-12T04:40:02.000000Z"}]

class PopularClubM {
  PopularClubM({
      bool? error, 
      String? message, 
      List<PopularClubData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  PopularClubM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PopularClubData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<PopularClubData>? _data;
PopularClubM copyWith({  bool? error,
  String? message,
  List<PopularClubData>? data,
}) => PopularClubM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<PopularClubData>? get data => _data;

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
/// name : "Y N  Road"
/// start_price : "800.00"
/// end_price : "5000.00"
/// created_at : "2023-04-12T04:40:39.000000Z"
/// updated_at : "2023-04-12T04:40:02.000000Z"

class PopularClubData {
  PopularClubData({
      num? id, 
      String? image, 
      String? name, 
      String? startPrice, 
      String? endPrice, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _image = image;
    _name = name;
    _startPrice = startPrice;
    _endPrice = endPrice;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PopularClubData.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _startPrice = json['start_price'];
    _endPrice = json['end_price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _image;
  String? _name;
  String? _startPrice;
  String? _endPrice;
  String? _createdAt;
  String? _updatedAt;
  PopularClubData copyWith({  num? id,
  String? image,
  String? name,
  String? startPrice,
  String? endPrice,
  String? createdAt,
  String? updatedAt,
}) => PopularClubData(  id: id ?? _id,
  image: image ?? _image,
  name: name ?? _name,
  startPrice: startPrice ?? _startPrice,
  endPrice: endPrice ?? _endPrice,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get startPrice => _startPrice;
  String? get endPrice => _endPrice;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['start_price'] = _startPrice;
    map['end_price'] = _endPrice;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
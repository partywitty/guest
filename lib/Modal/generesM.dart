/// error : false
/// message : "Get Generes Successfully."
/// data : [{"id":1,"artist_id":null,"name":"Sufi","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":2,"artist_id":null,"name":"sufi sitting kawwali","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":3,"artist_id":null,"name":"Western","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":4,"artist_id":null,"name":"Bollywood","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":5,"artist_id":null,"name":"Rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":6,"artist_id":null,"name":"Retro pop","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":7,"artist_id":null,"name":"Rhythm & Blues","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":8,"artist_id":null,"name":"Heavy Metal","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":9,"artist_id":null,"name":"Folk","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":10,"artist_id":null,"name":"Punk Rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":11,"artist_id":null,"name":"Indi rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":12,"artist_id":null,"name":"Funk","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":13,"artist_id":null,"name":"Pop rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":14,"artist_id":null,"name":"Jazz","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":15,"artist_id":null,"name":"Latin","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":16,"artist_id":null,"name":"Hard rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"}]

class GeneresM {
  GeneresM({
      bool? error, 
      String? message, 
      List<GeneresData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GeneresM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GeneresData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<GeneresData>? _data;
GeneresM copyWith({  bool? error,
  String? message,
  List<GeneresData>? data,
}) => GeneresM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<GeneresData>? get data => _data;

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
/// artist_id : null
/// name : "Sufi"
/// image : null
/// status : "1"
/// created_at : "2022-11-24T11:02:08.000000Z"
/// updated_at : "2022-11-24T11:02:08.000000Z"

class GeneresData {
  GeneresData({
      num? id, 
      dynamic artistId, 
      String? name, 
      dynamic image, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _artistId = artistId;
    _name = name;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  GeneresData.fromJson(dynamic json) {
    _id = json['id'];
    _artistId = json['artist_id'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  dynamic _artistId;
  String? _name;
  dynamic _image;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  GeneresData copyWith({  num? id,
  dynamic artistId,
  String? name,
  dynamic image,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => GeneresData(  id: id ?? _id,
  artistId: artistId ?? _artistId,
  name: name ?? _name,
  image: image ?? _image,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  dynamic get artistId => _artistId;
  String? get name => _name;
  dynamic get image => _image;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['artist_id'] = _artistId;
    map['name'] = _name;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
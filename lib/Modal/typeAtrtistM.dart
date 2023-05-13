/// error : false
/// message : "Type Of Artist"
/// data : {"artist":[{"id":1,"name":"Vocalist","image":null,"status":"1","created_at":"2022-11-24T10:58:46.000000Z","updated_at":"2022-11-24T10:58:46.000000Z","subcategory":"1"},{"id":2,"name":"Musician","image":null,"status":"1","created_at":"2022-11-24T10:58:46.000000Z","updated_at":"2022-11-24T10:58:46.000000Z","subcategory":"1"},{"id":3,"name":"Band","image":null,"status":"1","created_at":"2022-11-24T10:58:46.000000Z","updated_at":"2022-11-24T10:58:46.000000Z","subcategory":"0"}],"selected":null}

class TypeAtrtistM {
  TypeAtrtistM({
      bool? error, 
      String? message,
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  TypeAtrtistM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
TypeAtrtistM copyWith({  bool? error,
  String? message,
  Data? data,
}) => TypeAtrtistM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// artist : [{"id":1,"name":"Vocalist","image":null,"status":"1","created_at":"2022-11-24T10:58:46.000000Z","updated_at":"2022-11-24T10:58:46.000000Z","subcategory":"1"},{"id":2,"name":"Musician","image":null,"status":"1","created_at":"2022-11-24T10:58:46.000000Z","updated_at":"2022-11-24T10:58:46.000000Z","subcategory":"1"},{"id":3,"name":"Band","image":null,"status":"1","created_at":"2022-11-24T10:58:46.000000Z","updated_at":"2022-11-24T10:58:46.000000Z","subcategory":"0"}]
/// selected : null

class Data {
  Data({
      List<ArtistType>? artist,
      dynamic selected,}){
    _artist = artist;
    _selected = selected;
}

  Data.fromJson(dynamic json) {
    if (json['artist'] != null) {
      _artist = [];
      json['artist'].forEach((v) {
        _artist?.add(ArtistType.fromJson(v));
      });
    }
    _selected = json['selected'];
  }
  List<ArtistType>? _artist;
  dynamic _selected;
Data copyWith({  List<ArtistType>? artist,
  dynamic selected,
}) => Data(  artist: artist ?? _artist,
  selected: selected ?? _selected,
);
  List<ArtistType>? get artist => _artist;
  dynamic get selected => _selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_artist != null) {
      map['artist'] = _artist?.map((v) => v.toJson()).toList();
    }
    map['selected'] = _selected;
    return map;
  }

}

/// id : 1
/// name : "Vocalist"
/// image : null
/// status : "1"
/// created_at : "2022-11-24T10:58:46.000000Z"
/// updated_at : "2022-11-24T10:58:46.000000Z"
/// subcategory : "1"

class ArtistType {
  ArtistType({
      num? id, 
      String? name, 
      dynamic image, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? subcategory,}){
    _id = id;
    _name = name;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subcategory = subcategory;
}

  ArtistType.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _subcategory = json['subcategory'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _subcategory;
  ArtistType copyWith({  num? id,
  String? name,
  dynamic image,
  String? status,
  String? createdAt,
  String? updatedAt,
  String? subcategory,
}) => ArtistType(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  subcategory: subcategory ?? _subcategory,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get subcategory => _subcategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['subcategory'] = _subcategory;
    return map;
  }

}
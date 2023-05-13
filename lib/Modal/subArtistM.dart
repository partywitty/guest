/// error : false
/// message : "Type Of Artist Subcategory"
/// data : {"subcategory":[{"id":15,"artists_type_id":1,"name":"solo","num_of_intrument":"1","image":null,"status":"1","created_at":"2022-12-06T11:43:29.000000Z","updated_at":"2022-12-06T11:43:29.000000Z"},{"id":16,"artists_type_id":1,"name":"duo","num_of_intrument":"2","image":null,"status":"1","created_at":"2022-12-06T11:49:48.000000Z","updated_at":"2022-12-06T11:49:48.000000Z"},{"id":17,"artists_type_id":1,"name":"Trio","num_of_intrument":"3","image":null,"status":"1","created_at":"2022-12-06T11:50:14.000000Z","updated_at":"2022-12-06T11:50:14.000000Z"}],"selected":null}

class SubArtistM {
  SubArtistM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  SubArtistM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
SubArtistM copyWith({  bool? error,
  String? message,
  Data? data,
}) => SubArtistM(  error: error ?? _error,
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

/// subcategory : [{"id":15,"artists_type_id":1,"name":"solo","num_of_intrument":"1","image":null,"status":"1","created_at":"2022-12-06T11:43:29.000000Z","updated_at":"2022-12-06T11:43:29.000000Z"},{"id":16,"artists_type_id":1,"name":"duo","num_of_intrument":"2","image":null,"status":"1","created_at":"2022-12-06T11:49:48.000000Z","updated_at":"2022-12-06T11:49:48.000000Z"},{"id":17,"artists_type_id":1,"name":"Trio","num_of_intrument":"3","image":null,"status":"1","created_at":"2022-12-06T11:50:14.000000Z","updated_at":"2022-12-06T11:50:14.000000Z"}]
/// selected : null

class Data {
  Data({
      List<Subcategory>? subcategory, 
      dynamic selected,}){
    _subcategory = subcategory;
    _selected = selected;
}

  Data.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      _subcategory = [];
      json['subcategory'].forEach((v) {
        _subcategory?.add(Subcategory.fromJson(v));
      });
    }
    _selected = json['selected'];
  }
  List<Subcategory>? _subcategory;
  dynamic _selected;
Data copyWith({  List<Subcategory>? subcategory,
  dynamic selected,
}) => Data(  subcategory: subcategory ?? _subcategory,
  selected: selected ?? _selected,
);
  List<Subcategory>? get subcategory => _subcategory;
  dynamic get selected => _selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.map((v) => v.toJson()).toList();
    }
    map['selected'] = _selected;
    return map;
  }

}

/// id : 15
/// artists_type_id : 1
/// name : "solo"
/// num_of_intrument : "1"
/// image : null
/// status : "1"
/// created_at : "2022-12-06T11:43:29.000000Z"
/// updated_at : "2022-12-06T11:43:29.000000Z"

class Subcategory {
  Subcategory({
      num? id, 
      num? artistsTypeId, 
      String? name, 
      String? numOfIntrument, 
      dynamic image, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _artistsTypeId = artistsTypeId;
    _name = name;
    _numOfIntrument = numOfIntrument;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Subcategory.fromJson(dynamic json) {
    _id = json['id'];
    _artistsTypeId = json['artists_type_id'];
    _name = json['name'];
    _numOfIntrument = json['num_of_intrument'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _artistsTypeId;
  String? _name;
  String? _numOfIntrument;
  dynamic _image;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
Subcategory copyWith({  num? id,
  num? artistsTypeId,
  String? name,
  String? numOfIntrument,
  dynamic image,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Subcategory(  id: id ?? _id,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  name: name ?? _name,
  numOfIntrument: numOfIntrument ?? _numOfIntrument,
  image: image ?? _image,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get artistsTypeId => _artistsTypeId;
  String? get name => _name;
  String? get numOfIntrument => _numOfIntrument;
  dynamic get image => _image;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['artists_type_id'] = _artistsTypeId;
    map['name'] = _name;
    map['num_of_intrument'] = _numOfIntrument;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
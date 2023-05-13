/// error : false
/// message : "Get Bevareage Menu Successfully."
/// data : [{"id":1,"club_id":927,"file":"public/uploads/bevarage_menu1682058025.pdf","created_at":"2023-04-21T06:20:25.000000Z","updated_at":"2023-04-21T06:20:25.000000Z"}]

class PdfReaderM {
  PdfReaderM({
      bool? error, 
      String? message, 
      List<PdfReaderData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  PdfReaderM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PdfReaderData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<PdfReaderData>? _data;
PdfReaderM copyWith({  bool? error,
  String? message,
  List<PdfReaderData>? data,
}) => PdfReaderM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<PdfReaderData>? get data => _data;

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
/// club_id : 927
/// file : "public/uploads/bevarage_menu1682058025.pdf"
/// created_at : "2023-04-21T06:20:25.000000Z"
/// updated_at : "2023-04-21T06:20:25.000000Z"

class PdfReaderData {
  PdfReaderData({
      num? id, 
      num? clubId, 
      String? file, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _clubId = clubId;
    _file = file;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  PdfReaderData.fromJson(dynamic json) {
    _id = json['id'];
    _clubId = json['club_id'];
    _file = json['file'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _clubId;
  String? _file;
  String? _createdAt;
  String? _updatedAt;
  PdfReaderData copyWith({  num? id,
  num? clubId,
  String? file,
  String? createdAt,
  String? updatedAt,
}) => PdfReaderData(  id: id ?? _id,
  clubId: clubId ?? _clubId,
  file: file ?? _file,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get clubId => _clubId;
  String? get file => _file;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['club_id'] = _clubId;
    map['file'] = _file;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
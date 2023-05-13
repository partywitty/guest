/// error : false
/// message : "Get Bottom Banner Successfully."
/// data : [{"id":1,"club_id":274,"club_name":"Rohan","artist_name":"test","image":"public/uploads/bottom_banner/Rectangle 195.png","date":"2023-04-08 08:02:15","start_time":"05:44 PM","address":"4th Floor, Mall of India, Sector 18, Noida","status":1,"created_at":"2023-04-08T02:32:15.000000Z","updated_at":"2023-04-08T02:33:03.000000Z","day":"Wednesday"},{"id":2,"club_id":274,"club_name":"Rohan","artist_name":"test","image":"public/uploads/bottom_banner/Rectangle 195.png","date":"2023-04-08 08:02:15","start_time":"05:44 PM","address":"4th Floor, Mall of India, Sector 18, Noida","status":1,"created_at":"2023-04-08T02:32:15.000000Z","updated_at":"2023-04-08T02:33:05.000000Z","day":"Wednesday"}]

class BottomBanner {
  BottomBanner({
      bool? error, 
      String? message, 
      List<BottomBannerData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  BottomBanner.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BottomBannerData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<BottomBannerData>? _data;
BottomBanner copyWith({  bool? error,
  String? message,
  List<BottomBannerData>? data,
}) => BottomBanner(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<BottomBannerData>? get data => _data;

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
/// club_id : 274
/// club_name : "Rohan"
/// artist_name : "test"
/// image : "public/uploads/bottom_banner/Rectangle 195.png"
/// date : "2023-04-08 08:02:15"
/// start_time : "05:44 PM"
/// address : "4th Floor, Mall of India, Sector 18, Noida"
/// status : 1
/// created_at : "2023-04-08T02:32:15.000000Z"
/// updated_at : "2023-04-08T02:33:03.000000Z"
/// day : "Wednesday"

class BottomBannerData {
  BottomBannerData({
      num? id, 
      num? clubId, 
      String? clubName, 
      String? artistName, 
      String? image, 
      String? date, 
      String? startTime, 
      String? address, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      String? day,}){
    _id = id;
    _clubId = clubId;
    _clubName = clubName;
    _artistName = artistName;
    _image = image;
    _date = date;
    _startTime = startTime;
    _address = address;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _day = day;
}

  BottomBannerData.fromJson(dynamic json) {
    _id = json['id'];
    _clubId = json['club_id'];
    _clubName = json['club_name'];
    _artistName = json['artist_name'];
    _image = json['image'];
    _date = json['date'];
    _startTime = json['start_time'];
    _address = json['address'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _day = json['day'];
  }
  num? _id;
  num? _clubId;
  String? _clubName;
  String? _artistName;
  String? _image;
  String? _date;
  String? _startTime;
  String? _address;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _day;
  BottomBannerData copyWith({  num? id,
  num? clubId,
  String? clubName,
  String? artistName,
  String? image,
  String? date,
  String? startTime,
  String? address,
  num? status,
  String? createdAt,
  String? updatedAt,
  String? day,
}) => BottomBannerData(  id: id ?? _id,
  clubId: clubId ?? _clubId,
  clubName: clubName ?? _clubName,
  artistName: artistName ?? _artistName,
  image: image ?? _image,
  date: date ?? _date,
  startTime: startTime ?? _startTime,
  address: address ?? _address,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  day: day ?? _day,
);
  num? get id => _id;
  num? get clubId => _clubId;
  String? get clubName => _clubName;
  String? get artistName => _artistName;
  String? get image => _image;
  String? get date => _date;
  String? get startTime => _startTime;
  String? get address => _address;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get day => _day;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['club_id'] = _clubId;
    map['club_name'] = _clubName;
    map['artist_name'] = _artistName;
    map['image'] = _image;
    map['date'] = _date;
    map['start_time'] = _startTime;
    map['address'] = _address;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['day'] = _day;
    return map;
  }

}
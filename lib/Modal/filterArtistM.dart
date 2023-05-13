/// error : false
/// message : "get Filter artist Successfully."
/// data : [{"id":307,"user_id":0,"username":"test","contact_no":"9876543210","email":"test@gmail.com","password":"$2y$10$XgBQ3uTpxR/uk1hYk3fu4eYzQSxjXpAX6GYP0deh3zmFbu7kk1Y/i","gender":"male","role":"Artist","last_login":"2022-12-21 11:44:14","referral_code":"ytPqKQl9uwGnp7Pl","otp":1234,"status":"0","latitude":null,"logitude":null,"end_page":"videolist","temp":0,"created_at":"2022-12-21T06:14:14.000000Z","updated_at":"2022-12-21T06:28:00.000000Z","artists_type_id":1,"artist_name":"Vocalist","subcategory_id":"15,16","subcategory_name":"solo,duo","genres_id":"1,2","genres_name":"Sufi,sufi sitting kawwali","venue_id":"1,2,3","venue_name":"Private,Club,Corporate","price":"4324","intrument_id":7}]

class FilterArtistM {
  FilterArtistM({
      bool? error, 
      String? message, 
      List<filterArtist>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  FilterArtistM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(filterArtist.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<filterArtist>? _data;
FilterArtistM copyWith({  bool? error,
  String? message,
  List<filterArtist>? data,
}) => FilterArtistM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<filterArtist>? get data => _data;

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

/// id : 307
/// user_id : 0
/// username : "test"
/// contact_no : "9876543210"
/// email : "test@gmail.com"
/// password : "$2y$10$XgBQ3uTpxR/uk1hYk3fu4eYzQSxjXpAX6GYP0deh3zmFbu7kk1Y/i"
/// gender : "male"
/// role : "Artist"
/// last_login : "2022-12-21 11:44:14"
/// referral_code : "ytPqKQl9uwGnp7Pl"
/// otp : 1234
/// status : "0"
/// latitude : null
/// logitude : null
/// end_page : "videolist"
/// temp : 0
/// created_at : "2022-12-21T06:14:14.000000Z"
/// updated_at : "2022-12-21T06:28:00.000000Z"
/// artists_type_id : 1
/// artist_name : "Vocalist"
/// subcategory_id : "15,16"
/// subcategory_name : "solo,duo"
/// genres_id : "1,2"
/// genres_name : "Sufi,sufi sitting kawwali"
/// venue_id : "1,2,3"
/// venue_name : "Private,Club,Corporate"
/// price : "4324"
/// intrument_id : 7

class filterArtist {
  filterArtist({
      num? id, 
      num? userId, 
      String? username, 
      String? contactNo, 
      String? email, 
      String? password, 
      String? gender, 
      String? role, 
      String? lastLogin, 
      String? referralCode, 
      num? otp, 
      String? status, 
      dynamic latitude, 
      dynamic logitude, 
      String? endPage, 
      num? temp, 
      String? createdAt, 
      String? updatedAt, 
      num? artistsTypeId, 
      String? artistName, 
      String? subcategoryId, 
      String? subcategoryName, 
      String? genresId, 
      String? genresName, 
      String? venueId, 
      String? venueName, 
      String? price, 
      num? intrumentId,}){
    _id = id;
    _userId = userId;
    _username = username;
    _contactNo = contactNo;
    _email = email;
    _password = password;
    _gender = gender;
    _role = role;
    _lastLogin = lastLogin;
    _referralCode = referralCode;
    _otp = otp;
    _status = status;
    _latitude = latitude;
    _logitude = logitude;
    _endPage = endPage;
    _temp = temp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _artistsTypeId = artistsTypeId;
    _artistName = artistName;
    _subcategoryId = subcategoryId;
    _subcategoryName = subcategoryName;
    _genresId = genresId;
    _genresName = genresName;
    _venueId = venueId;
    _venueName = venueName;
    _price = price;
    _intrumentId = intrumentId;
}

  filterArtist.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _username = json['username'];
    _contactNo = json['contact_no'];
    _email = json['email'];
    _password = json['password'];
    _gender = json['gender'];
    _role = json['role'];
    _lastLogin = json['last_login'];
    _referralCode = json['referral_code'];
    _otp = json['otp'];
    _status = json['status'];
    _latitude = json['latitude'];
    _logitude = json['logitude'];
    _endPage = json['end_page'];
    _temp = json['temp'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _artistsTypeId = json['artists_type_id'];
    _artistName = json['artist_name'];
    _subcategoryId = json['subcategory_id'];
    _subcategoryName = json['subcategory_name'];
    _genresId = json['genres_id'];
    _genresName = json['genres_name'];
    _venueId = json['venue_id'];
    _venueName = json['venue_name'];
    _price = json['price'];
    _intrumentId = json['intrument_id'];
  }
  num? _id;
  num? _userId;
  String? _username;
  String? _contactNo;
  String? _email;
  String? _password;
  String? _gender;
  String? _role;
  String? _lastLogin;
  String? _referralCode;
  num? _otp;
  String? _status;
  dynamic _latitude;
  dynamic _logitude;
  String? _endPage;
  num? _temp;
  String? _createdAt;
  String? _updatedAt;
  num? _artistsTypeId;
  String? _artistName;
  String? _subcategoryId;
  String? _subcategoryName;
  String? _genresId;
  String? _genresName;
  String? _venueId;
  String? _venueName;
  String? _price;
  num? _intrumentId;
  filterArtist copyWith({  num? id,
  num? userId,
  String? username,
  String? contactNo,
  String? email,
  String? password,
  String? gender,
  String? role,
  String? lastLogin,
  String? referralCode,
  num? otp,
  String? status,
  dynamic latitude,
  dynamic logitude,
  String? endPage,
  num? temp,
  String? createdAt,
  String? updatedAt,
  num? artistsTypeId,
  String? artistName,
  String? subcategoryId,
  String? subcategoryName,
  String? genresId,
  String? genresName,
  String? venueId,
  String? venueName,
  String? price,
  num? intrumentId,
}) => filterArtist(  id: id ?? _id,
  userId: userId ?? _userId,
  username: username ?? _username,
  contactNo: contactNo ?? _contactNo,
  email: email ?? _email,
  password: password ?? _password,
  gender: gender ?? _gender,
  role: role ?? _role,
  lastLogin: lastLogin ?? _lastLogin,
  referralCode: referralCode ?? _referralCode,
  otp: otp ?? _otp,
  status: status ?? _status,
  latitude: latitude ?? _latitude,
  logitude: logitude ?? _logitude,
  endPage: endPage ?? _endPage,
  temp: temp ?? _temp,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  artistName: artistName ?? _artistName,
  subcategoryId: subcategoryId ?? _subcategoryId,
  subcategoryName: subcategoryName ?? _subcategoryName,
  genresId: genresId ?? _genresId,
  genresName: genresName ?? _genresName,
  venueId: venueId ?? _venueId,
  venueName: venueName ?? _venueName,
  price: price ?? _price,
  intrumentId: intrumentId ?? _intrumentId,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get username => _username;
  String? get contactNo => _contactNo;
  String? get email => _email;
  String? get password => _password;
  String? get gender => _gender;
  String? get role => _role;
  String? get lastLogin => _lastLogin;
  String? get referralCode => _referralCode;
  num? get otp => _otp;
  String? get status => _status;
  dynamic get latitude => _latitude;
  dynamic get logitude => _logitude;
  String? get endPage => _endPage;
  num? get temp => _temp;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get artistsTypeId => _artistsTypeId;
  String? get artistName => _artistName;
  String? get subcategoryId => _subcategoryId;
  String? get subcategoryName => _subcategoryName;
  String? get genresId => _genresId;
  String? get genresName => _genresName;
  String? get venueId => _venueId;
  String? get venueName => _venueName;
  String? get price => _price;
  num? get intrumentId => _intrumentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['username'] = _username;
    map['contact_no'] = _contactNo;
    map['email'] = _email;
    map['password'] = _password;
    map['gender'] = _gender;
    map['role'] = _role;
    map['last_login'] = _lastLogin;
    map['referral_code'] = _referralCode;
    map['otp'] = _otp;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['logitude'] = _logitude;
    map['end_page'] = _endPage;
    map['temp'] = _temp;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['artists_type_id'] = _artistsTypeId;
    map['artist_name'] = _artistName;
    map['subcategory_id'] = _subcategoryId;
    map['subcategory_name'] = _subcategoryName;
    map['genres_id'] = _genresId;
    map['genres_name'] = _genresName;
    map['venue_id'] = _venueId;
    map['venue_name'] = _venueName;
    map['price'] = _price;
    map['intrument_id'] = _intrumentId;
    return map;
  }

}
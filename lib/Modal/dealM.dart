
class DealM {
  DealM({
      bool? error, 
      String? message, 
      List<DealData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  DealM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DealData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<DealData>? _data;
DealM copyWith({  bool? error,
  String? message,
  List<DealData>? data,
}) => DealM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<DealData>? get data => _data;

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


class DealData {
  DealData({
      num? id, 
      num? clubId, 
      num? dealTypeId, 
      String? name, 
      dynamic images, 
      String? startDate, 
      String? endDate, 
      num? artistId, 
      String? artistName, 
      String? artistPrice, 
      String? minPrice, 
      String? maxPrice, 
      String? inclusion, 
      String? detail, 
      String? createdAt, 
      String? updatedAt, 
      num? status, 
      num? bought, 
      List<Weeks>? weeks, 
      num? seatCapacity, 
      num? sealLimit, 
      num? increasePart, 
      num? livePrice,}){
    _id = id;
    _clubId = clubId;
    _dealTypeId = dealTypeId;
    _name = name;
    _images = images;
    _startDate = startDate;
    _endDate = endDate;
    _artistId = artistId;
    _artistName = artistName;
    _artistPrice = artistPrice;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _inclusion = inclusion;
    _detail = detail;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _status = status;
    _bought = bought;
    _weeks = weeks;
    _seatCapacity = seatCapacity;
    _sealLimit = sealLimit;
    _increasePart = increasePart;
    _livePrice = livePrice;
}

  DealData.fromJson(dynamic json) {
    _id = json['id'];
    _clubId = json['club_id'];
    _dealTypeId = json['deal_type_id'];
    _name = json['name'];
    _images = json['images'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _artistId = json['artist_id'];
    _artistName = json['artist_name'];
    _artistPrice = json['artist_price'];
    _minPrice = json['min_price'];
    _maxPrice = json['max_price'];
    _inclusion = json['inclusion'];
    _detail = json['detail'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _status = json['status'];
    _bought = json['bought'];
    if (json['weeks'] != null) {
      _weeks = [];
      json['weeks'].forEach((v) {
        _weeks?.add(Weeks.fromJson(v));
      });
    }
    _seatCapacity = json['seat_capacity'];
    _sealLimit = json['seal_limit'];
    _increasePart = json['increase_part'];
    _livePrice = json['live_price'];
  }
  num? _id;
  num? _clubId;
  num? _dealTypeId;
  String? _name;
  dynamic _images;
  String? _startDate;
  String? _endDate;
  num? _artistId;
  String? _artistName;
  String? _artistPrice;
  String? _minPrice;
  String? _maxPrice;
  String? _inclusion;
  String? _detail;
  String? _createdAt;
  String? _updatedAt;
  num? _status;
  num? _bought;
  List<Weeks>? _weeks;
  num? _seatCapacity;
  num? _sealLimit;
  num? _increasePart;
  num? _livePrice;
  DealData copyWith({  num? id,
  num? clubId,
  num? dealTypeId,
  String? name,
  dynamic images,
  String? startDate,
  String? endDate,
  num? artistId,
  String? artistName,
  String? artistPrice,
  String? minPrice,
  String? maxPrice,
  String? inclusion,
  String? detail,
  String? createdAt,
  String? updatedAt,
  num? status,
  num? bought,
  List<Weeks>? weeks,
  num? seatCapacity,
  num? sealLimit,
  num? increasePart,
  num? livePrice,
}) => DealData(  id: id ?? _id,
  clubId: clubId ?? _clubId,
  dealTypeId: dealTypeId ?? _dealTypeId,
  name: name ?? _name,
  images: images ?? _images,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  artistId: artistId ?? _artistId,
  artistName: artistName ?? _artistName,
  artistPrice: artistPrice ?? _artistPrice,
  minPrice: minPrice ?? _minPrice,
  maxPrice: maxPrice ?? _maxPrice,
  inclusion: inclusion ?? _inclusion,
  detail: detail ?? _detail,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  status: status ?? _status,
  bought: bought ?? _bought,
  weeks: weeks ?? _weeks,
  seatCapacity: seatCapacity ?? _seatCapacity,
  sealLimit: sealLimit ?? _sealLimit,
  increasePart: increasePart ?? _increasePart,
  livePrice: livePrice ?? _livePrice,
);
  num? get id => _id;
  num? get clubId => _clubId;
  num? get dealTypeId => _dealTypeId;
  String? get name => _name;
  dynamic get images => _images;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  num? get artistId => _artistId;
  String? get artistName => _artistName;
  String? get artistPrice => _artistPrice;
  String? get minPrice => _minPrice;
  String? get maxPrice => _maxPrice;
  String? get inclusion => _inclusion;
  String? get detail => _detail;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get status => _status;
  num? get bought => _bought;
  List<Weeks>? get weeks => _weeks;
  num? get seatCapacity => _seatCapacity;
  num? get sealLimit => _sealLimit;
  num? get increasePart => _increasePart;
  num? get livePrice => _livePrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['club_id'] = _clubId;
    map['deal_type_id'] = _dealTypeId;
    map['name'] = _name;
    map['images'] = _images;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['artist_id'] = _artistId;
    map['artist_name'] = _artistName;
    map['artist_price'] = _artistPrice;
    map['min_price'] = _minPrice;
    map['max_price'] = _maxPrice;
    map['inclusion'] = _inclusion;
    map['detail'] = _detail;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['status'] = _status;
    map['bought'] = _bought;
    if (_weeks != null) {
      map['weeks'] = _weeks?.map((v) => v.toJson()).toList();
    }
    map['seat_capacity'] = _seatCapacity;
    map['seal_limit'] = _sealLimit;
    map['increase_part'] = _increasePart;
    map['live_price'] = _livePrice;
    return map;
  }

}

/// start_time : "10:00:00"
/// end_time : "11:00:00"
/// valid_on : "Monday"

class Weeks {
  Weeks({
      String? startTime, 
      String? endTime, 
      String? validOn,}){
    _startTime = startTime;
    _endTime = endTime;
    _validOn = validOn;
}

  Weeks.fromJson(dynamic json) {
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _validOn = json['valid_on'];
  }
  String? _startTime;
  String? _endTime;
  String? _validOn;
Weeks copyWith({  String? startTime,
  String? endTime,
  String? validOn,
}) => Weeks(  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  validOn: validOn ?? _validOn,
);
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get validOn => _validOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['valid_on'] = _validOn;
    return map;
  }

}
/// error : false
/// message : "get user detail Successfully."
/// data : [{"id":1,"reward_name":"you get 1 beer for your first entry \r\nin club","description":null,"created_at":"2022-12-16T05:28:47.000000Z","updated_at":"2022-12-16T05:28:47.000000Z","claim":false}]





class RewardM {
  RewardM({
      bool? error, 
      String? message, 
      List<RewardData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  RewardM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(RewardData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<RewardData>? _data;
RewardM copyWith({  bool? error,
  String? message,
  List<RewardData>? data,
}) => RewardM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<RewardData>? get data => _data;

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
/// reward_name : "you get 1 beer for your first entry \r\nin club"
/// description : null
/// created_at : "2022-12-16T05:28:47.000000Z"
/// updated_at : "2022-12-16T05:28:47.000000Z"
/// claim : false

class RewardData {
  RewardData({
      num? id, 
      String? rewardName, 
      dynamic description, 
      String? createdAt, 
      String? updatedAt, 
      bool? claim,}){
    _id = id;
    _rewardName = rewardName;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _claim = claim;
}

  RewardData.fromJson(dynamic json) {
    _id = json['id'];
    _rewardName = json['reward_name'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _claim = json['claim'];
  }
  num? _id;
  String? _rewardName;
  dynamic _description;
  String? _createdAt;
  String? _updatedAt;
  bool? _claim;
  RewardData copyWith({  num? id,
  String? rewardName,
  dynamic description,
  String? createdAt,
  String? updatedAt,
  bool? claim,
}) => RewardData(  id: id ?? _id,
  rewardName: rewardName ?? _rewardName,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  claim: claim ?? _claim,
);
  num? get id => _id;
  String? get rewardName => _rewardName;
  dynamic get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  bool? get claim => _claim;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reward_name'] = _rewardName;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['claim'] = _claim;
    return map;
  }

}
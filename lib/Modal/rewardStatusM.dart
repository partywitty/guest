
class RewardStatusM {
  RewardStatusM({
      bool? error, 
      String? message, 
      List<rewardData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  RewardStatusM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(rewardData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<rewardData>? _data;
RewardStatusM copyWith({  bool? error,
  String? message,
  List<rewardData>? data,
}) => RewardStatusM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<rewardData>? get data => _data;

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

class rewardData {
  rewardData({
      num? rewardId, 
      String? rewardName, 
      dynamic description, 
      String? status, 
      dynamic clubId,}){
    _rewardId = rewardId;
    _rewardName = rewardName;
    _description = description;
    _status = status;
    _clubId = clubId;
}

  rewardData.fromJson(dynamic json) {
    _rewardId = json['reward_id'];
    _rewardName = json['reward_name'];
    _description = json['description'];
    _status = json['status'];
    _clubId = json['club_id'];
  }
  num? _rewardId;
  String? _rewardName;
  dynamic _description;
  String? _status;
  dynamic _clubId;
  rewardData copyWith({  num? rewardId,
  String? rewardName,
  dynamic description,
  String? status,
  dynamic clubId,
}) => rewardData(  rewardId: rewardId ?? _rewardId,
  rewardName: rewardName ?? _rewardName,
  description: description ?? _description,
  status: status ?? _status,
  clubId: clubId ?? _clubId,
);
  num? get rewardId => _rewardId;
  String? get rewardName => _rewardName;
  dynamic get description => _description;
  String? get status => _status;
  dynamic get clubId => _clubId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reward_id'] = _rewardId;
    map['reward_name'] = _rewardName;
    map['description'] = _description;
    map['status'] = _status;
    map['club_id'] = _clubId;
    return map;
  }

}
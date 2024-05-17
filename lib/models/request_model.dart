import 'dart:convert';

import 'package:tom/common/types/state.dart';

class RequestModel {
  String id;
  String sourceId;
  String targetId;
  DateTime timeStamp;
  RequestState state;
  int rate;
  RequestModel({
    required this.id,
    required this.sourceId,
    required this.targetId,
    required this.timeStamp,
    required this.state,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sourceId': sourceId,
      'targetId': targetId,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'state': state.name,
      'rate': rate,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id'] as String,
      sourceId: map['sourceId'] as String,
      targetId: map['targetId'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
      state: getStateFromString(map['state']),
      rate: map['rate'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) =>
      RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant RequestModel other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

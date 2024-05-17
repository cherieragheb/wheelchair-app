import 'dart:convert';

class Review {
  String id;
  String targetId;
  String userName;
  double rate;
  String comment;
  DateTime timeStamp;
  Review({
    required this.id,
    required this.targetId,
    required this.userName,
    required this.rate,
    required this.comment,
    required this.timeStamp,
  });

  Review copyWith({
    String? id,
    String? targetId,
    String? userName,
    double? rate,
    String? comment,
    DateTime? timeStamp,
  }) {
    return Review(
      id: id ?? this.id,
      targetId: targetId ?? this.targetId,
      userName: userName ?? this.userName,
      rate: rate ?? this.rate,
      comment: comment ?? this.comment,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'targetId': targetId,
      'userName': userName,
      'rate': rate,
      'comment': comment,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['id'] as String,
      targetId: map['targetId'] as String,
      userName: map['userName'] as String,
      rate: map['rate'] as double,
      comment: map['comment'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

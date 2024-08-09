import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddIncome {
  String source;
  String id;
  String time;
  double amount;
  AddIncome({
    required this.source,
    required this.id,
    required this.time,
    required this.amount,
  });

  AddIncome copyWith({
    String? source,
    String? id,
    String? time,
    double? amount,
  }) {
    return AddIncome(
      source: source ?? this.source,
      id: id ?? this.id,
      time: time ?? this.time,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source,
      'id': id,
      'time': time,
      'amount': amount,
    };
  }

  factory AddIncome.fromMap(Map<String, dynamic> map) {
    return AddIncome(
      source: map['source'] as String,
      id: map['id'] as String,
      time: map['time'] as String,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddIncome.fromJson(String source) =>
      AddIncome.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddIncome(source: $source, id: $id, time: $time, amount: $amount)';
  }

  @override
  bool operator ==(covariant AddIncome other) {
    if (identical(this, other)) return true;

    return other.source == source &&
        other.id == id &&
        other.time == time &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return source.hashCode ^ id.hashCode ^ time.hashCode ^ amount.hashCode;
  }
}

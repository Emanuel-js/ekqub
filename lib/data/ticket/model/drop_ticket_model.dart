import 'dart:convert';

class DropTicketModel {
  int? userId;
  double? amount;
  int? numberOfTickets;
  DropTicketModel({
    this.userId,
    this.amount,
    this.numberOfTickets,
  });

  DropTicketModel copyWith({
    int? userId,
    double? amount,
    int? numberOfTickets,
  }) {
    return DropTicketModel(
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      numberOfTickets: numberOfTickets ?? this.numberOfTickets,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (numberOfTickets != null) {
      result.addAll({'numberOfTickets': numberOfTickets});
    }

    return result;
  }

  factory DropTicketModel.fromMap(Map<String, dynamic> map) {
    return DropTicketModel(
      userId: map['userId']?.toInt(),
      amount: map['amount']?.toDouble(),
      numberOfTickets: map['numberOfTickets']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DropTicketModel.fromJson(String source) =>
      DropTicketModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DropTicketModel(userId: $userId, amount: $amount, numberOfTickets: $numberOfTickets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DropTicketModel &&
        other.userId == userId &&
        other.amount == amount &&
        other.numberOfTickets == numberOfTickets;
  }

  @override
  int get hashCode =>
      userId.hashCode ^ amount.hashCode ^ numberOfTickets.hashCode;
}

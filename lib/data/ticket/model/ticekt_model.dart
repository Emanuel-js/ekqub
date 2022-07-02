import 'dart:convert';

class TicketModel {
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  int? id;
  int? userId;
  String? ticketNumber;
  String? ticketIssuedDate;
  int? amount;
  TicketModel({
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.id,
    this.userId,
    this.ticketNumber,
    this.ticketIssuedDate,
    this.amount,
  });

  TicketModel copyWith({
    String? createdAt,
    String? updatedAt,
    String? createdBy,
    String? updatedBy,
    int? id,
    int? userId,
    String? ticketNumber,
    String? ticketIssuedDate,
    int? amount,
  }) {
    return TicketModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      ticketNumber: ticketNumber ?? this.ticketNumber,
      ticketIssuedDate: ticketIssuedDate ?? this.ticketIssuedDate,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (createdBy != null) {
      result.addAll({'createdBy': createdBy});
    }
    if (updatedBy != null) {
      result.addAll({'updatedBy': updatedBy});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (ticketNumber != null) {
      result.addAll({'ticketNumber': ticketNumber});
    }
    if (ticketIssuedDate != null) {
      result.addAll({'ticketIssuedDate': ticketIssuedDate});
    }
    if (amount != null) {
      result.addAll({'amount': amount});
    }

    return result;
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      createdBy: map['createdBy'],
      updatedBy: map['updatedBy'],
      id: map['id'],
      userId: map['userId'],
      ticketNumber: map['ticketNumber'],
      ticketIssuedDate: map['ticketIssuedDate'],
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) =>
      TicketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketModel(createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, id: $id, userId: $userId, ticketNumber: $ticketNumber, ticketIssuedDate: $ticketIssuedDate, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicketModel &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.id == id &&
        other.userId == userId &&
        other.ticketNumber == ticketNumber &&
        other.ticketIssuedDate == ticketIssuedDate &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        updatedAt.hashCode ^
        createdBy.hashCode ^
        updatedBy.hashCode ^
        id.hashCode ^
        userId.hashCode ^
        ticketNumber.hashCode ^
        ticketIssuedDate.hashCode ^
        amount.hashCode;
  }
}

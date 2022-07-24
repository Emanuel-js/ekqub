// ignore_for_file: public_member_api_docs, sort_constructors_first

class RefundRequestApprovedModel {
  int? userId;
  String? refundUniqueId;
  String? refundMeStatus;
  RefundRequestApprovedModel({
    this.userId,
    this.refundUniqueId,
    this.refundMeStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'refundUniqueId': refundUniqueId,
      'refundMeStatus': refundMeStatus,
    };
  }

  factory RefundRequestApprovedModel.fromMap(Map<String, dynamic> map) {
    return RefundRequestApprovedModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      refundUniqueId: map['refundUniqueId'] != null
          ? map['refundUniqueId'] as String
          : null,
      refundMeStatus: map['refundMeStatus'] != null
          ? map['refundMeStatus'] as String
          : null,
    );
  }
}

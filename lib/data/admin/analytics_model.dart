class AnalyticsModel {
  int? NumberOfRefundFormRequestAccepted;
  int? NumberOfClients;
  int? NumberOfRefundFormRequestRejected;
  int? NumberOfSubCollectors;
  int? NumberOFLottoTicketsCreated;
  int? NumberOfRefundFormRequestPending;
  int? NumberOfRefundFormRequest;
  int? NumberOfMainCollectors;
  AnalyticsModel({
    this.NumberOfRefundFormRequestAccepted,
    this.NumberOfClients,
    this.NumberOfRefundFormRequestRejected,
    this.NumberOfSubCollectors,
    this.NumberOFLottoTicketsCreated,
    this.NumberOfRefundFormRequestPending,
    this.NumberOfRefundFormRequest,
    this.NumberOfMainCollectors,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (NumberOfRefundFormRequestAccepted != null) {
      result.addAll({
        'NumberOfRefundFormRequestAccepted': NumberOfRefundFormRequestAccepted
      });
    }
    if (NumberOfClients != null) {
      result.addAll({'NumberOfClients': NumberOfClients});
    }
    if (NumberOfRefundFormRequestRejected != null) {
      result.addAll({
        'NumberOfRefundFormRequestRejected': NumberOfRefundFormRequestRejected
      });
    }
    if (NumberOfSubCollectors != null) {
      result.addAll({'NumberOfSubCollectors': NumberOfSubCollectors});
    }
    if (NumberOFLottoTicketsCreated != null) {
      result
          .addAll({'NumberOFLottoTicketsCreated': NumberOFLottoTicketsCreated});
    }
    if (NumberOfRefundFormRequestPending != null) {
      result.addAll({
        'NumberOfRefundFormRequestPending': NumberOfRefundFormRequestPending
      });
    }
    if (NumberOfRefundFormRequest != null) {
      result.addAll({'NumberOfRefundFormRequest': NumberOfRefundFormRequest});
    }
    if (NumberOfMainCollectors != null) {
      result.addAll({'NumberOfMainCollectors': NumberOfMainCollectors});
    }

    return result;
  }

  factory AnalyticsModel.fromMap(Map<String, dynamic> map) {
    return AnalyticsModel(
      NumberOfRefundFormRequestAccepted:
          map['NumberOfRefundFormRequestAccepted']?.toInt(),
      NumberOfClients: map['NumberOfClients']?.toInt(),
      NumberOfRefundFormRequestRejected:
          map['NumberOfRefundFormRequestRejected']?.toInt(),
      NumberOfSubCollectors: map['NumberOfSubCollectors']?.toInt(),
      NumberOFLottoTicketsCreated: map['NumberOFLottoTicketsCreated']?.toInt(),
      NumberOfRefundFormRequestPending:
          map['NumberOfRefundFormRequestPending']?.toInt(),
      NumberOfRefundFormRequest: map['NumberOfRefundFormRequest']?.toInt(),
      NumberOfMainCollectors: map['NumberOfMainCollectors']?.toInt(),
    );
  }
}

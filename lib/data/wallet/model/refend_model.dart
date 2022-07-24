// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ekub/data/user/model/user.dart';
import 'package:ekub/data/wallet/model/refund_responce_model.dart';
import 'package:ekub/data/wallet/model/saving_account_model.dart';
import 'package:ekub/data/wallet/model/wallet_mode.dart';

class RefundModel {
  RefundResponseModel? refundForm;
  WalletModel? wallet;
  SavingAccountModel? accumulatedBalance;
  UserModel? userProfile;
  RefundModel({
    this.refundForm,
    this.wallet,
    this.accumulatedBalance,
    this.userProfile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'refundForm': refundForm?.toMap(),
      'wallet': wallet?.toMap(),
      'accumulatedBalance': accumulatedBalance?.toMap(),
      'userProfile': userProfile?.toMap(),
    };
  }

  RefundModel.fromMap(Map<String, dynamic> map) {
    refundForm = RefundResponseModel.fromMap(map['refundForm']);
    wallet = WalletModel.fromMap(map['wallet']);

    accumulatedBalance = SavingAccountModel.fromMap(map['accumulatedBalance']);

    userProfile = UserModel.fromMap(map['userProfile']);
  }
}

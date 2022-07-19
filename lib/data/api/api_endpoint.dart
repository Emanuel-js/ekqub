class ApiEndPoints {
  static const login = "auth/login";
  static const getAllUsers = "auth/getAllUsers";

  static const manCollectorRegister = "admin/addMainCollector";
  static const updateMainCollector = "admin/update/personalInfo";

  static const subCollectorRegister = "mainCollector/addMySubCollector";
  static const updateSubCollector = "mainCollector/update/personalInfo";

  static const clientRegister = "subCollector/addClient";

  static const getUserWalletAccount = "wallet/user";

  static const transferMoney = "transaction/transferBalance";
  static const transferWalletToSales = "transaction/addBalance";
  static const transactionHistory = "transaction/user";
  static const savingAccount = "wallet/accumlatedBalance";

  static const createDropTickets = "lotto/createDropTickets";
  static const getCreatedTickets = "lotto/GetAllMyTickets/";
  static const getMyUsers = "common/getAllMyUsers";

  static const requestRefund = "refund/requestRefund";
  static const getReqRefund = "refund/getAllRefundRequests";
}

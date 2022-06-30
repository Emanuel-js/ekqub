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
}

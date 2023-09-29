class AccountModel {
  final String accountName;
  final String accountNumber;
  final double pendingBalance;
  final double availableBalance;
  final String lastRefreshed;
  final String transactionPin;

  AccountModel({
    required this.accountName,
    required this.accountNumber,
    required this.pendingBalance,
    required this.availableBalance,
    required this.lastRefreshed,
    required this.transactionPin,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      accountName: json['data']['accountName'],
      accountNumber: json['data']['accountNumber'],
      pendingBalance: json['data']['pendingBalance'].toDouble(),
      availableBalance: json['data']['availableBalance'].toDouble(),
      lastRefreshed: json['data']['lastRefreshed'],
      transactionPin: json['data']['transactionPin'],
    );
  }
}

import "package:paywave/presentation/bloc/logic/requests.dart";

class Transfer {
  Transfer();
  void changePin() {}

  // getAccountDetails(){
  //   final res = await apiPost(path)
  // }
  sendFunds(Map<String, dynamic> data) async {
//     {
//   "destinationAccountNumber": "string",
//   "sourceAccountNumber": "string",
//   "destinationBankCode": "string",
//   "amount": 0,
//   "narration": "string",
//   "transactionPin": "string",
//   "referenceId": "string"
// }
    final res =
        await apiPost("/v1/Account/post-single-transaction", body: data);
    print(res);
  }
}

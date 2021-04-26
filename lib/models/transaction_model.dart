import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) {
  return List<TransactionModel>.from(
    json.decode(str).map((x) => TransactionModel.fromJson(x)),
  );
}

class TransactionModel {
  TransactionModel({
    this.timestamp,
    this.from,
    this.to,
    this.hash,
    this.value,
    this.input,
    this.success,
  });

  int timestamp;
  String from;
  String to;
  String hash;
  double value;
  String input;
  bool success;

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      timestamp: json["timestamp"],
      from: json["from"],
      to: json["to"],
      hash: json["hash"],
      value: json["value"].toDouble(),
      input: json["input"],
      success: json["success"],
    );
  }
}

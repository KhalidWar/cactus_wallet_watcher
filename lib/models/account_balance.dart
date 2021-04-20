class AccountBalance {
  AccountBalance({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  String result;

  factory AccountBalance.fromJson(Map<String, dynamic> json) {
    return AccountBalance(
      status: json["status"],
      message: json["message"],
      result: json["result"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "result": result,
    };
  }
}

class EthSupply {
  EthSupply({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  String result;

  factory EthSupply.fromJson(Map<String, dynamic> json) {
    return EthSupply(
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

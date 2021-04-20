class EthDataPrice {
  EthDataPrice({
    this.status,
    this.message,
    this.result,
  });

  String status;
  String message;
  EthPrice result;

  factory EthDataPrice.fromJson(Map<String, dynamic> json) {
    return EthDataPrice(
      status: json["status"],
      message: json["message"],
      result: EthPrice.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "result": result.toJson(),
    };
  }
}

class EthPrice {
  EthPrice({
    this.ethbtc,
    this.ethbtcTimestamp,
    this.ethusd,
    this.ethusdTimestamp,
  });

  String ethbtc;
  String ethbtcTimestamp;
  String ethusd;
  String ethusdTimestamp;

  factory EthPrice.fromJson(Map<String, dynamic> json) {
    return EthPrice(
      ethbtc: json["ethbtc"],
      ethbtcTimestamp: json["ethbtc_timestamp"],
      ethusd: json["ethusd"],
      ethusdTimestamp: json["ethusd_timestamp"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ethbtc": ethbtc,
      "ethbtc_timestamp": ethbtcTimestamp,
      "ethusd": ethusd,
      "ethusd_timestamp": ethusdTimestamp,
    };
  }
}

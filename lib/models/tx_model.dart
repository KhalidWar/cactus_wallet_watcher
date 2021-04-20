class TxDataModel {
  TxDataModel({this.status, this.message, this.result});

  String status, message;
  List<TxModel> result;

  factory TxDataModel.fromJson(Map<String, dynamic> json) {
    return TxDataModel(
      status: json["status"],
      message: json["message"],
      result:
          List<TxModel>.from(json["result"].map((x) => TxModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
  }
}

class TxModel {
  TxModel({
    this.blockNumber,
    this.timeStamp,
    this.hash,
    this.nonce,
    this.blockHash,
    this.transactionIndex,
    this.from,
    this.to,
    this.value,
    this.gas,
    this.gasPrice,
    this.isError,
    this.txReceiptStatus,
    this.input,
    this.contractAddress,
    this.cumulativeGasUsed,
    this.gasUsed,
    this.confirmations,
  });

  String blockNumber;
  String timeStamp;
  String hash;
  String nonce;
  String blockHash;
  String transactionIndex;
  String from;
  String to;
  String value;
  String gas;
  String gasPrice;
  String isError;
  String txReceiptStatus;
  String input;
  String contractAddress;
  String cumulativeGasUsed;
  String gasUsed;
  String confirmations;

  factory TxModel.fromJson(Map<String, dynamic> json) {
    return TxModel(
      blockNumber: json["blockNumber"],
      timeStamp: json["timeStamp"],
      hash: json["hash"],
      nonce: json["nonce"],
      blockHash: json["blockHash"],
      transactionIndex: json["transactionIndex"],
      from: json["from"],
      to: json["to"],
      value: json["value"],
      gas: json["gas"],
      gasPrice: json["gasPrice"],
      isError: json["isError"],
      txReceiptStatus: json["txreceipt_status"],
      input: json["input"],
      contractAddress: json["contractAddress"],
      cumulativeGasUsed: json["cumulativeGasUsed"],
      gasUsed: json["gasUsed"],
      confirmations: json["confirmations"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "blockNumber": blockNumber,
      "timeStamp": timeStamp,
      "hash": hash,
      "nonce": nonce,
      "blockHash": blockHash,
      "transactionIndex": transactionIndex,
      "from": from,
      "to": to,
      "value": value,
      "gas": gas,
      "gasPrice": gasPrice,
      "isError": isError,
      "txreceipt_status": txReceiptStatus,
      "input": input,
      "contractAddress": contractAddress,
      "cumulativeGasUsed": cumulativeGasUsed,
      "gasUsed": gasUsed,
      "confirmations": confirmations,
    };
  }
}

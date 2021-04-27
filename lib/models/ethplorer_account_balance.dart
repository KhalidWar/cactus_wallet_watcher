class EthplorerAccountBalance {
  EthplorerAccountBalance({this.address, this.eth, this.countTxs, this.tokens});

  String address;
  Eth eth;
  int countTxs;
  List<Token> tokens;

  factory EthplorerAccountBalance.fromJson(Map<String, dynamic> json) {
    return EthplorerAccountBalance(
      address: json["address"],
      eth: Eth.fromJson(json["ETH"]),
      countTxs: json["countTxs"],
      tokens: List<Token>.from(json["tokens"].map((x) => Token.fromJson(x))),
    );
  }
}

class Eth {
  Eth({this.balance, this.price});

  double balance;
  PriceClass price;

  factory Eth.fromJson(Map<String, dynamic> json) {
    return Eth(
      balance: json["balance"].toDouble(),
      price: PriceClass.fromJson(json["price"]),
    );
  }
}

class PriceClass {
  PriceClass({
    this.rate,
    this.diff,
    this.diff7D,
    this.ts,
    this.marketCapUsd,
    this.availableSupply,
    this.volume24H,
    this.diff30D,
    this.volDiff1,
    this.volDiff7,
    this.volDiff30,
    this.currency,
  });

  double rate;
  double diff;
  double diff7D;
  int ts;
  double marketCapUsd;
  double availableSupply;
  double volume24H;
  double diff30D;
  double volDiff1;
  double volDiff7;
  double volDiff30;
  String currency;

  factory PriceClass.fromJson(Map<String, dynamic> json) {
    return PriceClass(
      rate: json["rate"].toDouble(),
      diff: json["diff"].toDouble(),
      diff7D: json["diff7d"].toDouble(),
      ts: json["ts"],
      marketCapUsd: json["marketCapUsd"].toDouble(),
      availableSupply: json["availableSupply"].toDouble(),
      volume24H: json["volume24h"].toDouble(),
      diff30D: json["diff30d"] ?? 0.0.toDouble(),
      // volDiff1: json["volDiff1"].toDouble(),
      volDiff1: 0.0,
      // volDiff7: json["volDiff7"].toDouble(),
      volDiff7: 0.0,
      // volDiff30: json["volDiff30"].toDouble(),
      volDiff30: 0.0,
      currency: json["currency"] == null ? null : json["currency"],
    );
  }
}

class Token {
  Token({this.tokenInfo, this.balance, this.totalIn, this.totalOut});

  TokenInfo tokenInfo;
  double balance;
  int totalIn;
  int totalOut;

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      tokenInfo: TokenInfo.fromJson(json["tokenInfo"]),
      balance: json["balance"].toDouble(),
      totalIn: json["totalIn"],
      totalOut: json["totalOut"],
    );
  }
}

class TokenInfo {
  TokenInfo({
    this.address,
    this.name,
    this.decimals,
    this.symbol,
    this.totalSupply,
    this.owner,
    this.lastUpdated,
    this.issuancesCount,
    this.holdersCount,
    this.ethTransfersCount,
    this.price,
    this.website,
    this.telegram,
    this.twitter,
    this.image,
    this.coingecko,
    this.publicTags,
    this.facebook,
    this.reddit,
  });

  String address;
  String name;
  String decimals;
  String symbol;
  String totalSupply;
  String owner;
  int lastUpdated;
  int issuancesCount;
  int holdersCount;
  int ethTransfersCount;
  dynamic price;
  String website;
  String telegram;
  String twitter;
  String image;
  String coingecko;
  List<String> publicTags;
  String facebook;
  String reddit;

  factory TokenInfo.fromJson(Map<String, dynamic> json) {
    final emptyPrice = PriceClass(
        rate: 0.0,
        diff: 0.0,
        diff7D: 0.0,
        ts: 0,
        marketCapUsd: 0.0,
        availableSupply: 0.0,
        volume24H: 0.0,
        currency: 'USD');

    return TokenInfo(
      address: json["address"],
      name: json["name"],
      decimals: json["decimals"],
      symbol: json["symbol"],
      totalSupply: json["totalSupply"],
      owner: json["owner"] == null ? null : json["owner"],
      lastUpdated: json["lastUpdated"],
      issuancesCount: json["issuancesCount"],
      holdersCount: json["holdersCount"],
      ethTransfersCount: json["ethTransfersCount"],
      price: json['price'] == false
          ? emptyPrice
          : PriceClass.fromJson(json["price"]),
      website: json["website"] == null ? null : json["website"],
      telegram: json["telegram"] == null ? null : json["telegram"],
      twitter: json["twitter"] == null ? null : json["twitter"],
      image: json["image"] == null ? null : json["image"],
      coingecko: json["coingecko"] == null ? null : json["coingecko"],
      publicTags: json["publicTags"] == null
          ? null
          : List<String>.from(json["publicTags"].map((x) => x)),
      facebook: json["facebook"] == null ? null : json["facebook"],
      reddit: json["reddit"] == null ? null : json["reddit"],
    );
  }
}

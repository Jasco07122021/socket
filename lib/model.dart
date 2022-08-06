class DataSocked {
  Data? data;
  String? channel;
  String? event;

  DataSocked({this.data, this.channel, this.event});

  DataSocked.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    channel = json['channel'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['channel'] = this.channel;
    data['event'] = this.event;
    return data;
  }
}

class Data {
  int? id;
  String? timestamp;
  double? amount;
  String? amountStr;
  double? price;
  String? priceStr;
  int? type;
  String? microtimestamp;
  int? buyOrderId;
  int? sellOrderId;

  Data(
      {this.id,
        this.timestamp,
        this.amount,
        this.amountStr,
        this.price,
        this.priceStr,
        this.type,
        this.microtimestamp,
        this.buyOrderId,
        this.sellOrderId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamp = json['timestamp'];
    amount = json['amount'];
    amountStr = json['amount_str'];
    price = json['price'];
    priceStr = json['price_str'];
    type = json['type'];
    microtimestamp = json['microtimestamp'];
    buyOrderId = json['buy_order_id'];
    sellOrderId = json['sell_order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['timestamp'] = this.timestamp;
    data['amount'] = this.amount;
    data['amount_str'] = this.amountStr;
    data['price'] = this.price;
    data['price_str'] = this.priceStr;
    data['type'] = this.type;
    data['microtimestamp'] = this.microtimestamp;
    data['buy_order_id'] = this.buyOrderId;
    data['sell_order_id'] = this.sellOrderId;
    return data;
  }
}
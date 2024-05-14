class CotacaoModel {
  final double _15m;
  double last;
  double buy;
  double sell;
  String symbol;

  CotacaoModel.fromJson(Map<String, dynamic> json)
      : _15m = json['15m'].toDouble(),
        last = json['last'].toDouble(),
        buy = json['buy'].toDouble(),
        sell = json['sell'].toDouble(),
        symbol = json['symbol'];

  Map<String, dynamic> toJson() => {
        '15m': _15m,
        'last': last,
        'buy': buy,
        'sell': sell,
        'symbol': symbol,
      };
}

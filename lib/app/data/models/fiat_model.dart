import 'package:my_btc_balance/app/data/models/cotacao_model.dart';

class FiatModel {
  String fiat;
  CotacaoModel cotacao;

  FiatModel(this.fiat, this.cotacao);

  FiatModel.fromJson(String fiat, Map<String, dynamic> json)
      : fiat = fiat,
        cotacao = CotacaoModel.fromJson(json);
}

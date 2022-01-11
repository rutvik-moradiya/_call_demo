import 'dart:convert';

import 'package:api/model/stock_dividend_model.dart';
import 'package:api/model/stock_high_model.dart';
import 'package:api/model/stock_search_model.dart';
import 'package:http/http.dart'as http;
class Stocks{
  Future<StockHigh> getStockHigh(String StockName)async {
    String url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=${StockName}&interval=5min&apikey=HDI4S2LJ14OAU7DT";
    var res = await http.get(Uri.parse(url));
    var data = StockHigh.fromJson(json.decode(res.body));

    return data;
  }
  Future<StockDividend> getStockDividenddetails(String StockName)async {
    String url = "https://api.polygon.io/v2/reference/dividends/${StockName}?apiKey=LcawIBZQrzynXI7e_PkWnmRtnKasnmfq";
    var res = await http.get(Uri.parse(url));
    var dividenddata = StockDividend.fromJson(json.decode(res.body));

    return dividenddata;
  }
  Future getSearch(String text)async{
    String url = "https://www.alphavantage.co/query?function=${text}&keywords=tencent&apikey=HDI4S2LJ14OAU7DT";
    var res = await http.get(Uri.parse(url));
     var stockNameDetails = StockSearch.fromJson(json.decode(res.body));
    return stockNameDetails.bestMatches  ;
  }
}
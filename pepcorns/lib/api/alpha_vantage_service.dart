import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/asset_provider.dart';

class AlphaVantageService {
  final String apiKey;

  AlphaVantageService(this.apiKey);

  Future<List<Asset>> fetchAssets(String query) async {
    final url =
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$query&apikey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> assetData = data['bestMatches'];

      List<Asset> assets = assetData.map((item) {
        return Asset(
          symbol: item['1. symbol'],
          name: item['2. name'],
          historicalData: [], // Initialize historical data as an empty list
        );
      }).toList();

      return assets;
    } else {
      throw Exception('Failed to fetch assets');
    }
  }

  Future<List<HistoricalDataPoint>> fetchHistoricalData(
      String assetSymbol) async {
    final url =
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$assetSymbol&ouputsize=full&apikey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final Map<String, dynamic> timeSeriesData = data['Time Series (Daily)'];

      List<HistoricalDataPoint> historicalData = [];
      timeSeriesData.forEach((date, values) {
        final historicalDataPoint = HistoricalDataPoint(
          date: DateTime.parse(date),
          open: double.parse(values['1. open']),
          high: double.parse(values['2. high']),
          low: double.parse(values['3. low']),
          close: double.parse(values['4. close']),
          volume: int.parse(values['5. volume']),
        );
        historicalData.add(historicalDataPoint);
      });

      // Sort historicalData in ascending order by date (if necessary)
      historicalData.sort((a, b) => a.date.compareTo(b.date));

      return historicalData;
    } else {
      throw Exception('Failed to fetch historical data');
    }
  }

  Future<CompanyOverview> fetchCompanyOverview(String symbol) async {
    final url =
        'https://www.alphavantage.co/query?function=OVERVIEW&symbol=$symbol&apikey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final companyOverview = CompanyOverview.fromJson(data);
      return companyOverview;
    } else {
      throw Exception('Failed to fetch company overview data');
    }
  }

  Future<Map<String, dynamic>> fetchTopData() async {
    final url =
        'https://www.alphavantage.co/query?function=TOP_GAINERS_LOSERS&apikey=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

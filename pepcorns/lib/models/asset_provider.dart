import 'package:flutter/foundation.dart';

class Asset {
  final String symbol;
  final String name;
  final List<HistoricalDataPoint> historicalData;

  Asset({
    required this.symbol,
    required this.name,
    required this.historicalData,
  });

  Asset copyWith({
    String? symbol,
    String? name,
    List<HistoricalDataPoint>? historicalData,
  }) {
    return Asset(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      historicalData: historicalData ?? this.historicalData,
    );
  }
}

class CompanyOverview {
  final String symbol;
  final String assetType;
  final String name;
  final String description;
  final String exchange;
  final String currency;
  final String country;
  final String sector;
  final String industry;
  final String week52High; // New field for 52-week high
  final String week52Low;
  final String marketCapitalization;
  // Add other relevant properties here

  CompanyOverview({
    required this.symbol,
    required this.assetType,
    required this.name,
    required this.description,
    required this.exchange,
    required this.currency,
    required this.country,
    required this.sector,
    required this.industry,
    required this.week52High,
    required this.week52Low,
    required this.marketCapitalization,
    // Initialize other properties here
  });

  factory CompanyOverview.fromJson(Map<String, dynamic> json) {
    return CompanyOverview(
      symbol: json['Symbol'] ?? '',
      assetType: json['AssetType'] ?? '',
      name: json['Name'] ?? '',
      description: json['Description'] ?? '',
      exchange: json['Exchange'] ?? '',
      currency: json['Currency'] ?? '',
      country: json['Country'] ?? '',
      sector: json['Sector'] ?? '',
      industry: json['Industry'] ?? '',
      week52High: json['52WeekHigh'] ?? '',
      week52Low: json['52WeekLow'] ?? '',
      marketCapitalization: json['MarketCapitalization'] ?? '',
      // Parse other properties from the JSON response here
    );
  }
}

class HistoricalDataPoint {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;

  HistoricalDataPoint({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });
}

class AssetProvider extends ChangeNotifier {
  List<Asset> _assets = [];
  Asset? _selectedAsset;

  List<Asset> get assets => _assets;
  Asset? get selectedAsset => _selectedAsset;

  void setAssets(List<Asset> assets) {
    _assets = assets;
    notifyListeners();
  }

  void setSelectedAsset(Asset asset) {
    _selectedAsset = asset;
    notifyListeners();
  }
}

enum TimeFormat {
  DAY,
  WEEK,
  MONTH,
  YEAR,
}

class ChanAsset {
  final String ticker;
  final String price;
  final String changeAmount;
  final String changePercentage;
  final String volume;

  ChanAsset({
    required this.ticker,
    required this.price,
    required this.changeAmount,
    required this.changePercentage,
    required this.volume,
  });
}

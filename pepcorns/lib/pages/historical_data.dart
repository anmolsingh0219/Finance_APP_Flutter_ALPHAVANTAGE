import 'package:flutter/material.dart';
import 'package:pepcorns/api/alpha_vantage_service.dart';
import 'package:pepcorns/models/asset_provider.dart';
import 'package:pepcorns/models/candle_data.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoricalDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Historical Chart',
          style: TextStyle(
            fontFamily: 'SofiaSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildChart(context), // Pass the context as a parameter
    );
  }

  Widget _buildChart(BuildContext context) {
    // Receive the context as a parameter
    final assetProvider = Provider.of<AssetProvider>(context);
    final selectedStock = assetProvider.selectedAsset;

    if (selectedStock == null) {
      return Center(
        child: Text('No selected stock.'),
      );
    }

    return FutureBuilder(
      future: _fetchAndSetHistoricalData(selectedStock),
      builder: (context, snapshot) {
        // Use the context parameter here
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching historical data.'),
          );
        } else {
          return Column(
            children: [
              Text(
                selectedStock.symbol,
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 35,
                    fontFamily: 'Sofia Sans',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                selectedStock.name,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'Sofia Sans',
                    fontWeight: FontWeight.normal),
              ),
              Expanded(
                flex: 1,
                child: SfCartesianChart(
                  primaryXAxis:
                      DateTimeAxis(), // Set the primary X-axis as DateTimeAxis
                  series: <ChartSeries>[
                    CandleSeries<CandleData, DateTime>(
                      // Use CandleSeries for the candlestick chart
                      dataSource: snapshot.data as List<CandleData>,
                      xValueMapper: (CandleData data, _) =>
                          data.date, // Map the date to X-axis
                      lowValueMapper: (CandleData data, _) =>
                          data.low, // Map the low value to candlestick's low
                      highValueMapper: (CandleData data, _) =>
                          data.high, // Map the high value to candlestick's high
                      openValueMapper: (CandleData data, _) =>
                          data.open, // Map the open value to candlestick's open
                      closeValueMapper: (CandleData data, _) => data.close,
                      showIndicationForSameValues: true,
                      // Map the close value to candlestick's close
                    ),
                  ],
                  zoomPanBehavior: ZoomPanBehavior(
                    enablePinching: true,
                    enablePanning: true,
                    enableDoubleTapZooming: true,
                  ),
                  trackballBehavior: TrackballBehavior(
                    enable: true,
                    activationMode: ActivationMode.singleTap,
                    tooltipSettings: InteractiveTooltip(
                      format:
                          'Date: point.x\nOpen: point.open\nClose: point.close',
                      enable: true,
                      color:
                          Colors.white, // Customize the tooltip color if needed
                      textStyle: TextStyle(
                          color: Colors
                              .black), // Customize the tooltip text color if needed
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Asset: ${selectedStock.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SofiaSans',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<List<CandleData>> _fetchAndSetHistoricalData(
      Asset selectedStock) async {
    final alphaVantageService = AlphaVantageService('IZ23MS9GGCJXHBQJ');
    final historicalData =
        await alphaVantageService.fetchHistoricalData(selectedStock.symbol);

    // Convert the historical data into CandleData
    final List<CandleData> newCandleData = historicalData.map((dataPoint) {
      return CandleData(
        date: dataPoint.date,
        open: dataPoint.open,
        high: dataPoint.high,
        low: dataPoint.low,
        close: dataPoint.close,
        volume: dataPoint.volume,
      );
    }).toList();

    return newCandleData;
  }
}

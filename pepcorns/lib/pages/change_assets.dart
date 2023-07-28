import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pepcorns/api/alpha_vantage_service.dart';
import 'package:pepcorns/pages/home_page.dart';

class TopAssetsScreen extends StatefulWidget {
  @override
  _TopAssetsScreenState createState() => _TopAssetsScreenState();
}

class _TopAssetsScreenState extends State<TopAssetsScreen> {
  final AlphaVantageService _alphaVantageService =
      AlphaVantageService('IZ23MS9GGCJXHBQJ');
  List<dynamic> _assets = [];
  String _selectedOption = 'Top Gainers 24h';
  String _lastUpdated = '';

  @override
  void initState() {
    super.initState();
    _fetchTopAssets('top_gainers');
    _lastUpdated =
        '2023-07-27 16:15:58 US/Eastern'; // Update this with the provided last_updated value
  }

  Future<void> _fetchTopAssets(String option) async {
    try {
      final data = await _alphaVantageService.fetchTopData();
      setState(() {
        _selectedOption = option;
        _assets.clear();
        if (option == 'top_gainers') {
          _assets = data['top_gainers'];
        } else if (option == 'top_losers') {
          _assets = data['top_losers'];
        } else if (option == 'most_actively_traded') {
          _assets = data['most_actively_traded'];
        }
        _lastUpdated = data['last_updated'];
      });
    } catch (e) {
      // Handle error (e.g., show an error message)
      print('Error fetching data: $e');
    }
  }

  DateTime parseDateTime(String dateTimeStr) {
    final dateTimeParts = dateTimeStr.split(' ');
    final dateParts = dateTimeParts[0].split('-');
    final timeParts = dateTimeParts[1].split(':');
    final dateTime = DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
      int.parse(timeParts[0]),
      int.parse(timeParts[1]),
      int.parse(timeParts[2]),
    );
    return dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Top Assets',
          style: TextStyle(fontFamily: 'Sofia Sans'),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
      context,
      '/home_page', // Replace with the route name of your HomePage
      (_) => false, // Remove all the previous routes from the stack
    ); // Navigate back to the previous screen (Home Screen)
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(
                      8.0), // Add padding around the ToggleButtons
                  child: Center(
                    child: ToggleButtons(
                      isSelected: [
                        _selectedOption == 'top_gainers',
                        _selectedOption == 'top_losers',
                        _selectedOption == 'most_actively_traded',
                      ],
                      onPressed: (index) {
                        if (index == 0) {
                          _fetchTopAssets('top_gainers');
                        } else if (index == 1) {
                          _fetchTopAssets('top_losers');
                        } else if (index == 2) {
                          _fetchTopAssets('most_actively_traded');
                        }
                      },
                      children: const [
                        // Wrap each Text widget with Padding to add space around them
                        Padding(
                          padding: EdgeInsets.all(
                              8.0), // Add padding around this Text
                          child: Text(
                            'Top Gainers\n24 Hours',
                            style: TextStyle(
                              fontFamily: 'Sofia Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              8.0), // Add padding around this Text
                          child: Text(
                            'Top Losers\n24h',
                            style: TextStyle(
                              fontFamily: 'Sofia Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              8.0), // Add padding around this Text
                          child: Text(
                            'Most Actively\nTraded 24h',
                            style: TextStyle(
                              fontFamily: 'Sofia Sans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Last Updated: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(parseDateTime(_lastUpdated))} US/Eastern',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _assets.length,
              itemBuilder: (context, index) {
                final asset = _assets[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    shadowColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color:
                            Colors.deepPurple, // Specify the border color here
                        width: 1.0, // Specify the border width (optional)
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(asset['ticker']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price: \$${asset['price']}',
                            style: TextStyle(fontFamily: 'Sofia Sans'),
                          ),
                          Text(
                            'Change Amount: \$${asset['change_amount']}',
                            style: TextStyle(fontFamily: 'Sofia Sans'),
                          ),
                          Text(
                            'Change Percentage: ${asset['change_percentage']}%',
                            style: TextStyle(fontFamily: 'Sofia Sans'),
                          ),
                          Text(
                            'Volume: ${asset['volume']}',
                            style: TextStyle(fontFamily: 'Sofia Sans'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

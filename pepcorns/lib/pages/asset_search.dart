import 'package:flutter/material.dart';
import 'package:pepcorns/api/alpha_vantage_service.dart';
import 'package:pepcorns/models/asset_provider.dart';
import 'package:pepcorns/pages/home_page.dart';
import 'package:provider/provider.dart';

class AssetSearchScreen extends StatefulWidget {
  @override
  _AssetSearchScreenState createState() => _AssetSearchScreenState();
}

final TextEditingController _searchController = TextEditingController();

void _onSearchButtonPressed(BuildContext context) async {
  final assetProvider = Provider.of<AssetProvider>(context, listen: false);
  final searchQuery = _searchController.text.trim();
  final alphaVantageService = AlphaVantageService('IZ23MS9GGCJXHBQJ');
  final assets = await alphaVantageService.fetchAssets(searchQuery);
  assetProvider.setAssets(assets);
}

void _onSearchSubmitted(BuildContext context, String value) async {
  final assetProvider = Provider.of<AssetProvider>(context, listen: false);
  final searchQuery = value.trim();
  final alphaVantageService = AlphaVantageService('IZ23MS9GGCJXHBQJ');
  final assets = await alphaVantageService.fetchAssets(searchQuery);
  assetProvider.setAssets(assets);
}

class _AssetSearchScreenState extends State<AssetSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Search Assets',
          style: TextStyle(
            fontFamily: 'SofiaSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home_page', // Replace with the route name of your HomePage
              (_) => false, // Remove all the previous routes from the stack
            ); // // Navigate back to the previous screen (Home Screen)
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onSubmitted: (value) => _onSearchSubmitted(context, value),
              style: TextStyle(
                color:
                    Colors.deepPurple, // Use a shade of pink for the text color
                fontFamily: 'SofiaSans', // Use Sofia Sans font
              ),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                labelText: 'Search for a stock',
                labelStyle: TextStyle(
                  color: Colors
                      .deepPurple, // Use a shade of blue for the label text color
                  fontFamily: 'SofiaSans', // Use Sofia Sans font for the label
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.purple,
                  ),
                  onPressed: () => _onSearchButtonPressed(context),
                ),
              ),
              cursorColor:
                  Colors.deepPurple, // Use a shade of pink for the cursor color
              keyboardType: TextInputType.text,
            ),
          ),
          Expanded(
            child: Consumer<AssetProvider>(
              builder: (context, assetProvider, _) {
                final assets = assetProvider.assets;
                return ListView.builder(
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    final asset = assets[index];
                    return ListTile(
                      title: Text(
                        asset.symbol,
                        style: TextStyle(
                          color: Colors.purple, // Shade of purple
                          fontFamily: 'SofiaSans',
                        ),
                      ),
                      subtitle: Text(
                        asset.name,
                        style: TextStyle(
                          color: Colors.blue, // Shade of blue
                          fontFamily: 'SofiaSans',
                        ),
                      ),
                      onTap: () {
                        final assetProvider =
                            Provider.of<AssetProvider>(context, listen: false);
                        assetProvider.setSelectedAsset(asset);
                        Navigator.pushNamed(context, '/historical_data');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pepcorns/pages/Change_Assets.dart';
import 'package:pepcorns/pages/asset_search.dart';
import 'package:pepcorns/pages/company_overview_search.dart';
import 'package:pepcorns/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Pepcrons Finance",
          style: TextStyle(
            fontFamily: 'SofiaSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Welcome to Pepcrons!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Explore the stock history of various companies and get valuable insights. "
                  "You can search for any company's stock data and view their historical performance "
                  "with detailed candlestick charts for the past 5 days, 5 months, 1 year, 5 years, or even "
                  "the full data. Get started by selecting 'Explore Stock History'.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              CustomExploreButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AssetSearchScreen(),
                    ),
                  );
                },
                buttonText: "Explore Stock History",
              ),
              SizedBox(height: 20),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Get comprehensive insights into various companies with our 'Company Overview' feature. "
                  "Search for any company and view key financial metrics, such as market capitalization, "
                  "P/E ratio, dividend yield, and more. Discover interesting facts and historical achievements "
                  "of the company along with the 52-week high and low prices. Get started now!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              CustomExploreButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanySearchScreen(),
                    ),
                  );
                },
                buttonText: "Explore Company Overview",
              ),
              SizedBox(height: 20),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Discover top gainers, top losers, and most actively traded assets in the market. Stay informed with key financial metrics and make strategic investment decisions. Explore profitable opportunities today!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              CustomExploreButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopAssetsScreen(),
                    ),
                  );
                },
                buttonText: "Explore Top Assets",
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

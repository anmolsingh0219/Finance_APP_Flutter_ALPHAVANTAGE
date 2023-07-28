// company_overview_screen.dart

import 'package:flutter/material.dart';
import 'package:pepcorns/models/asset_provider.dart';

class CompanyOverviewScreen extends StatelessWidget {
  final CompanyOverview companyOverview;

  CompanyOverviewScreen({required this.companyOverview});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Company Overview',
          style: TextStyle(
            fontFamily: 'SofiaSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              companyOverview.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'SofiaSans',
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Symbol: ${companyOverview.symbol}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            Text(
              'Asset Type: ${companyOverview.assetType}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            SizedBox(height: 20),
            Text(
              companyOverview.description,
              style: TextStyle(fontSize: 16, fontFamily: 'SofiaSans'),
            ),
            SizedBox(height: 20),
            Text(
              'Exchange: ${companyOverview.exchange}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            Text(
              'Currency: ${companyOverview.currency}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            SizedBox(height: 20),
            Text(
              'Country: ${companyOverview.country}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            Text(
              'Sector: ${companyOverview.sector}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            Text(
              'Industry: ${companyOverview.industry}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            SizedBox(height: 20),
            Text(
              '52weekHigh: ${companyOverview.week52High}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            Text(
              '52weekLow: ${companyOverview.week52Low}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            Text(
              'Market Capitalization: ${companyOverview.marketCapitalization}',
              style: TextStyle(fontSize: 18, fontFamily: 'SofiaSans'),
            ),
            // Add more information as desired
          ],
        ),
      ),
    );
  }
}

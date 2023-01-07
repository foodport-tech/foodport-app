import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});
  static const routeName = '/seller_profile';

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Remove shadow
        backgroundColor: mobileBackgroundColor,
        titleSpacing: 0,
        toolbarHeight: 64,
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: [
              SizedBox(width: 16),

              // Back Icon
              GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: neutral1Color,
                  size: 20,
                ),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(width: 8),

              // Search Bar
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: neutral1Color,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Viral golden chicken burger',
                          style: TextStyle(
                              fontSize: 14,
                              color: neutral3Color,
                              fontFamily: 'OpenSans'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
      backgroundColor: mobileBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

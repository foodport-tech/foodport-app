import 'package:flutter/foundation.dart';

class Seller with ChangeNotifier {
  final String sellerId;
  final String? sellerName;
  final sellerOperatingLocation;
  final sellerOperatingTime;
  final bool? sellerVerified;
  final bool? sellerSafeFood;
  final bool? sellerHalal;

  Seller({
    required this.sellerId,
    this.sellerName,
    this.sellerOperatingLocation,
    this.sellerOperatingTime,
    this.sellerVerified,
    this.sellerSafeFood,
    this.sellerHalal,
  });
}

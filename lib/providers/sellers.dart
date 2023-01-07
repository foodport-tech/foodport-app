import 'package:flutter/material.dart';

import 'seller.dart';

class Sellers with ChangeNotifier {
  List<Seller> _items = [
    Seller(
      sellerId: "s1",
      sellerName: "CC by Mel",
      sellerOperatingLocation: {
        "address":
            "CC by MEL, Residensi Park, 2-13, Persiaran Jalil Utama, Bukit Jalil, 57000 Kuala Lumpur, Federal Territory of Kuala Lumpur",
        "location": {
          "lat": 3.0530531,
          "lng": 101.669997,
        },
        "accuracy": 120,
      },
      sellerOperatingTime: {
        'monday': {
          // https://api.flutter.dev/flutter/material/TimeOfDay-class.html
          'start': TimeOfDay(hour: 9, minute: 0),
          'end': TimeOfDay(hour: 22, minute: 0),
        },
        'tuesday': {
          'start': TimeOfDay(hour: 9, minute: 0),
          'end': TimeOfDay(hour: 22, minute: 0),
        },
        'wednesday': {
          'start': TimeOfDay(hour: 9, minute: 0),
          'end': TimeOfDay(hour: 22, minute: 0),
        },
        'thursday': {
          'start': TimeOfDay(hour: 9, minute: 0),
          'end': TimeOfDay(hour: 22, minute: 0),
        },
        'friday': {
          'start': TimeOfDay(hour: 9, minute: 0),
          'end': TimeOfDay(hour: 22, minute: 0),
        },
        'saturday': {
          'start': TimeOfDay(hour: 9, minute: 0),
          'end': TimeOfDay(hour: 22, minute: 0),
        },
        'sunday': {
          'start': TimeOfDay(hour: 9, minute: 0),
          'end': TimeOfDay(hour: 22, minute: 0),
        },
      },
      sellerVerified: true,
      sellerSafeFood: true,
      sellerHalal: false,
    ),
  ];
}

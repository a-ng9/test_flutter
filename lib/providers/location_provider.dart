import 'package:flutter/foundation.dart';

import '../models/place.dart';

class MapLocation with ChangeNotifier {
  List<PlaceLocation> _items = [];

  List<PlaceLocation> get items {
    return [..._items];
  }
}

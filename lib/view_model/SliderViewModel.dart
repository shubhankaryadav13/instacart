import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/SliderModel.dart';

class SliderViewModel extends ChangeNotifier {
  List<SliderModel> _sliders = [];
  bool _isLoading = true;

  List<SliderModel> get sliders => _sliders;
  bool get isLoading => _isLoading;

  SliderViewModel() {
    fetchSliders();
  }

  Future<void> fetchSliders() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('sliders').get();
      _sliders = snapshot.docs.map((doc) => SliderModel.fromMap(doc.data())).toList();
    } catch (e) {
      debugPrint("Error fetching sliders: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

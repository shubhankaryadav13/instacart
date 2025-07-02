import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:instacart/model/HeaderDetailsModel.dart';

class Header_view_model extends ChangeNotifier{
    final List<HeaderDetailsModel> _allProducts = [];

    bool _isLoading = false;
    bool get isLoading => _isLoading;

    List<HeaderDetailsModel> get newProducts =>
        _allProducts.where((p) => p.status == 'AA').toList();

    List<HeaderDetailsModel> get featuredProducts =>
        _allProducts.where((p) => p.status == 'featured').toList();

    List<HeaderDetailsModel> get saleProducts =>
        _allProducts.where((p) => p.status == 'sale').toList();

    Future<void> fetchProducts() async {
        _isLoading = true;
        notifyListeners();

        try {
            final snapshot = await FirebaseFirestore.instance.collection('headerInfo').get();
            _allProducts.clear();
            for (var doc in snapshot.docs) {
                _allProducts.add(HeaderDetailsModel.fromMap(doc.data()));
            }
        } catch (e) {
            debugPrint("Fetch error: $e");
        }

        _isLoading = false;
        notifyListeners();
    }

}
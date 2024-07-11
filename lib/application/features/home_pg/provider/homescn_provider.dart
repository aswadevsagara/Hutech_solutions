import 'package:flutter/material.dart';

class HomeScreenPvdr with ChangeNotifier {
  List<String> _imageUrls = [];

  List<String> get imageUrls => _imageUrls;

  HomeScreenPvdr() {
    fetchAllImageUrls();
  }

  Future<void> fetchAllImageUrls() async {
    // Simulate a delay for fetching data
    await Future.delayed(const Duration(seconds: 2));

    // Simulate fetching data from a local source
    List<String> urls = [
      'https://static.vecteezy.com/system/resources/thumbnails/011/871/820/small/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-vector.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkwiF8GT77bFycMOYG__jO0iSVKIkfN-_1iQ&s',
      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/grocery-sale-retail-or-e-commerce-banner-ad-design-template-67720435bb809be27f46dfb1dd44c6fa_screen.jpg?ts=1606113265',
    ];

    _imageUrls = urls;
    notifyListeners();
  }
}

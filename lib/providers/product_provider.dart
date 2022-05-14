import 'dart:convert';

import 'package:flutter_app_mt/constante/consts.dart';
import 'package:flutter_app_mt/models/product_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {

  List<ProductResponse> productList = [];
  List<ProductResponse> get geList => productList;

  bool _isLoading = true;
  bool get isLoad => _isLoading;

  Future<void> fetchProductsOnline() async{
    // try{
      final response =
      await http.get(Uri.parse(ConstantValues.url));

      if (response.statusCode == 200) {
        print("PROVIDER");
        // return
        // ProductResponse distModel = ProductResponse.fromJson(jsonDecode(response.body));
        jsonDecode(response.body).forEach((v) {
          productList.add( ProductResponse.fromJson(v));
        });
        print(productList);
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
      }

    // }catch (e){
    //     print(e);
    //     _isLoading = false;
    //     notifyListeners();
    // }
  }



}
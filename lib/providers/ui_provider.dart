
import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier{

  bool _emailVal = false;
  bool _orderUpdateVal = false;
  bool _shippingUpdateVal = false;
  bool _promotionVal = false;
  bool _offersVal = false;
  bool _newsVal = false;
  bool _messagesVal = false;
  bool _newArrivalsVal = false;
  bool _pushNotifylVal = false;
  bool _nightNotifylVal = false;

  bool get emailVal => _emailVal;
  bool get orderUpdateVal => _orderUpdateVal;
  bool get shippingUpdateVal => _shippingUpdateVal;
  bool get promotionVal => _promotionVal;
  bool get offersVal => _offersVal;
  bool get newsVal => _newsVal;
  bool get messagesVal => _messagesVal;
  bool get newArrivalsVal => _newArrivalsVal;
  bool get pushNotifylVal => _pushNotifylVal;
  bool get nightNotifylVal => _nightNotifylVal;


    changeEmailVal(){
    _emailVal = !_emailVal;
    notifyListeners();
  }

  changeOrderUpdateVal() {
    _orderUpdateVal = !_orderUpdateVal;
    notifyListeners();
  }

  changeShippingUpdateVal(){
    _shippingUpdateVal = !_shippingUpdateVal;
    notifyListeners();
  }

  changePromotionVal(){
    _promotionVal = !_promotionVal;
    notifyListeners();
  }

  changeOffersVal(){
    _offersVal = !_offersVal;
    notifyListeners();
  }

  changeNewsVal(){
    _newsVal = !_newsVal;
    notifyListeners();
  }

  changeMessagesVal(){
    _messagesVal = !_messagesVal;
    notifyListeners();
  }

  changeNewArrivalsVal(){
    _newArrivalsVal = !_newArrivalsVal;
    notifyListeners();
  }

  changePushNotifylVal(){
    _pushNotifylVal = !_pushNotifylVal;
    notifyListeners();
  }

  changeNightNotifylVal(){
    _nightNotifylVal = !_nightNotifylVal;
    notifyListeners();
  }

}
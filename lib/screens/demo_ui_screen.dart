import 'package:flutter/material.dart';
import 'package:flutter_app_mt/constante/consts.dart';
import 'package:flutter_app_mt/providers/ui_provider.dart';
import 'package:flutter_app_mt/screens/home_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class DemoUIScreen extends StatefulWidget {
  @override
  _DemoUIScreenState createState() => _DemoUIScreenState();
}

class _DemoUIScreenState extends State<DemoUIScreen> {

  // bool _emailVal = false;
  // bool _orderUpdateVal = false;
  // bool _shippingUpdateVal = false;
  // bool _promotionVal = false;
  // bool _offersVal = false;
  // bool _newsVal = false;
  // bool _messagesVal = false;
  // bool _newArrivalsVal = false;
  // bool _pushNotifylVal = false;
  // bool _nightNotifylVal = false;

  late UiProvider uiProvider;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    uiProvider = Provider.of<UiProvider>(context);
    return WillPopScope(
      onWillPop: (){
        return onBackPress();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              onBackPress();
            },
            child:const Icon(Icons.arrow_back_ios_rounded),
          ),
          title: const Text("UI Screen"),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody(){
    return Container(
      height: SizeConfig.screenHeight,
      color: Colors.black12,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox( height: 5,),
            Row(
              children:  [
                const Expanded(
                    flex:3,
                    child: Text("Email Notification",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w300,
                    ),)),
                Expanded(
                  flex: 1,
                  child: NeumorphicSwitch(
                    value: uiProvider.emailVal,
                    onChanged: (val){
                      uiProvider.changeEmailVal();
                    },
                    style:const NeumorphicSwitchStyle(
                      inactiveThumbColor: Colors.white,
                      activeThumbColor: Colors.white,
                      inactiveTrackColor: Colors.black12,
                      activeTrackColor: Colors.black12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox( height: 5,),
            uiProvider.emailVal ? getEmailSubs() : const SizedBox.shrink(),

            Row(
              children:  [
                const Expanded(
                    flex:3,
                    child: Text("Push Notification",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w300,
                    ),)),
                Expanded(
                  flex: 1,
                  child: NeumorphicSwitch(
                    value: uiProvider.pushNotifylVal,
                    onChanged: (val){
                      uiProvider.changePushNotifylVal();
                    },
                    style:const NeumorphicSwitchStyle(
                      inactiveThumbColor: Colors.white,
                      activeThumbColor: Colors.white,
                      inactiveTrackColor: Colors.black12,
                      activeTrackColor: Colors.black12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox( height: 5,),
            Row(
              children:  [
                const Expanded(
                    flex:3,
                    child: Text("Notification at night",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w300,
                    ),)),
                Expanded(
                  flex: 1,
                  child: NeumorphicSwitch(
                    value: uiProvider.nightNotifylVal,
                    onChanged: (val){
                      uiProvider.changeNightNotifylVal();
                    },
                    style:const NeumorphicSwitchStyle(
                      inactiveThumbColor: Colors.white,
                      activeThumbColor: Colors.white,
                      inactiveTrackColor: Colors.black12,
                      activeTrackColor: Colors.black12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox( height: 5,),
          ],
        ),
      ),
    );
  }

  Widget getEmailSubs(){
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Row(
            children:  [
              const Expanded(
                  flex:3,
                  child: Text("Order updates",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    ),)),
              Expanded(
                flex: 1,
                child: NeumorphicSwitch(
                  value: uiProvider.orderUpdateVal,
                  onChanged: (val){
                    uiProvider.changeOrderUpdateVal();
                    },
                  style:const NeumorphicSwitchStyle(
                    inactiveThumbColor: Colors.white,
                    activeThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox( height: 5,),
          Row(
            children:  [
              const Expanded(
                  flex:3,
                  child: Text("Shipping updates",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    ),)),
              Expanded(
                flex: 1,
                child: NeumorphicSwitch(
                  value: uiProvider.shippingUpdateVal,
                  onChanged: (val){
                    uiProvider.changeShippingUpdateVal();
                    },
                  style:const NeumorphicSwitchStyle(
                    inactiveThumbColor: Colors.white,
                    activeThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox( height: 5,),
          Row(
            children:  [
              const Expanded(
                  flex:3,
                  child: Text("Promotions",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    ),)),
              Expanded(
                flex: 1,
                child: NeumorphicSwitch(
                  value: uiProvider.promotionVal,
                  onChanged: (val){
                    uiProvider.changePromotionVal();
                    },
                  style:const NeumorphicSwitchStyle(
                    inactiveThumbColor: Colors.white,
                    activeThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox( height: 5,),
          Row(
            children:  [
              const Expanded(
                  flex:3,
                  child: Text("Offers",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    ),)),
              Expanded(
                flex: 1,
                child: NeumorphicSwitch(
                  value: uiProvider.offersVal,
                  onChanged: (val){
                    uiProvider.changeOffersVal();
                    },
                  style:const NeumorphicSwitchStyle(
                    inactiveThumbColor: Colors.white,
                    activeThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox( height: 5,),
          Row(
            children:  [
              const Expanded(
                  flex:3,
                  child: Text("News",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    ),)),
              Expanded(
                flex: 1,
                child: NeumorphicSwitch(
                  value: uiProvider.newsVal,
                  onChanged: (val){
                    uiProvider.changeNewsVal();
                    },
                  style:const NeumorphicSwitchStyle(
                    inactiveThumbColor: Colors.white,
                    activeThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox( height: 5,),
          Row(
            children:  [
              const Expanded(
                  flex:3,
                  child: Text("Messages",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    ),)),
              Expanded(
                flex: 1,
                child: NeumorphicSwitch(
                  value: uiProvider.messagesVal,
                  onChanged: (val){
                    uiProvider.changeMessagesVal();
                    },
                  style:const NeumorphicSwitchStyle(
                    inactiveThumbColor: Colors.white,
                    activeThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox( height: 5,),
          Row(
            children:  [
              const Expanded(
                  flex:3,
                  child: Text("New Arrivals",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w200,
                    ),)),
              Expanded(
                flex: 1,
                child: NeumorphicSwitch(
                  value: uiProvider.newArrivalsVal,
                  onChanged: (val){
                    uiProvider.changeNewArrivalsVal();
                    },
                  style:const NeumorphicSwitchStyle(
                    inactiveThumbColor: Colors.white,
                    activeThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black12,
                    activeTrackColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox( height: 5,),
        ],
      ),
    );
  }

  onBackPress() async {
    bool result = await Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
          return const MyHomePage(title: "Home");
        }));
    // return result;
  }
}

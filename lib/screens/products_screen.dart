
import 'package:flutter/material.dart';
import 'package:flutter_app_mt/constante/consts.dart';
import 'package:flutter_app_mt/providers/product_provider.dart';
import 'package:flutter_app_mt/screens/home_page.dart';
import 'package:provider/provider.dart';

class ProductsListScreen extends StatefulWidget {
  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {

  late ProductProvider productProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      productProvider = Provider.of<ProductProvider>(context, listen: false);
      productProvider.fetchProductsOnline();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    productProvider = Provider.of<ProductProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return onBackPress();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              onBackPress();
            },
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          title: const Text("Products"),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return !productProvider.isLoad ?
    Consumer<ProductProvider>(
    builder: (context, productProvider, child) {
    return (productProvider.productList.isNotEmpty)
        ?
       GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3/4,
          children:  List.generate(productProvider.productList.length, (int index) {
            // _progressBarActive = false;
            return listBody(productProvider,index);
          }))
        : Center(
          child: Container(
      margin: const EdgeInsets.only(top: 30),
      child: const Text("NO DATA FOUND",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
    ),
        );
    })
    : const Center(child: CircularProgressIndicator.adaptive());
  }

  Widget listBody(var productProvider, int index){
    return  InkWell(
      onTap: (){
        showBottomScreen(productProvider,index);
      },
      child: Container(
        color: Colors.black12,
        margin:const EdgeInsets.all(2),
        padding: const EdgeInsets.all(5),
        height: SizeConfig.safeBlockVertical! * 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(productProvider.productList[index].image,
            height: SizeConfig.safeBlockVertical! * 20,
            width: SizeConfig.safeBlockVertical! * 20,),
            const Spacer(),
            SizedBox(
              height: SizeConfig.safeBlockVertical! *10,
              child: Text(
                'ITEM : ${productProvider.productList[index].title}',
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              'PRICE : ${productProvider.productList[index].price}',
            ),

          ],
        ),
      ),
    );
  }

  showBottomScreen(var productProvider, int index){
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding:const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                     width: SizeConfig.safeBlockVertical! *11,
                     child: const Text('Item :',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                     ),),
                   ),
                   Container(
                       width: SizeConfig.safeBlockVertical! * 40,
                       margin:const EdgeInsets.only(bottom: 5),
                       child: Text('${productProvider.productList[index].title}')),
                ],

              ),
              Row(
                children: [
                  SizedBox(
                     width: SizeConfig.safeBlockVertical! *11,
                     child: const Text('Category :',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                     ),),
                   ),
                   Container(
                       margin:const EdgeInsets.only(bottom: 5),
                       child: Text('${productProvider.productList[index].category}')),
                ],

              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.safeBlockVertical! *11,
                    child: const Text('Rating :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(
                      margin:const EdgeInsets.only(bottom: 5),
                      child: Text('${productProvider.productList[index].rating.rate}')),
                ],

              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.safeBlockVertical! *11,
                    child: const Text('Quantity :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  Container(
                      margin:const EdgeInsets.only(bottom: 5),
                      child: Text('${productProvider.productList[index].rating.count}')),
                ],

              ),
              Image.network(productProvider.productList[index].image,
                height: SizeConfig.safeBlockVertical! * 30,
                width: SizeConfig.safeBlockVertical! * 30,),
            ],
          ),
        );
      },
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

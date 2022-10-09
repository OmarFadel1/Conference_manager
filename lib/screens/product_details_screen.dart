import 'package:buy_it/dummy_data.dart';
import 'package:buy_it/models/sold_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class ProductDetailScreen extends StatefulWidget {
  static String id = 'ProductDetail';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final controllerquantity = TextEditingController();
  final controllersold = TextEditingController();

  Future soldmersh(sold_product prod) async {
    final docUser = FirebaseFirestore.instance.collection('sold').doc();
    prod.id = docUser.id;
    final json = prod.toJson();
    await docUser.set(json);
  }

  bool _validate = false;
  void clearText() {
    controllerquantity.clear();
    controllersold.clear();
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedProduct =
        DUMMY_PRODUCTS.firstWhere((product) => product.id == productId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedProduct.title}'),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: <Widget>[
              Container(
                height: 30.h,
                width: double.infinity,
                child: Image.asset(
                  selectedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Price',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 70,
                width: 250,
                child: Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedProduct.price.toString(),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // child: ListView.builder(
                //   itemBuilder: (ctx, index) => Card(
                //     color: Theme.of(context).accentColor,
                //     child: Text(selectedProduct.price.toString()),
                //   ),
                // ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    child: TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: controllerquantity,
                      cursorColor: KMaiinColor,
                      decoration: InputDecoration(
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          hintText: 'Quantity',
                          prefixIcon: Icon(
                            Icons.production_quantity_limits_rounded,
                            color: KMaiinColor,
                          ),
                          filled: true,
                          fillColor: KSecondaryColor,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    child: TextFormField(
                      controller: controllersold,
                      cursorColor: KMaiinColor,
                      decoration: InputDecoration(
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          hintText: 'Sold by',
                          prefixIcon: Icon(
                            Icons.person,
                            color: KMaiinColor,
                          ),
                          filled: true,
                          fillColor: KSecondaryColor,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      controllerquantity.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                    if (_validate == false) {
                      final prod = sold_product(
                        name: selectedProduct.title,
                        quantity: int.parse(controllerquantity.text),
                        price: selectedProduct.price,
                        soldby: controllersold.text,
                      );
                      soldmersh(prod);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to sold')));
                      clearText();
                      clearText();
                    }
                  },
                  child: Text(
                    'Sold',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:front/controller/controller.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  Controller Function = Controller();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent])),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Add Produit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Container(
                  margin: EdgeInsets.only(top: 90),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  height: 300,
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        child: TextField(
                          controller: codeController,
                          decoration: InputDecoration(hintText: "Code"),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(hintText: "description"),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: priceController,
                          decoration: InputDecoration(hintText: "price"),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          controller: quantityController,
                          decoration: InputDecoration(hintText: "quantity"),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Function.create(
                                codeController.text,
                                descriptionController.text,
                                priceController.text,
                                quantityController.text);
                          });
                            Function.fetchProducts();
                            Navigator.pop(context);
                        },
                        child: const Text('Ajouter'),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    ));
  }
}

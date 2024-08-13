import 'package:flutter/material.dart';
import 'package:front/controller/controller.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  Controller Function = Controller();
  @override

  void initState() {
    super.initState();
    // Function.fetchProducts();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Liste des produits'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              icon: Icon(size: 35, Icons.add, color: Colors.black)),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent])),
        child: FutureBuilder<dynamic>(
            future: Function.fetchProducts(),
            builder: (stx, snp) {
              // if(snp.connectionState == ConnectionState.waiting){return Center(
                //   child: CircularProgressIndicator(),
                // );}
              if (!snp.hasData) {
                return Center(
                  child: Text("no data"),
                );
              } else if (snp.hasError) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snp.data.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(snp.data[index]['code']),
                          SizedBox(
                            width: 40,
                          ),
                          Text(snp.data[index]['description']),
                          SizedBox(
                            width: 40,
                          ),
                          Text(snp.data[index]['price'].toString()),
                          SizedBox(
                            width: 40,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                TextEditingController codeController =
                                    TextEditingController(
                                        text: snp.data[index]["code"]);
                                TextEditingController descriptionController =
                                    TextEditingController(
                                        text: snp.data[index]["description"]);
                                TextEditingController priceController =
                                    TextEditingController(
                                        text: snp.data[index]["price"]
                                            .toString());
                                TextEditingController quantityController =
                                    TextEditingController(
                                        text: snp.data[index]["quantity"]
                                            .toString());
                    
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Edit Data"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: codeController,
                                            decoration: InputDecoration(
                                                labelText: "Code"),
                                          ),
                                          TextField(
                                            controller: descriptionController,
                                            decoration: InputDecoration(
                                                labelText: "description"),
                                          ),
                                          TextField(
                                            controller: priceController,
                                            decoration: InputDecoration(
                                                labelText: "price"),
                                          ),
                                          TextField(
                                            controller: quantityController,
                                            decoration: InputDecoration(
                                                labelText: "quantity"),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Save"),
                                          onPressed: () {
                                            print(codeController.text);
                                            setState(() {
                                              // selectedData["name"] = nameController.text;
                                              // selectedData["email"] = emailController.text;
                                              Function.update(
                                                  snp.data[index]["id"],
                                                  codeController.text,
                                                  descriptionController.text,
                                                  priceController.text,
                                                  quantityController.text);
                                            });
                                            Function.fetchProducts();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                          SizedBox(
                            width: 40,
                          ),
                    
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                print(snp.data[index]);
                                print(snp.data[index]["id"]);
                                setState(() {
                                  Function.delete(snp.data[index]["id"]);
                                });
                              }),
                          // ListTile(
                          //   title: Text(snp.data[index]['description']),
                          //   // subtitle: Text(
                          //   //     'Code: ${products[index]['code']} | Price: \$${products[index]['price']}'),
                          //   // trailing: Text('Qty: ${products[index]['quantity']}'),
                          // )
                        ],
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

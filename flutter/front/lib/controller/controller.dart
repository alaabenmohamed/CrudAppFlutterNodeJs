import 'dart:convert';

import 'package:http/http.dart' as http;

class Controller {
  Future<List> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.25:3000/products/'));

    if (response.statusCode == 200) {
      // print(response.body);
      List data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> delete(int? productId) async {
    await http.delete(
      Uri.parse('http://192.168.1.25:3000/products/$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    // if (response.statusCode == 204) {
    //   await fetchProducts();
    // } else {
    //   throw Exception('Error CONTROLLER');
    // }
  }

  Future<http.Response> update(int productId, String code, String description,
      String price, String quantity) {
    print(code);
    print(productId);
    return http.put(
      Uri.parse('http://192.168.1.25:3000/products/$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'code': code,
        'description': description,
        'price': price.toString(),
        'quantity': quantity.toString(),
      }),
    );
  }

  Future<http.Response>   create(
      String code, String description, String price, String quantity) {

    return http.post(
      Uri.parse('http://192.168.1.25:3000/products/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'code': code,
        'description': description,
        'price': price.toString(),
        'quantity': quantity.toString(),
      },
      ),
   

    );
  }
}

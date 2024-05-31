import 'package:apidan_oliw/api/api_services.dart';
import 'package:apidan_oliw/model/gridview_model.dart';
import 'package:rxdart/rxdart.dart'; // import the RxDart library

class ProductController {
  final _apiService = ApiService();
  final _productsSubject = BehaviorSubject<List<Product>>();

  Stream<List<Product>> get products => _productsSubject.stream;

  ProductController() {
    getProducts();
  }

  void getProducts() async {
    try {
      final products = await _apiService.getProducts();
      _productsSubject.sink.add(products);
    } catch (e) {
      _productsSubject.sink.addError(e);
    }
  }

  void dispose() {
    _productsSubject.close();
  }
}
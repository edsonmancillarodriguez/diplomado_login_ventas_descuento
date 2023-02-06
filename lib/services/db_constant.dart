import 'package:diplomado_login_ventas_descuento/venta/producto_model.dart';

List<ProductModel> dbProducts() {
  return List.generate(
    20,
    (index) => ProductModel(
        id: '$index',
        name: 'Producto $index',
        price: index * 2.5,
        description: 'Descripcion de producto $index',
        stock: index * 3),
  );
}

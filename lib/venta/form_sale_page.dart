import 'package:diplomado_login_ventas_descuento/services/db_constant.dart';
import 'package:flutter/material.dart';

import 'producto_model.dart';

class FormSalePage extends StatefulWidget {
  final String routeName = 'FormSalePage';

  const FormSalePage({Key? key}) : super(key: key);

  @override
  State<FormSalePage> createState() => _FormSalePageState();
}

class _FormSalePageState extends State<FormSalePage> {
  final products = dbProducts();
  final List<Widget> resultProducts = [];
  final List<ProductModel> salesProducts = [];
  final List<DataRow> tableProducts = [];
  double total = 0.0;
  double descount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            const Text(
              'Venta',
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Vendedor: Beniano me la Pela',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  resultProducts.clear();
                  products.forEach((element) {
                    if (value.isEmpty) {
                      resultProducts.clear();
                      setState(() {});
                      return;
                    }
                    if (element.name!.contains(value)) {
                      resultProducts.add(ListTile(
                        title: Text('${element.name}'),
                        trailing: IconButton(
                            onPressed: () {
                              salesProducts.add(element);
                              renderTableProducts();
                            },
                            icon: const Icon(Icons.add)),
                      ));
                      setState(() {});
                      return;
                    }
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Buscar un Producto',
                  hintText: 'Seleccionar',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Container(
              child: Column(
                children: resultProducts..reversed,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.green)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Venta Realizada con exito')));
                    },
                    child: const Text('Terminar Venta'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.redAccent)),
                    onPressed: () {},
                    child: const Text('Cancelar'),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: const Text('Aplicar descuento'),
                    ),
                    SizedBox(
                      width: 160,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if(value.isEmpty)descount=0.0;
                          if(value.isNotEmpty){
                            descount = ((double.tryParse(value)??0.0) / 100) * total;
                          }
                            setState(() {
                            });
                        },
                        decoration: const InputDecoration(
                            labelText: 'Descuento en %',
                            suffix: Text('%'),
                            border: OutlineInputBorder()),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Text('Monto descontado Bs. $descount'),
                    ),Container(
                      margin: const EdgeInsets.all(20),
                      child: Text('Total Bs. ${total - descount}'),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  height: 400,
                  child: ListView(
                    controller: ScrollController(),
                    children: [
                      DataTable(
                        columns: const [
                          DataColumn(label: Text("#")),
                          DataColumn(label: Text("ID")),
                          DataColumn(label: Text("Nombre")),
                          DataColumn(label: Text("Descripción")),
                          DataColumn(label: Text("Precio")),
                          DataColumn(label: Text("stock")),
                          DataColumn(label: Text("Cantidad")),
                          DataColumn(label: Text("acciones")),
                        ],
                        rows: tableProducts,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void renderTableProducts() {
    tableProducts.clear();
    total = 0.0;
    salesProducts.forEach((element) {
      total += element.price!;
      tableProducts.add(
        DataRow(
          cells: [
            const DataCell(Text("#")),
            DataCell(Text("${element.id}")),
            DataCell(Text("${element.name}")),
            DataCell(Text("${element.description}")),
            DataCell(Text("${element.price}")),
            DataCell(Text("${element.stock}")),
            DataCell(
              Container(
                width: 50,
                margin: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(text: '1'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ),
            DataCell(
              IconButton(
                onPressed: () {
                  print(salesProducts.length);
                  salesProducts.remove(element);

                  renderTableProducts();
                },
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                splashRadius: 20,
              ),
            ),
          ],
        ),
      );
    });
    setState(() {});
  }
}

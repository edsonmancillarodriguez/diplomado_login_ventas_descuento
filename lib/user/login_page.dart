import 'package:diplomado_login_ventas_descuento/venta/form_sale_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String routeName = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 430,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0,
              ),
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          final RegExp regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese un correo';
                          }
                          if (!regex.hasMatch(value)) {
                            return 'Por favor ingrese un correo valido';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _email = newValue,
                        decoration: InputDecoration(
                          labelText: 'Correo',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese una contraseña valida';
                          }
                          return null;
                        },
                        onSaved: (newValue) => _password = newValue,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 350,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  const FormSalePage().routeName,
                                  (route) => false);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Correo: $_email \n Password: $_password'),
                                ),
                              );
                            }
                          },
                          child: const Text('Entrar')),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tienes problemas con tu contraseña? \n Contacta con el Administrador",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

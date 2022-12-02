import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion3example/provider/cambio_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cambio = Provider.of<CambioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (cambio.dato == false)
            ? const Text('PROVIDER')
            : const Text('BIENVENIDO'),
        actions: [
          Switch(
            value: cambio.dato,
            onChanged: (value) {
              cambio.cambiar(value);
            },
          ),
          IconButton(
            onPressed: () {
              cambio.btncambiar();
            },
            icon: const Icon(Icons.add_location_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                width: 150,
                color: Colors.red,
              ),
              Visibility(
                visible: cambio.dato1,
                child: Container(
                  width: 150,
                  color: Colors.green,
                ),
              ),
              Container(
                width: 150,
                color: Colors.orange,
              ),
              Container(
                width: 150,
                color: Colors.pink,
              ),
              Container(
                width: 150,
                color: Colors.purple,
              ),
            ]),
          ),
          Visibility(
            visible: cambio.dato1,
            child: const Center(
              child: Text(
                'Bienvenido 2023',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

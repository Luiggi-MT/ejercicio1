import 'package:ejercicio1/Class/operacionFactory/operacionFactory.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio1/Class/opeacion_estadistica/operacionEstadistica.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<double> valores = [];
  String resultado = '';

  void _guardarValores() {
    String texto = _controller.text;
    List<String> partes = texto.split(',');

    List<double> nuevosValores = partes
        .map((e) => double.tryParse(e.trim()))
        .where((e) => e != null)
        .map((e) => e!)
        .toList();

    setState(() {
      valores = nuevosValores;
      _controller.clear();
    });

    _mostrarDialogoSeleccion();
  }

  void _mostrarDialogoSeleccion() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selecciona una operación'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _opcionOperacion('media'),
              _opcionOperacion('moda'),
              _opcionOperacion('mediana'),
              _opcionOperacion('varianza'),
              _opcionOperacion('desviacion'),
            ],
          ),
        );
      },
    );
  }

  Widget _opcionOperacion(String tipo) {
    return ListTile(
      title: Text(tipo.toUpperCase()),
      onTap: () {
        Navigator.pop(context); // cerrar el dialog
        OperacionEstadistica? operacion = OperacionFactory().create(tipo);
        if (operacion != null) {
          double res = operacion.realizarOperacion(valores);
          setState(() {
            resultado = '$tipo: ${res.toStringAsFixed(2)}';
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // por si se desborda
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingresar los valores separados por comas',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: _guardarValores,
            child: Text('Guardar y Calcular'),
          ),
          SizedBox(height: 20),
          Text('Valores guardados:'),
          Text(valores.join(', ')),
          SizedBox(height: 20),
          Text(
            resultado,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}


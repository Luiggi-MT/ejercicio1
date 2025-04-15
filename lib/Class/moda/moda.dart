import 'package:ejercicio1/Class/opeacion_estadistica/operacionEstadistica.dart';

class Moda extends OperacionEstadistica{
  @override
  double realizarOperacion(List<double> datos){
    if(datos.isEmpty) return 0;
    Map<double, int> frecuencias = {};
    for(var numero in datos){
      frecuencias[numero] = (frecuencias[numero] ?? 0) + 1;
    }
    int maxFrecuencias = frecuencias.values.reduce((a,b)=> a>b ? a : b);
    List<double> lista = frecuencias.entries
    .where((entry) => entry.value == maxFrecuencias)
    .map((entry)=>entry.key)
    .toList();
    return lista[0];
  }
}
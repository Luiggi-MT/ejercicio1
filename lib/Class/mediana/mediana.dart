import 'package:ejercicio1/Class/opeacion_estadistica/operacionEstadistica.dart';

class Mediana extends OperacionEstadistica{
  double realizarOperacion(List<double> datos){
    if(datos.isEmpty) return 0;
    datos.sort();
    int n = datos.length;
    return datos[n~/2];
  }
}
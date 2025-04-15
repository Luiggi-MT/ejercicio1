import 'dart:math';

import 'package:ejercicio1/Class/opeacion_estadistica/operacionEstadistica.dart';

class DesviacionEstandar extends OperacionEstadistica{
  @override
  double realizarOperacion(List<double>datos){
    if (datos.isEmpty) return 0;

    // Calcular la media
    double media = datos.reduce((a, b) => a + b) / datos.length;

    // Calcular la suma de los cuadrados de las diferencias con la media
    double sumaDeCuadrados = datos.fold(0, (acumulado, dato) => acumulado + (dato - media) * (dato - media));

    // Calcular la varianza
    double varianza = sumaDeCuadrados / datos.length;

    // La desviación estándar es la raíz cuadrada de la varianza
    return sqrt(varianza); // sqrt calcula la raíz cuadrada
  }
}

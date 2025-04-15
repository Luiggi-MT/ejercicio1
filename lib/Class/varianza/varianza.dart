import 'package:ejercicio1/Class/opeacion_estadistica/operacionEstadistica.dart';

class Varianza extends OperacionEstadistica{
  @override
  double realizarOperacion(List<double>datos){
    if (datos.isEmpty) return 0;
    
    // Calcular la media
    double media = datos.reduce((a, b) => a + b) / datos.length;
    
    // Calcular la suma de los cuadrados de las diferencias con la media
    double sumaDeCuadrados = datos.fold(0, (acumulado, dato) => acumulado + (dato - media) * (dato - media));
    
    // Varianza es la suma de los cuadrados dividida entre el número de elementos
    return sumaDeCuadrados / datos.length;
  }
}
import 'package:ejercicio1/Class/opeacion_estadistica/operacionEstadistica.dart';

class Media extends OperacionEstadistica{
  @override
  double realizarOperacion(List<double>datos){ 
    double suma = 0;
    for(var dato in datos){
      suma += dato;
    }
    return (datos.length != 0) ? suma / datos.length : 0;
  }
}

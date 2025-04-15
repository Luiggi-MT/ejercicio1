import 'package:ejercicio1/Class/desviacionEstandar/desviacionEstandar.dart';
import 'package:ejercicio1/Class/media/media.dart';
import 'package:ejercicio1/Class/mediana/mediana.dart';
import 'package:ejercicio1/Class/moda/moda.dart';
import 'package:ejercicio1/Class/opeacion_estadistica/operacionEstadistica.dart';
import 'package:ejercicio1/Class/varianza/varianza.dart';

class OperacionFactory {
  OperacionEstadistica? create(String type){
    if(type == "media") return Media();
    else if(type == "moda") return Moda();
    else if(type == "mediana") return Mediana();
    else if(type == "varianza") return Varianza();
    else if(type == "desviacion") return DesviacionEstandar();
    else return null;
  }
}
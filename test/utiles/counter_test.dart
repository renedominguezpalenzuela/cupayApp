// Import the test package and Counter class

import 'package:cupay/utiles/counter.dart';
import 'package:test/test.dart';


void main() {
  test('Counter value should be incremented', () {
    //Crear instancia de la clase a probar
    final counter = Counter();
    //Ejecuto la funcion a probar
    counter.increment();
    //valido el resultado de la funcion
    expect(counter.value, 1);

    // expect(Globales.url_base, "12345");

    // Globales.variable_global = "XXXX";

    // expect(Globales.variable_global, "XXXX");

    // Globales2 V = Globales2();
    // expect(V.variable_global, "ABC");

    // V.variable_global = "XXX";

    // expect(V.variable_global, "XXX");
  });

  
}

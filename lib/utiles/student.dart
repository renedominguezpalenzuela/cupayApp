class Student {
//Campos de datos
  String nombre;
  String email;

//Constructor
  Student({this.nombre, this.email});

  factory Student.fromJson(Map<String, dynamic> cadenaJson) {
    return Student(
      nombre: cadenaJson['name'],
      email: cadenaJson['email'],
    );
  }
}

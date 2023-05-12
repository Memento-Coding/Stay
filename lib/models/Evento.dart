class Evento {
  final String nombre;
  final String descripcion;
  final String fechaHora;

  Evento({
    required this.nombre,
    required this.descripcion,
    required this.fechaHora,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fechaHora: json['fecha_hora'],
    );
  }
}
class Evento {
  final String nombre;
  final String descripcion;
  final String fechaHora;
  final int id;

  Evento({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fechaHora,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json['evento_id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fechaHora: json['fecha_hora'],
    );
  }
}

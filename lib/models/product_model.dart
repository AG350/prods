
import 'dart:convert';

class Product {
  Product({
    required this.codigo,
    required this.descripcion,
    this.imagen,
    required this.precio,
    this.id,
  });

  String codigo;
  String descripcion;
  String? imagen;
  double precio;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        precio: json["precio"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "descripcion": descripcion,
        "imagen": imagen,
        "precio": precio,
      };

  Product copy() => Product(
        codigo: this.codigo,
        descripcion: this.descripcion,
        imagen: this.imagen,
        precio: this.precio,
        id: this.id,
      );
}
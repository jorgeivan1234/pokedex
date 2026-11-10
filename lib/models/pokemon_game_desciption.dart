import 'package:flutter/material.dart';

class PokemonGameDesciption {
  final String id;
  final String title;
  final String desarrollador;
  final String distribuidor;
  final String designer;
  final String plataforma;
  final String genero;
  final String descripcion;
  final String generacion;
  final String imagenAssets;
  final Color color;
  

  PokemonGameDesciption({
    required this.id, 
    required this.title, 
    required this.desarrollador, 
    required this.distribuidor, 
    required this.designer,
    required this.plataforma, 
    required this.genero, 
    required this.descripcion, 
    required this.generacion, 
    required this.imagenAssets, 
    required this.color,
  });
}
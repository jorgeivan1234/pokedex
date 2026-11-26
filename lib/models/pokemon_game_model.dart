import 'package:flutter/material.dart';

class PokemonGameModel {
  final String id;
  final String title;
  final String plataforma;
  final String genero;
  final String description;
  final String generacion;
  final String imagenAssets;
  final Color color;

  PokemonGameModel({
    required this.id, 
    required this.title, 
    required this.plataforma, 
    required this.genero, 
    required this.description, 
    required this.generacion, 
    required this.imagenAssets, 
    required this.color, 
  });
}
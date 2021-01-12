import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CardDto extends Equatable{
  final int id;
  final Color color;
  final String quote;

  const CardDto({@required this.color, @required this.quote, this.id});

  @override
  List<Object> get props => [color, quote, id];
}
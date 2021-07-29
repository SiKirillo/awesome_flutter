import 'package:flutter/material.dart' as material;

const TextFormDecoration = material.InputDecoration(
  contentPadding: material.EdgeInsets.all(12.0),
  fillColor: material.Colors.white,
  filled: true,
  enabledBorder: material.OutlineInputBorder(
    borderSide: material.BorderSide(
      color: material.Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: material.OutlineInputBorder(
    borderSide: material.BorderSide(
      color: material.Colors.pink,
      width: 2.0,
    ),
  ),
);

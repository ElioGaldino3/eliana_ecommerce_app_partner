// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:fusca_branco/themes/primary_color.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme =
    ThemeData(primarySwatch: primaryColor, textTheme: GoogleFonts.nunitoTextTheme().copyWith(subtitle2: const TextStyle(fontWeight: FontWeight.bold)));

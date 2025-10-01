import 'package:flutter/material.dart';

// Definisikan breakpoint kita
const double mobileBreakpoint = 650;
const double tabletBreakpoint = 900;

// Helper booleans untuk memudahkan pengecekan
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < mobileBreakpoint;
bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= mobileBreakpoint &&
    MediaQuery.of(context).size.width < tabletBreakpoint;
bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= tabletBreakpoint;
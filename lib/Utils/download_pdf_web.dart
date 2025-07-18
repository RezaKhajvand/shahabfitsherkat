@JS()
library;

import 'dart:js_interop';

import 'package:js/js.dart';

@JS('downloadPdf')
external JSVoid downloadPdf(JSAny data, String filename);

@JS()
library webauthn_interop;

import 'dart:js_interop';

import 'package:js/js.dart';

@JS('authenticateWithFingerprint')
external JSAny authenticateWithFingerprint();

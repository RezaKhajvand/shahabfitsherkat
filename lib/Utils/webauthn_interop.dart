@JS()
library webauthn_interop;

import 'dart:js_interop';
import 'package:js/js.dart';

@JS('registerFingerprintCredential')
external JSPromise registerFingerprintCredential();

@JS('authenticateWithFingerprint')
external JSPromise authenticateWithFingerprint();

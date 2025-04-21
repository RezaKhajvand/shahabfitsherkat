@JS()
library webauthn_interop;

import 'dart:js_interop';
import 'dart:typed_data';
import 'package:js/js.dart';

@JS('registerFingerprintCredential')
external JSPromise registerFingerprintCredential();

@JS('authenticateWithFingerprint')
external JSPromise authenticateWithFingerprint(Uint8List? readFinger);

import 'dart:js_interop';

@JS('registerFingerprintCredential')
external JSPromise registerFingerprintCredential();

@JS('authenticateWithFingerprint')
external JSPromise authenticateWithFingerprint(JSString credentialId);

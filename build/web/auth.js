async function registerFingerprintCredential() {
  const publicKey = {
    challenge: Uint8Array.from('someRandomChallenge', c => c.charCodeAt(0)),
    rp: {
      name: "Example App",
    },
    user: {
      id: Uint8Array.from('userId1234', c => c.charCodeAt(0)),
      name: "user@example.com",
      displayName: "داش رضا",
    },
    pubKeyCredParams: [
      {
        type: "public-key",
        alg: -7 // ES256
      }
    ],
    timeout: 60000,
    attestation: "direct",
    authenticatorSelection: {
      authenticatorAttachment: "platform", // یعنی اثر انگشت روی سیستم
      userVerification: "required"
    }
  };

  try {
    const credential = await navigator.credentials.create({ publicKey });
    return JSON.stringify(credential);
  } catch (err) {
    return `Error in registration: ${err.message}`;
  }
}

async function authenticateWithFingerprint() {
  const publicKey = {
    challenge: Uint8Array.from('someAuthChallenge', c => c.charCodeAt(0)),
    timeout: 60000,
    userVerification: "required",
  };

  try {
    const assertion = await navigator.credentials.get({ publicKey });
    return JSON.stringify(assertion);
  } catch (err) {
    return `Error in auth: ${err.message}`;
  }
}

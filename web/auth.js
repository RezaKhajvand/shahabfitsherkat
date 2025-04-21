function bufferToBase64(buffer) {
  return btoa(String.fromCharCode(...new Uint8Array(buffer)));
}

async function registerFingerprintCredential() {
  const challenge = new Uint8Array(32);
  crypto.getRandomValues(challenge);

  const publicKey = {
    challenge: challenge,
    rp: {
      name: "Your App",
    },
    user: {
      id: Uint8Array.from("user-fingerprint", (c) => c.charCodeAt(0)),
      name: "user@yourapp.com",
      displayName: "داش رضا",
    },
    pubKeyCredParams: [{ type: "public-key", alg: -7 }],
    authenticatorSelection: {
      authenticatorAttachment: "platform",
      userVerification: "required",
    },
    timeout: 60000,
    attestation: "none",
  };

  try {
    const credential = await navigator.credentials.create({ publicKey });
    const id = btoa(String.fromCharCode(...new Uint8Array(credential.rawId)));
    return id; // credentialId base64 شده
  } catch (err) {
    return `error:${err.message}`;
  }
}

async function authenticateWithFingerprint(credentialIdBase64) {
  const id = Uint8Array.from(atob(credentialIdBase64), (c) => c.charCodeAt(0));

  const publicKey = {
    challenge: new Uint8Array(32),
    allowCredentials: [
      {
        id: id,
        type: "public-key",
        transports: ["internal"],
      },
    ],
    userVerification: "required",
    timeout: 60000,
  };

  try {
    const assertion = await navigator.credentials.get({ publicKey });
    return "ok";
  } catch (err) {
    return `error:${err.message}`;
  }
}

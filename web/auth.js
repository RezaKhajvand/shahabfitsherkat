function bufferToBase64(buffer) {
  return btoa(String.fromCharCode(...new Uint8Array(buffer)));
}

async function registerFingerprintCredential() {
  const publicKey = {
    challenge: Uint8Array.from("someRandomChallenge", (c) => c.charCodeAt(0)),
    rp: {
      name: "Example",
    },
    user: {
      id: Uint8Array.from("userId1234", (c) => c.charCodeAt(0)), // این باید یکتا و ثابت باشه برای هر کاربر
      name: "user@example.com",
      displayName: "داش رضا",
    },
    pubKeyCredParams: [
      {
        type: "public-key",
        alg: -7, // ES256
      },
    ],
    timeout: 60000,
    attestation: "direct",
    authenticatorSelection: {
      authenticatorAttachment: "platform",
      userVerification: "required",
    },
  };

  try {
    const credential = await navigator.credentials.create({ publicKey });
    const parsed = {
      id: credential.id,
      rawId: bufferToBase64(credential.rawId),
      type: credential.type,
    };

    return JSON.stringify(parsed);
  } catch (err) {
    return `Error in registration: ${err.message}`;
  }
}

async function authenticateWithFingerprint(credentialId) {
  const publicKey = {
    challenge: new Uint8Array(32),
    allowCredentials: [
      {
        id: credentialId,
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

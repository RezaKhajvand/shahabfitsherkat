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
      response: {
        attestationObject: bufferToBase64(
          credential.response.attestationObject
        ),
        clientDataJSON: bufferToBase64(credential.response.clientDataJSON),
      },
    };

    return JSON.stringify(parsed);
  } catch (err) {
    return `Error in registration: ${err.message}`;
  }
}



async function authenticateWithFingerprint(credentialIdBase64) {
  const publicKey = {
    challenge: Uint8Array.from("someAuthChallenge", (c) => c.charCodeAt(0)),
    timeout: 60000,
    allowCredentials: [
      {
        id: Uint8Array.from(atob(credentialIdBase64), (c) => c.charCodeAt(0)),
        type: "public-key",
        transports: ["internal"],
      },
    ],
    userVerification: "required",
  };

  try {
    const assertion = await navigator.credentials.get({ publicKey });

    const parsed = {
      id: assertion.id,
      rawId: bufferToBase64(assertion.rawId),
      type: assertion.type,
      response: {
        authenticatorData: bufferToBase64(assertion.response.authenticatorData),
        clientDataJSON: bufferToBase64(assertion.response.clientDataJSON),
        signature: bufferToBase64(assertion.response.signature),
        userHandle: assertion.response.userHandle
          ? bufferToBase64(assertion.response.userHandle)
          : null,
      },
    };

    return JSON.stringify(parsed);
  } catch (err) {
    return `Error in auth: ${err.message}`;
  }
}

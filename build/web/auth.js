function bufferToBase64(buffer) {
  return btoa(String.fromCharCode(...new Uint8Array(buffer)));
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
    };

    return JSON.stringify(parsed);
  } catch (err) {
    return `Error in auth: ${err.message}`;
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

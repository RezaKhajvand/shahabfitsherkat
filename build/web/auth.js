function base64ToUint8Array(base64String) {
  const padding = "=".repeat((4 - (base64String.length % 4)) % 4);
  const base64 = (base64String + padding).replace(/-/g, "+").replace(/_/g, "/");
  const rawData = window.atob(base64);
  const outputArray = new Uint8Array(rawData.length);
  for (let i = 0; i < rawData.length; ++i) {
    outputArray[i] = rawData.charCodeAt(i);
  }
  return outputArray;
}

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
      id: Uint8Array.from("userId1234", (c) => c.charCodeAt(0)),
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
      rawId: bufferToBase64(credential.rawId), // ← اینو ذخیره کن توی سرور
      type: credential.type,
    };
    return JSON.stringify(parsed);
  } catch (err) {
    return `Error in registration: ${err.message}`;
  }
}

async function authenticateWithFingerprint(credentialIdBase64) {
  const credentialId = base64ToUint8Array(credentialIdBase64);

  const publicKey = {
    challenge: new Uint8Array(32), // در حالت واقعی از سرور بگیر
    allowCredentials: [
      {
        id: credentialId.buffer,
        type: "public-key",
        transports: ["internal"],
      },
    ],
    userVerification: "required",
    timeout: 60000,
  };

  try {
    const assertion = await navigator.credentials.get({ publicKey });
    return JSON.stringify({
      id: assertion.id,
      rawId: bufferToBase64(assertion.rawId),
      type: assertion.type,
    });
  } catch (err) {
    return `error:${err.message}`;
  }
}

// web/auth.js

async function authenticateWithFingerprint() {
  try {
    const publicKey = {
      challenge: Uint8Array.from('randomChallenge123', c => c.charCodeAt(0)),
      timeout: 60000,
      userVerification: 'required',
      allowCredentials: [],
    };

    const credential = await navigator.credentials.get({
      publicKey: publicKey,
    });

    return JSON.stringify(credential);
  } catch (err) {
    return `Error: ${err.message}`;
  }
}

importScripts('https://www.gstatic.com/firebasejs/10.12.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.12.0/firebase-messaging-compat.js');

firebase.initializeApp({
   apiKey: 'AIzaSyAMg4M2VcIQKllw9fAYVAdnvFppFUGxyQA',
    appId: '1:340889079632:web:2ecc2bcc90b129e8d5a655',
    messagingSenderId: '340889079632',
    projectId: 'dynup-d424c',
    authDomain: 'dynup-d424c.firebaseapp.com',
    storageBucket: 'dynup-d424c.firebasestorage.app',
    measurementId: 'G-HEP7V5QS27',
});

const messaging = firebase.messaging();

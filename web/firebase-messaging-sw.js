importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyDy25CcvrOqheB9LCR_N-ChFnsBg8jbV4A",
  authDomain: "help-corona-84f63.firebaseapp.com",
  databaseURL: "https://help-corona-84f63.firebaseio.com",
  projectId: "help-corona-84f63",
  storageBucket: "help-corona-84f63.appspot.com",
  messagingSenderId: "376252362790",
  appId: "1:376252362790:web:f530312076c3df3cf0f6e7",
  measurementId: "G-K13V83L4KZ"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});
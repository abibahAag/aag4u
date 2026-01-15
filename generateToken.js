// const { GoogleAuth } = require ( 'google-auth-library' );
// const auth = new  GoogleAuth ({
//   keyFile : './serviceaccount.json' ,   // Jalur ke berkas kunci JSON yang Anda unduh
//   scopes : 'https://www.googleapis.com/auth/firebase.messaging'
//  });

// async  function  getAccessToken ( ) {
//   const client = await auth.getClient (); const
//   accessToken = await client.getAccessToken (); return accessToken.token ; }
//   getAccessToken (). then ( token = > { console.log ( 'Token OAuth2 yang Dihasilkan:' , token); // Gunakan token ini untuk permintaan Firebase Anda
//     } ). catch ( error => { console.error ( ' Terjadi kesalahan saat menghasilkan token:' , error); });

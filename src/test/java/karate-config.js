function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  
  karate.log('karate-config.js - environment:', env);
  
  var config = {
    env: env,
    apiBaseUrl: 'http://bp-se-test-cabcd9b246a5.herokuapp.com',
    username: 'edimaldo',
    port_marvel_api: 'http://bp-se-test-cabcd9b246a5.herokuapp.com'
  };

  karate.log('karate-config.js - config:', config);

  // Configurar variables según el entorno
  if (env === 'dev') {
    // Configuración para entorno de desarrollo
  } else if (env === 'qa') {
    // Configuración para entorno QA
  }
  
  karate.log('karate-config.js - final config:', config);

  return config;
}

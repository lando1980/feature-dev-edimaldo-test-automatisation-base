function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  
  karate.log('karate-config.js - environment:', env);
  
  var config = {
    env: env,
    port_marvel_api: 'http://bp-se-test-cabcd9b246a5.herokuapp.com',
    testUserName: 'edimaldo'
  };

  karate.log('karate-config.js - config:', config);

  // Configurar variables según el entorno
  if (env === 'dev') {
    config.username = 'edimaldo';
  } else if (env === 'qa') {
    config.username = 'qauser';
  }
  
  karate.log('karate-config.js - final config:', config);

  return config;
}

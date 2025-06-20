function fn() {
  var env = karate.env || 'dev';
  karate.log('karate.env system property was:', env);
  
  // Configuración base para todos los entornos
  var config = {
    env: env,
    baseUrl: 'http://bp-se-test-cabcd9b246a5.herokuapp.com',
    username: 'edimaldo'
  };
  
  // URLs para todos los microservicios (con formato estándar port_nombre_microservicio)
  config.port_marvel_api = 'http://bp-se-test-cabcd9b246a5.herokuapp.com';
  
  karate.log('karate-config.js - environment:', env);
  karate.log('karate-config.js - config:', config);
  
  // Configuración específica por entorno
  if (env == 'dev') {
    // Configuración para entorno de desarrollo
  } else if (env == 'qa') {
    // Configuración para entorno QA
  }
  
  karate.log('karate-config.js - final config:', config);
  
  return config;
}

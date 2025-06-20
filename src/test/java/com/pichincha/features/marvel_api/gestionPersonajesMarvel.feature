@REQ_dev-edimaldo001 @HU001 @marvel_characters_api @marvel_api @Agente2 @E2 @iniciativa_api_test
Feature: dev-edimaldo001 API de Personajes Marvel (microservicio para gestionar personajes de Marvel)

  Background:
    * url port_marvel_api
    * def username = 'edimaldo'
    * def basePath = '/' + username + '/api/characters'
    * configure ssl = true
    * configure headers = { 'Content-Type': 'application/json' }
    * def createCharacter = read('classpath:data/marvel_api/request_create_character.json')
    * def updateCharacter = read('classpath:data/marvel_api/request_update_character.json')
    * def invalidCharacter = read('classpath:data/marvel_api/request_create_character_invalid.json')

  @id:1 @obtenerPersonajes @respuestaExitosa200
  Scenario: T-API-dev-edimaldo001-CA01-Obtener todos los personajes 200 - karate
    Given path basePath
    When method get
    Then status 200
    # And match response == '#array'
    # And match each response contains { id: '#number', name: '#string' }

  @id:2 @obtenerPersonajePorId @respuestaExitosa200
  Scenario: T-API-dev-edimaldo001-CA02-Obtener personaje por ID existente 200 - karate
    * def idPersonaje = '1'
    Given path basePath + '/' + idPersonaje
    When method get
    Then status 200
    # And match response.name == '#string'
    # And match response.id == '#number'

  @id:3 @obtenerPersonajePorId @respuestaNoEncontrado404
  Scenario: T-API-dev-edimaldo001-CA03-Obtener personaje por ID inexistente 404 - karate
    * def idInexistente = '999'
    Given path basePath + '/' + idInexistente
    When method get
    Then status 404
    # And match response.error == 'Character not found'
    # And match response == { error: '#string' }

  @id:4 @crearPersonaje @respuestaCreado201
  Scenario: T-API-dev-edimaldo001-CA04-Crear personaje exitosamente 201 - karate
    Given path basePath
    And request createCharacter
    When method post
    Then status 201
    # And match response.id == '#number'
    # And match response.name == createCharacter.name

  @id:5 @crearPersonaje @respuestaDuplicado400
  Scenario: T-API-dev-edimaldo001-CA05-Crear personaje con nombre duplicado 400 - karate
    # Primero creamos un personaje
    Given path basePath
    And request createCharacter
    When method post
    Then status 201

    # Intentamos crear el mismo personaje nuevamente
    Given path basePath
    And request createCharacter
    When method post
    Then status 400
    # And match response.error == 'Character name already exists'
    # And match response == { error: '#string' }

  @id:6 @crearPersonaje @respuestaDatosInvalidos400
  Scenario: T-API-dev-edimaldo001-CA06-Crear personaje con campos requeridos faltantes 400 - karate
    Given path basePath
    And request invalidCharacter
    When method post
    Then status 400
    # And match response.name == 'Name is required'
    # And match response contains { name: '#string' }

  @id:7 @actualizarPersonaje @respuestaExitosa200
  Scenario: T-API-dev-edimaldo001-CA07-Actualizar personaje existente 200 - karate
    # Primero creamos un personaje
    Given path basePath
    And request createCharacter
    When method post
    Then status 201
    * def idCreado = response.id

    # Actualizamos el personaje
    Given path basePath + '/' + idCreado
    And request updateCharacter
    When method put
    Then status 200
    # And match response.description == updateCharacter.description
    # And match response.id == idCreado

  @id:8 @actualizarPersonaje @respuestaNoEncontrado404
  Scenario: T-API-dev-edimaldo001-CA08-Actualizar personaje inexistente 404 - karate
    * def idInexistente = '999'
    Given path basePath + '/' + idInexistente
    And request updateCharacter
    When method put
    Then status 404
    # And match response.error == 'Character not found'
    # And match response == { error: '#string' }

  @id:9 @eliminarPersonaje @respuestaExitosa204
  Scenario: T-API-dev-edimaldo001-CA09-Eliminar personaje existente 204 - karate
    # Primero creamos un personaje
    Given path basePath
    And request createCharacter
    When method post
    Then status 201
    * def idCreado = response.id

    # Eliminamos el personaje
    Given path basePath + '/' + idCreado
    When method delete
    Then status 204

  @id:10 @eliminarPersonaje @respuestaNoEncontrado404
  Scenario: T-API-dev-edimaldo001-CA10-Eliminar personaje inexistente 404 - karate
    * def idInexistente = '999'
    Given path basePath + '/' + idInexistente
    When method delete
    Then status 404
    # And match response.error == 'Character not found'
    # And match response == { error: '#string' }

  @id:11 @errorServidor @respuestaError500
  Scenario: T-API-dev-edimaldo001-CA11-Error interno del servidor 500 - karate
    # Este escenario simula un error interno del servidor, lo cual podría requerir un mock o una URL específica para error
    * def invalidUrl = port_marvel_api + '/invalid-endpoint'
    Given url invalidUrl
    When method get
    Then status 500
    # And match response == '#object'
    # And match response contains { error: '#string' }

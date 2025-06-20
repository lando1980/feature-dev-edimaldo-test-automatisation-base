package com.pichincha;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testMarvelAPI() {
        return Karate.run("classpath:com/pichincha/features/marvel_api/gestionPersonajesMarvel.feature");
    }
}

package com.pichincha;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testMarvelAPI() {
        return Karate.run("features/marvel_api/gestionPersonajesMarvel.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testAll() {
        return Karate.run("features").relativeTo(getClass());
    }
}

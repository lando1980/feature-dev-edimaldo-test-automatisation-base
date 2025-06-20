package com.pichincha;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class MarvelApiTest {
    
    @BeforeAll
    public static void setup() {
        System.setProperty("karate.env", "dev");
        System.setProperty("karate.ssl", "true");
    }
    
    @Test
    void testFeatures() {
        // Ruta al archivo feature específico
        Results results = Runner.path("classpath:com/pichincha/features/marvel_api/gestionPersonajesMarvel.feature")
                .outputCucumberJson(true)
                .parallel(1); 
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}

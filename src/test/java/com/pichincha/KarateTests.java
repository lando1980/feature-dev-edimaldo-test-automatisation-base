package com.pichincha;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Disabled;
import java.io.File;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class KarateTests {

    @Test
    @Disabled("Usando TestRunner para evitar ejecuciones duplicadas")
    void testAll() {
        Results results = Runner.path("classpath:com/pichincha/features")
                .tags("~@ignore")
                .outputCucumberJson(true)
                .parallel(1);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    
    public static void generateReport(String karateOutputPath) {
        // Aquí podrías generar reportes HTML si lo necesitas en el futuro
        System.out.println("Reports generated at: " + karateOutputPath);
    }
}

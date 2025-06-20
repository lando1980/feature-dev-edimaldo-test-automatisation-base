import com.intuit.karate.junit5.Karate;

class KarateBasicTest {
    static {
        System.setProperty("karate.ssl", "true");
    }
    
    @Karate.Test
    Karate testBasic() {
        return Karate.run("classpath:karate-test.feature");
    }
    
    @Karate.Test
    Karate testMarvelAPI() {
        return Karate.run("classpath:com/pichincha/features/marvel_api/gestionPersonajesMarvel.feature");
    }

}

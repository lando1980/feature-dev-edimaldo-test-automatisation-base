import com.intuit.karate.junit5.Karate;

class KarateBasicTest {
    static {
        System.setProperty("karate.ssl", "true");
        System.setProperty("karate.env", "dev");
    }
    
    @Karate.Test
    Karate testBasic() {
        return Karate.run("classpath:karate-test.feature");
    }
}

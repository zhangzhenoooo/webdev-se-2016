import com.jfinal.core.JFinal;

public class Application {

    public static void main(String[] args) {
        JFinal.start("web-app/src/main/webapp", 8080, "/", 15);
    }
}

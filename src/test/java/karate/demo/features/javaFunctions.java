package karate.demo.features;

public class javaFunctions {
    public String nonstaticMethod(String arg)
    {
        return "hello"+arg;
    }
    public static String staticMethod(String arg)
    {
        return "hello"+arg;
    }
}


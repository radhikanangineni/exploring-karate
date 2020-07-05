package karate.demo.features;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

public class WriteData {

    public static void writeData(String arg) throws FileNotFoundException, UnsupportedEncodingException {
        PrintWriter writer = new PrintWriter("data.csv", "UTF-8");
        writer.println(arg);
        writer.close();
    }
    public static void writeListOfObjects(List<Object> inputList) throws FileNotFoundException, UnsupportedEncodingException {

        PrintWriter writer = new PrintWriter("data.xls", "UTF-8");
        ObjectMapper mapper = new ObjectMapper();
        for (int i = 0; i < inputList.size(); i++) {
            ModelJava modelJava = mapper.convertValue(inputList.get(i), ModelJava.class);
            System.out.println("in Java writeListOfObjects modelJava: " + modelJava);
            writer.println(modelJava.getId() + "\t" + modelJava.getFirstName() + "\t" + modelJava.getLastName() + "\t" + modelJava.getEmail() + "\t" + modelJava.getAvatar());
        }
        writer.close();
    }
}

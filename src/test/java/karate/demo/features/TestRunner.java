package karate.demo.features;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertTrue;

@KarateOptions(tags={"~@ignore"})
public class TestRunner {
    @Test
    public void testParallel() {
      //  System.setProperty("karate.env", "demo"); // ensure reset if other tests (e.g. mock) had set env in CI
        Results results = Runner.parallel(getClass(),1);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}

//import com.intuit.karate.junit5.Karate;
//
//public class TestRunner {
//    @Karate.Test
//    Karate testSample() {
//        return Karate.run("userDetails").relativeTo(getClass());
//    }
//}
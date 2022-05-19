package utils;

import org.yaml.snakeyaml.Yaml;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URL;
import java.util.HashMap;

public class LoadYaml {

    public static <T> HashMap<String, T> getYaml(String path) throws FileNotFoundException {
        HashMap<String, T> map = new HashMap();
        Yaml yaml = new Yaml();
        map = yaml.load(new FileInputStream(path));
        return map;
    }

    public static void main(String[] args) throws FileNotFoundException {
        HashMap<String, Object> yaml = LoadYaml.<Object>getYaml("D:\\work\\Group2\\src\\main\\config\\hive.yaml");
        System.out.println(yaml.get("hive_config"));
    }
}



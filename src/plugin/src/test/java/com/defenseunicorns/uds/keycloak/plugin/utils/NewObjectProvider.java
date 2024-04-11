package com.defenseunicorns.uds.keycloak.plugin.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public final class NewObjectProvider {

    private NewObjectProvider() {
        // hide public constructor. No need to ever declare an instance. All methods are static.
    }

    /**
     * Get new java.io.File object.
     *
     * @param filePath a String
     * @return File
     */
    public static File getFile(final String filePath) {
        return new File(filePath);
    }

    /**
     * Get new java.io.FileInputStream object.
     *
     * @param file a File object
     * @return FileInputStream
     */
    public static FileInputStream getFileInputStream(final File file) throws FileNotFoundException {
        return new FileInputStream(file);
    }

    /**
     * Parse YAML content from a file and return the resulting map.
     *
     * @param file File containing YAML content
     * @return Map representing the parsed YAML content
     * @throws FileNotFoundException if the file is not found
     */
    public static Map<String, Object> parseYaml(File file) throws FileNotFoundException {
        Map<String, Object> yamlMap = new HashMap<>();

        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(": ", 2);
                if (parts.length == 2) {
                    yamlMap.put(parts[0], parts[1]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return yamlMap;
    }

    /**
     * Get YAML content from a file and return the resulting map.
     *
     * @param filePath path to the YAML file
     * @return Map representing the parsed YAML content
     * @throws FileNotFoundException if the file is not found
     */
    public static Map<String, Object> getYaml(String filePath) throws FileNotFoundException {
        File file = getFile(filePath);
        return parseYaml(file);
    }
}

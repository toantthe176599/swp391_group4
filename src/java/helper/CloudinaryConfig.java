/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import com.cloudinary.*;
import com.cloudinary.utils.ObjectUtils;
import config.cloudInformation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import java.util.Map;

@MultipartConfig
public class CloudinaryConfig {

    private static CloudinaryConfig cloudinary;

    private CloudinaryConfig() {
    }

    public static CloudinaryConfig createInstance() {
        if (cloudinary == null) {
            cloudinary = new CloudinaryConfig();
        }
        return cloudinary;
    }

    public String uploadImageToCloud(File file) {
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dzxdmal8i",
                "api_key", "958121127785261",
                "api_secret", "_K9fTlWCcnIIAO5ZKvbqPGcgBkk"));
        cloudinary.config.secure = true;
        System.out.println(cloudinary.config.cloudName);
        try {

            Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
            System.out.println(uploadResult.get("url"));
            return (String) uploadResult.get("url");
        } catch (Exception e) {
            System.out.println(e);
            return "";
        }
    }

    public File createFileToUpload(HttpServletRequest req, String fileName) throws IOException, ServletException {
        Part part = req.getPart(fileName);
        String realPart = req.getServletContext().getRealPath("/images");
        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Path.of(realPart))) {
            Files.createDirectory(Path.of(realPart));
        }
        String pathName = realPart + "/" + filename;
        File file = new File(pathName);
        part.write(realPart + "/" + filename);
        return file;
    }

    public static void main(String[] args) throws IOException {

        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", cloudInformation.CLOUD_NAME,
                "api_key", cloudInformation.CLOUD_API_KEY,
                "api_secret", cloudInformation.CLOUD_SECRET_KEY));
        cloudinary.config.secure = true;
        System.out.println(cloudinary.config.cloudName);
        try {
            File file = new File("/images/AK.jpg");
            Map uploadResult = cloudinary.uploader().upload("https://upload.wikimedia.org/wikipedia/commons/a/ae/Olympic_flag.jpg", ObjectUtils.emptyMap());
            System.out.println(uploadResult.get("url"));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

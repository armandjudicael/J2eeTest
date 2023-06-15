package mg.javaee.test.ressources;

import com.github.javafaker.Faker;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import mg.javaee.test.entity.Person;
import mg.javaee.test.service.PersonService;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.*;

@WebServlet(name = "PersonList",value = {"/","/PersonList", "/addPerson"})
@MultipartConfig(
        fileSizeThreshold = 1024*1024,
        maxFileSize = 1024*1024*100,
        maxRequestSize = 1024*1024*100
)
public class PersonRessources extends HttpServlet {
    private PersonService personService;
    private static  final  String UPLOAD_DIRECTORY = "uploads";
    private static final String ATTACH_DIRECTORY_NAME = "attach";
    @Override
    public void init(ServletConfig config) throws ServletException {
        personService = PersonService.getInstance();
        personService.saveAll(generateMockPersons(10));
    }

    public static List<Person> generateMockPersons(int count) {
        Faker faker = new Faker(new Locale("en-GB"));
        List<Person> persons = new ArrayList<>();

        for (int i = 0; i < count; i++) {
            Person person = new Person();
            person.setNom(faker.name().lastName());
            person.setPrenom(faker.name().firstName());
            person.setDescription(faker.lorem().sentence());
            person.setContact(faker.phoneNumber().phoneNumber());
            person.setEmail(faker.internet().emailAddress());
            person.setSkills(generateRandomSkills(faker));
            person.setCountry(faker.address().country());
            person.setRate(faker.currency().code() + " " + faker.number().randomDouble(2, 10, 100));
            person.setField(faker.job().field());
            person.setAddress(faker.address().fullAddress());
            person.setStar(faker.number().randomDouble(2, 1, 10));
            person.setAttachments(generateAttachments());

            persons.add(person);
        }

        return persons;
    }

    private static List<String> generateRandomSkills(Faker faker) {
        List<String> skills = new ArrayList<>();
        int skillsCount = faker.random().nextInt(1, 5);

        for (int i = 0; i < skillsCount; i++) {
            skills.add(faker.job().keySkills());
        }

        return skills;
    }

    private static Map<String, Byte[]> generateAttachments() {
        Map<String, Byte[]> attachments = new HashMap<>();
        String rootPath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
        String attachmentsDirectoryPath = rootPath + ATTACH_DIRECTORY_NAME;
        File attachDirectory = new File(attachmentsDirectoryPath);
        // Generate mock attachments from the files in the directory
        if (attachDirectory.exists() && attachDirectory.isDirectory()) {
            File[] files = attachDirectory.listFiles();
            if (files != null) {
                for (File file : files) {
                    try {
                        byte[] fileData = Files.readAllBytes(file.toPath());
                        Byte[] fileDataWrapper = toWrapperArray(fileData);
                        attachments.put(file.getName(), fileDataWrapper);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return attachments;
    }
    private static Byte[] toWrapperArray(byte[] byteArray) {
        Byte[] wrapperArray = new Byte[byteArray.length];
        for (int i = 0; i < byteArray.length; i++) {
            wrapperArray[i] = byteArray[i];
        }
        return wrapperArray;
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Person> personList = personService.findAll();
        System.out.println(personList.get(0).getAttachments().size());
        req.setAttribute("personList",personList);
        req.getRequestDispatcher("/jsp/index.jsp").forward(req,resp);
    }
    private void extractInfo(HttpServletRequest req) throws ServletException, IOException {
        // Retrieve uploaded file
        Part filePart = req.getPart("profil_picture");
        String fileName = filePart.getSubmittedFileName();
        persistUser(req, filePart, fileName);
    }

    private void persistUser(HttpServletRequest req, Part filePart, String fileName) throws IOException, ServletException {
        // Retrieve form data
        String nom = req.getParameter("nom");
        String prenom = req.getParameter("prenom");
        String adresse = req.getParameter("adresse");
        String contact = req.getParameter("contact");
        String description = req.getParameter("description");
        String star= req.getParameter("rate");
        String email = req.getParameter("email");
        Double payRate = Double.parseDouble(req.getParameter("pay-rate"));
        String country = req.getParameter("country");
        String[] selectedItems = req.getParameterValues("selectedItems");
        String selectedJob = req.getParameter("job");

        List<String> list = selectedItems!=null ? List.of(selectedItems) : new ArrayList<>();

        Person person = Person.builder()
                .nom(nom)
                .prenom(prenom)
                .address(adresse)
                .contact(contact)
                .description(description)
                .rate(star)
                .field(selectedJob)
                .email(email)
                .skills(list)
                .star(payRate)
                .country(country)
                .profil(toBytes(filePart.getInputStream()))
                .attachments(extractDocuments(req))
                .build();

        personService.save(person);
    }

    private Byte[] toBytes( InputStream inputStream ){
        Byte[] byteObjects = {};
        try {
            byte[] byteArray = IOUtils.toByteArray(inputStream);
            // Convert byte array to Byte[]
             byteObjects = new Byte[byteArray.length];
            int i = 0;
            for (byte b : byteArray) {
                byteObjects[i++] = b; // Autoboxing
            }
            return byteObjects;
        } catch (IOException e) {
            // Handle the exception
        } finally {
            IOUtils.closeQuietly(inputStream);
        }
        return byteObjects;
    }
    // Utility method to extract the file name from a Part
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
    private Map<String,Byte[]> extractDocuments(HttpServletRequest req) throws ServletException, IOException {
        // Get the collection of uploaded parts
        Collection<Part> parts = req.getParts();
        Map<String,Byte[]> map = new java.util.HashMap<>();
        // Iterate over the parts and process each uploaded file
        for (Part part : parts) {
            // Check if the part belongs to the "upload-documents" div
            if (part.getName().startsWith("attach-")) {
                // Extract the filename from the part
                String fileName = getFileName(part);
                try (InputStream input = part.getInputStream()) {
                    map.put(fileName,toBytes(input));
                }
            }
        }
         return map;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       extractInfo(req);
        // Retrieve form data
        String nom = req.getParameter("nom")+req.getParameter("prenom") ;
       req.setAttribute("name",nom);
       req.getRequestDispatcher("/jsp/success.jsp").forward(req,resp);
    }

}

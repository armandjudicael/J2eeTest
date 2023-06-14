package mg.javaee.test.ressources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mg.javaee.test.entity.Person;
import mg.javaee.test.service.PersonService;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

@WebServlet("/downloadAttachment")
public class DownloadAttachmentServlet extends HttpServlet {

    private PersonService personService;
    /**
     * @throws ServletException
     */
    @Override
    public void init() throws ServletException {
        personService = PersonService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long personId = Long.parseLong(request.getParameter("personId"));
        String filename = request.getParameter("filename");
        boolean isDownload = Boolean.parseBoolean(request.getParameter("download"));

        // Retrieve the Person object based on the personId from your data source
        Person person = personService.findById(personId);

        if (person != null) {
            // Retrieve the attachment byte array from the Person's attachements map based on the filename
            Map<String, Byte[]> attachments = person.getAttachements();
            Byte[] attachmentBytes = attachments.get(filename);

            if (attachmentBytes != null) {
                response.setContentType(getContentType(filename));
                response.setContentLength(attachmentBytes.length);

                if (isDownload) {
                    // Set response headers for downloading the file
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
                }

                try (OutputStream out = response.getOutputStream()) {
                    for (byte b : attachmentBytes) {
                        out.write(b);
                    }
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private String getContentType(String filename) {
        // Determine the content type based on the file extension or your specific logic
        // You can use a library like Apache Tika for more accurate content type detection
        if (filename.endsWith(".pdf")) {
            return "application/pdf";
        } else if (filename.endsWith(".jpg") || filename.endsWith(".jpeg")) {
            return "image/jpeg";
        } else if (filename.endsWith(".png")) {
            return "image/png";
        } else {
            return "application/octet-stream";
        }
    }
}

package mg.javaee.test.ressources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mg.javaee.test.entity.Person;
import mg.javaee.test.service.PersonService;

import java.io.IOException;


@WebServlet(name = "DeleteAttachementServlet",value = {"/DeleteAttachementServlet"})
public class DeleteAttachmentServlet extends HttpServlet{
    /**
     * @throws ServletException
     */
    private PersonService personService;
    @Override
    public void init() throws ServletException {
       personService = PersonService.getInstance();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the personId and filename from the request parameters
        Long personId = Long.parseLong(request.getParameter("personId"));
        String filename = request.getParameter("filename");
        personService.removeAttachement(personId,filename);
        // Redirect back to the previous page or any other desired destination
        response.sendRedirect("PersonList");
    }
}
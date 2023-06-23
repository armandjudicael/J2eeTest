package mg.javaee.test.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mg.javaee.test.service.PersonRepository;

import java.io.IOException;


@WebServlet(name = "DeleteAttachementServlet",value = {"/DeleteAttachementServlet"})
public class DeleteAttachmentServlet extends HttpServlet{
    /**
     * @throws ServletException
     */
    private PersonRepository personRepository;
    @Override
    public void init() throws ServletException {
       personRepository = PersonRepository.getInstance();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the personId and filename from the request parameters
        Long personId = Long.parseLong(request.getParameter("personId"));
        String filename = request.getParameter("filename");
        personRepository.removeAttachement(personId,filename);
        // Redirect back to the previous page or any other desired destination
        response.sendRedirect("PersonList");
    }
}
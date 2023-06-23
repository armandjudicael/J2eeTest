package mg.javaee.test.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mg.javaee.test.service.PersonRepository;

import java.io.IOException;

@WebServlet(name = "DeleteCandidateServlet",value = {"/DeleteCandidateServlet"})
public class DeleteCandidateServlet extends HttpServlet {

    private PersonRepository personRepository;

    /**
     * @throws ServletException
     */
    @Override
    public void init() throws ServletException {
       personRepository = PersonRepository.getInstance();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve the candidate ID from the request
        Long personId = Long.parseLong(req.getParameter("personId")) ;
        req.setAttribute("personId",personId);
        req.getRequestDispatcher("/jsp/DeleteConfirmation.jsp").forward(req,resp);
    }

    /**
     * @param req  the {@link HttpServletRequest} object that contains the request the client made of the servlet
     * @param resp the {@link HttpServletResponse} object that contains the response the servlet returns to the client
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long personId = Long.parseLong(req.getParameter("personId")) ;
        personRepository.deleteById(personId);
        resp.sendRedirect("PersonList");
    }
}

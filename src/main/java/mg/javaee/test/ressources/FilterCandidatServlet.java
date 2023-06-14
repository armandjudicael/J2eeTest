package mg.javaee.test.ressources;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mg.javaee.test.entity.Person;
import mg.javaee.test.service.PersonService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterCandidatServlet",value = {"/FilterCandidatServlet"})
public class FilterCandidatServlet extends HttpServlet {
    /**
     * @throws ServletException
     */
    private PersonService personService;
    @Override
    public void init() throws ServletException {
        personService = PersonService.getInstance();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data
        String nom = req.getParameter("value-filter");
        List<Person> byName = personService.findByName(nom);
        req.setAttribute("personList",byName);
        req.getRequestDispatcher("/jsp/index.jsp").forward(req,resp);
    }
}
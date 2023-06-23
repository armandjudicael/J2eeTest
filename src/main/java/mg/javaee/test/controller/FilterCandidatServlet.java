package mg.javaee.test.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mg.javaee.test.entity.Person;
import mg.javaee.test.service.PersonRepository;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterCandidatServlet",value = {"/FilterCandidatServlet"})
public class FilterCandidatServlet extends HttpServlet {
    /**
     * @throws ServletException
     */
    private PersonRepository personRepository;
    @Override
    public void init() throws ServletException {
        personRepository = PersonRepository.getInstance();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data
        String nom = req.getParameter("value-filter");
        List<Person> byName = personRepository.findByName(nom);
        if (byName.isEmpty())
        req.setAttribute("personList",byName);
        else req.setAttribute("personList", personRepository.findAll());
        req.getRequestDispatcher("/jsp/index.jsp").forward(req,resp);
    }
}
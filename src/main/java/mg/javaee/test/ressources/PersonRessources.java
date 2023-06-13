package mg.javaee.test.ressources;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mg.javaee.test.service.PersonService;

import java.io.IOException;

@WebServlet(name = "Person List",value = {"/","/PersonList"})
public class PersonRessources extends HttpServlet {
    /**
     * @param config the <code>ServletConfig</code> object that contains configuration information for this servlet
     * @throws ServletException
     */
    private PersonService personService;
    @Override
    public void init(ServletConfig config) throws ServletException {
       personService = PersonService.getInstance();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/PersonList.jsp").forward(req,resp);
    }
}

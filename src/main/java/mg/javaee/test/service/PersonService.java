package mg.javaee.test.service;

import jakarta.ejb.Singleton;
import jakarta.ejb.Stateless;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;
import lombok.Data;
import mg.javaee.test.entity.Person;
import java.util.List;


@Data
public class PersonService  implements BasicServiceMethod<Person>{

  private static EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("pu");
  private static EntityManager entityManager = entityManagerFactory.createEntityManager();
  private static PersonService personService;
    public static PersonService getInstance (){
        if (personService == null)
            personService = new PersonService();
        return personService;
    }
    /**
     * @param object
     * @return
     */
    @Override
    public Person create(Person object) {
        entityManager.persist(object);
        return object;
    }
    /**
     * @param id
     * @return
     */
    @Override
    public Person updateById(Long id) {
        return null;
    }
    /**
     * @param object
     * @param id
     * @return
     */
    @Override
    public Person update(Person object, Long id) {
        return null;
    }
    /**
     * @param id
     * @return
     */
    @Override
    public Boolean deleteById(Long id) {
        return null;
    }

    /**
     * @param obejct
     * @return
     */
    @Override
    public Boolean delete(Person obejct) {
        return null;
    }

    /**
     * @return
     */
    @Override
    public List<Person> findAll() {
        return null;
    }
    /**
     * @param id
     * @return
     */
    @Override
    public Person findById(Long id) {
        return null;
    }
    // Other methods for CRUD operations
}
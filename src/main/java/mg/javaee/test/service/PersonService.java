package mg.javaee.test.service;

import jakarta.ejb.Singleton;
import jakarta.ejb.Stateless;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.*;
import lombok.Data;
import mg.javaee.test.entity.Person;
import org.hibernate.SessionFactory;

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
        entityManager.getTransaction().begin();
        entityManager.persist(object);
        entityManager.getTransaction().commit();
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
        String jpql = "SELECT p FROM Person p"; // Replace "Entity" with your entity class name
        TypedQuery<Person> query = entityManager.createQuery(jpql,Person.class);
        return query.getResultList();
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
package mg.javaee.test.service;

import jakarta.persistence.*;
import lombok.Data;
import mg.javaee.test.entity.Person;

import java.util.Collection;
import java.util.List;


@Data
public class PersonService  implements BasicServiceMethod<Person>{


    private static EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("pu");
    private static EntityManager em = entityManagerFactory.createEntityManager();
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
    public Collection<Person> saveAll(Collection<Person> object){
        for (Person person : object) {
            em.getTransaction().begin();
            em.persist(person);
            em.getTransaction().commit();
        }
        return object;
    }

    /**
     * @param object
     * @return
     */
    @Override
    public Person save(Person object) {
        em.getTransaction().begin();
        em.persist(object);
        em.getTransaction().commit();
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
        // Begin transaction
        em.getTransaction().begin();

        // Find the entity by ID
        Person entity = findById(id);

        if (entity != null)
            // Delete the entity
            em.remove(entity);

        // Commit the transaction
        em.getTransaction().commit();
        return true;
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
        TypedQuery<Person> query = em.createQuery(jpql,Person.class);
        return query.getResultList();
    }
    /**
     * @param id
     * @return
     */
    @Override
    public Person findById(Long id) {
       return em.find(Person.class, id);
    }

    // Other methods for CRUD operations
}
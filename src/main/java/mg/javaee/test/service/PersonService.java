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
    public Person save(Person object){
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

    public void removeAttachement(Long personId,String attachmentName){
        em.getTransaction().begin();
        Person person = em.find(Person.class, personId);
        if (person != null) {
            person.getAttachments().remove(attachmentName);
            em.merge(person);
        }
        em.getTransaction().commit();
    }

    public List<Person> findByName(String character){
        // Create the JPQL query
        String jpql = "SELECT p FROM Person p WHERE p.nom  LIKE :character or p.prenom  LIKE :character ";
// Execute the query
        TypedQuery<Person> query = em.createQuery(jpql, Person.class);
        query.setParameter("character", "%" + character + "%"); // Adding wildcards to match any occurrence of the character
        return query.getResultList();
    }


}
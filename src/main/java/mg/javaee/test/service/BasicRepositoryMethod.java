package mg.javaee.test.service;

import java.util.Collection;
import java.util.List;

public interface BasicRepositoryMethod<T>{
   Collection<T> saveAll(Collection<T> object);
   T save(T object);
   T updateById (Long id);

   T update(T object,Long id);

   Boolean deleteById(Long id);

   Boolean delete(T obejct);
   List<T> findAll();

   T findById(Long id);
}

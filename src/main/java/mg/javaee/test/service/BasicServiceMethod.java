package mg.javaee.test.service;

import java.util.List;

public interface BasicServiceMethod<T>{
   T create(T object);
   T updateById (Long id);

   T update(T object,Long id);

   Boolean deleteById(Long id);

   Boolean delete(T obejct);
   List<T> findAll();

   T findById(Long id);
}

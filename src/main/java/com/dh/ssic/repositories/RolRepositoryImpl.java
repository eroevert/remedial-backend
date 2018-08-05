package com.dh.ssic.repositories;

import com.dh.ssic.model.Rol;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class RolRepositoryImpl implements RolRepository  {


    @Override
    public Rol getRolById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("RolKey" , id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("RolKey" , Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetRol", parameters, classParameter);
        Rol Rol = new Rol();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            Rol.setRolKey((Integer) results.get(0)[0]);
            Rol.setName((String) results.get(0)[1]);
            Rol.setDescription((String) results.get(0)[2]);
        }
        return Rol;
    }

    @Override
    public <S extends Rol> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Rol> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Rol> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<Rol> findAll() {
        return null;
    }

    @Override
    public Iterable<Rol> findAllById(Iterable<Integer> integers) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Integer integer) {

    }

    @Override
    public void delete(Rol entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Rol> entities) {

    }

    @Override
    public void deleteAll() {

    }
}

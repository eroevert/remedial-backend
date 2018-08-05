package com.dh.ssic.repositories;

import com.dh.ssic.model.Rol;
import org.springframework.data.repository.CrudRepository;

public interface RolRepository extends CrudRepository<Rol, Integer> {
    public Rol getRolById(Integer id, EntityService entityService);
}
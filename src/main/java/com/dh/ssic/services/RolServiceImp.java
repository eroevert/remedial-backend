/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.Rol;
import com.dh.ssic.repositories.RolRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class RolServiceImp extends GenericServiceImplementation<Rol> implements RolService {
    RolRepository repository;

    public RolServiceImp(RolRepository rolRepository) {
        this.repository = rolRepository;
    }

    @Override
    protected CrudRepository<Rol, Integer> getRepository() {
        return repository;
    }
}



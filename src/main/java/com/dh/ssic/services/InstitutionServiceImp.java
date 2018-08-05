/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.Institution;
import com.dh.ssic.repositories.InstitutionRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class InstitutionServiceImp extends GenericServiceImplementation<Institution> implements InstitutionService {
    InstitutionRepository repository;

    public InstitutionServiceImp(InstitutionRepository repo) {
        this.repository = repo;
    }

    @Override
    protected CrudRepository<Institution, Integer> getRepository() {
        return repository;
    }
}



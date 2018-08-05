/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.TypeContact;

import com.dh.ssic.repository.TypeContactRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class TypeContactServiceImp extends GenericServiceImplementation<TypeContact> implements TypeContactService {
    TypeContactRepository repository;

    public TypeContactServiceImp(TypeContactRepository repo) {
        this.repository = repo;
    }

    @Override
    protected CrudRepository<TypeContact, Integer> getRepository() {
        return repository;
    }
}



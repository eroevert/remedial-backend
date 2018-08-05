/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.PersonalDocument;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repositories.PersonalDocumentRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class PersonalDocumentServiceImp extends GenericServiceImplementation<PersonalDocument> implements PersonalDocumentService {
    PersonalDocumentRepository repository;

    public PersonalDocumentServiceImp(PersonalDocumentRepository repo) {
        this.repository = repo;
    }

    @Override
    protected CrudRepository<PersonalDocument, Integer> getRepository() {
        return repository;
    }

    @Override
    public ReturnModel<PersonalDocument> findByEmployeeKey(int id) {
        return null;
    }
}



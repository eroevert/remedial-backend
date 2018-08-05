/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.ContactInformation;
import com.dh.ssic.repositories.ContactInformationRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class ContactInformationServiceImp extends GenericServiceImplementation<ContactInformation> implements ContactInformationService {
    ContactInformationRepository repository;

    public ContactInformationServiceImp(ContactInformationRepository repo) {
        this.repository = repo;
    }

    @Override
    protected CrudRepository<ContactInformation, Integer> getRepository() {
        return repository;
    }
}



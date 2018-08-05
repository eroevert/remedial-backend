/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.AcademicInformation;
import com.dh.ssic.repositories.AcademicInformationRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class AcademicInformationServiceImp extends GenericServiceImplementation<AcademicInformation> implements AcademicInformationService {
    AcademicInformationRepository repository;

    public AcademicInformationServiceImp(AcademicInformationRepository repo) {
        this.repository = repo;
    }

    @Override
    protected CrudRepository<AcademicInformation, Integer> getRepository() {
        return repository;
    }
}



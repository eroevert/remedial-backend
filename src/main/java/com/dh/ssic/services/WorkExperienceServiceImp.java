/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.WorkExperience;
import com.dh.ssic.repositories.WorkExperienceRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class WorkExperienceServiceImp extends GenericServiceImplementation<WorkExperience> implements WorkExperienceService {
    WorkExperienceRepository repository;

    public WorkExperienceServiceImp(WorkExperienceRepository repo) {
        this.repository = repo;
    }

    @Override
    protected CrudRepository<WorkExperience, Integer> getRepository() {
        return repository;
    }
}



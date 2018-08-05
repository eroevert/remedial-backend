package com.dh.ssic.services;

import com.dh.ssic.model.AcademicLevel;

import com.dh.ssic.repository.AcademicLevelRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class AcademicLevelServiceImpl extends GenericServiceImplementation<AcademicLevel> implements AcademicLevelService {
    private AcademicLevelRepository academicLevelRepository;

    public AcademicLevelServiceImpl(AcademicLevelRepository academicLevelRepository) {
        this.academicLevelRepository = academicLevelRepository;
    }

    @Override
    protected CrudRepository<AcademicLevel, Integer> getRepository() {
        return academicLevelRepository;
    }

}

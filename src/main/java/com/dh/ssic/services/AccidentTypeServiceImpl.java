package com.dh.ssic.services;

import com.dh.ssic.model.AccidentType;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.AccidentTypeRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccidentTypeServiceImpl extends GenericServiceImplementation<AccidentType> implements AccidentTypeService {
    private AccidentTypeRepository accidentTypeRepository;

    public AccidentTypeServiceImpl(AccidentTypeRepository accidentTypeRepository) {
        this.accidentTypeRepository = accidentTypeRepository;
    }

    @Override
    protected CrudRepository<AccidentType, Integer> getRepository() {
        return accidentTypeRepository;
    }

    @Override
    public List<AccidentType> getAllAccidentType(EntityService entityService) {
        return accidentTypeRepository.getAllAccidentType(entityService);
    }
}

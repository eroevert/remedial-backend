package com.dh.ssic.repository;
import com.dh.ssic.model.AccidentType;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AccidentTypeRepository extends CrudRepository<AccidentType, Integer> {
    public List<AccidentType> getAllAccidentType(EntityService entityService);
}

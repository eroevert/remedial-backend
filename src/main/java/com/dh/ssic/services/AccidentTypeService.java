package com.dh.ssic.services;

import com.dh.ssic.model.AccidentType;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface AccidentTypeService extends GenericService<AccidentType> {
    public List<AccidentType> getAllAccidentType(EntityService entityService);
}

package com.dh.ssic.services;

import com.dh.ssic.model.Accident;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.math.BigDecimal;
import java.util.List;

public interface AccidentService extends GenericService<Accident> {
    public List<Accident> getAllAccidents(EntityService entityService);
    public ReturnModel<Accident> getAccidentById(Integer id, EntityService entityService);
    public ReturnModel<BigDecimal> saveAccident(Accident equipmentAssignment, EntityService entityService);
    public ReturnModel<ReturnSPModel> updateAccident(Accident equipmentAssignment, EntityService entityService);
    public ReturnModel<Integer> deleteAccident(Integer id, EntityService entityService);
}

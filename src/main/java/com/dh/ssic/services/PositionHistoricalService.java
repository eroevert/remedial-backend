package com.dh.ssic.services;


import com.dh.ssic.model.PositionHistorical;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface PositionHistoricalService extends GenericService<PositionHistorical> {
    //public List<PositionHistorical> findByEmployeeKey(int employeeKey);
    public ReturnModel<List<PositionHistorical>> findByEmployeeKey(int employeeKey, EntityService entityService);
    public ReturnModel<ReturnSPModel> SavePositionHistorical(PositionHistorical model, EntityService entityService);
}

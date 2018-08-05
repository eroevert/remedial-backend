package com.dh.ssic.repository;

import com.dh.ssic.model.PositionHistorical;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface PositionHistoricalRepository extends CrudRepository<PositionHistorical, Integer> {
    public List<PositionHistorical> GetAllPositionsHistorical(EntityService entityService);
    public PositionHistorical GetPositionHistoricalById(Integer id, EntityService entityService);
    public List<PositionHistorical> GetPositionHistoricalByEmployee(Integer id, EntityService entityService);
    public ReturnSPModel SavePositionHistorical(PositionHistorical positionHistorical, EntityService entityService);
}
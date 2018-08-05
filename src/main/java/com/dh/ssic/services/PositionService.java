package com.dh.ssic.services;


import com.dh.ssic.model.Position;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface PositionService extends GenericService<Position> {
    public ReturnModel<List<Position>> GetPositions(EntityService entityService);
    public ReturnModel<Position> GetPositionById(Integer id, EntityService entityService);
}

package com.dh.ssic.repository;

import com.dh.ssic.model.Position;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionRepository extends CrudRepository<Position, Integer> {
    public List<Position> GetPositions(EntityService entityService);
    public Position GetPositionById(Integer id, EntityService entityService);
}

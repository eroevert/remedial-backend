package com.dh.ssic.repository;

import com.dh.ssic.model.HierarchicalLevel;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface HierarchicalLevelRepository extends CrudRepository<HierarchicalLevel, Integer> {
    public List<HierarchicalLevel> GetHierarchicalLevels(EntityService entityService);
    public HierarchicalLevel GetHierarchicalLevel(Integer id, EntityService entityService);
}

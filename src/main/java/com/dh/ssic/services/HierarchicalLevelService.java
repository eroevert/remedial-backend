package com.dh.ssic.services;


import com.dh.ssic.model.HierarchicalLevel;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface HierarchicalLevelService extends GenericService<HierarchicalLevel> {
    public ReturnModel<List<HierarchicalLevel>> GetHierarchicalLevels(EntityService entityService);
    public ReturnModel<HierarchicalLevel> GetHierarchicalLevel(Integer id, EntityService entityService);
}

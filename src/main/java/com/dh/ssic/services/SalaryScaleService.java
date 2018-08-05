package com.dh.ssic.services;


import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface SalaryScaleService extends GenericService<SalaryScale> {
    public ReturnModel<List<SalaryScale>> GetSalaryScales(EntityService entityService);
    public ReturnModel<SalaryScale> GetSalaryScaleById(Integer id, EntityService entityService);
}

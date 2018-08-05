package com.dh.ssic.repository;

import com.dh.ssic.model.Organization;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SalaryScaleRepository extends CrudRepository<SalaryScale, Integer> {
    public List<SalaryScale> GetSalaryScales(EntityService entityService);
    public SalaryScale GetSalaryScaleById(Integer id, EntityService entityService);
}

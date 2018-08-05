package com.dh.ssic.repository;

import com.dh.ssic.model.Position;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;

import java.math.BigDecimal;
import java.util.*;

public class SalaryScaleRepositoryImpl implements SalaryScaleRepository {

    public SalaryScaleRepositoryImpl() {
    }

    @Override
    public SalaryScale save(SalaryScale entity) {
        return null;
    }

    @Override
    public <S extends SalaryScale> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<SalaryScale> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<SalaryScale> findAll() {
        return null;
    }

    @Override
    public Iterable<SalaryScale> findAllById(Iterable<Integer> integers) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public void deleteById(Integer integer) {

    }

    @Override
    public void delete(SalaryScale entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends SalaryScale> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<SalaryScale> GetSalaryScales(EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("SPA_GetSalaryScales", parameters, classParameter);
        List<SalaryScale> result = new ArrayList<>();
        for (Object[] itemRes:results) {
            SalaryScale salaryScale = new SalaryScale();
            salaryScale.setSalaryScaleKey((Integer) itemRes[0]);
            salaryScale.setCurrencyKey((Integer) itemRes[1]);
            salaryScale.setName((String) itemRes[2]);
            salaryScale.setNumberCases((Integer) itemRes[3]);
            salaryScale.setBasicSalary((BigDecimal) itemRes[4]);
            salaryScale.setStatus((String) itemRes[5]);
            salaryScale.setStart((String) itemRes[6]);
            salaryScale.setEnd((String) itemRes[7]);

            result.add(salaryScale);
        }
        return result;
    }
    @Override
    public SalaryScale GetSalaryScaleById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("SalaryScaleKey", id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("SalaryScaleKey", Integer.class);
        List<Object[]> results = entityService.executeProcedure("getSalaryScale", parameters, classParameter);
        SalaryScale result = new SalaryScale();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            SalaryScale salaryScale = new SalaryScale();
            salaryScale.setCurrencyKey((Integer) results.get(0)[0]);
            salaryScale.setName((String) results.get(0)[1]);
            salaryScale.setNumberCases((Integer) results.get(0)[2]);
            salaryScale.setBasicSalary((BigDecimal) results.get(0)[3]);
            salaryScale.setStatus((String) results.get(0)[4]);
            salaryScale.setStart((String) results.get(0)[5]);
            salaryScale.setEnd((String) results.get(0)[6]);
            return salaryScale;
        }
        return null;
    }
}

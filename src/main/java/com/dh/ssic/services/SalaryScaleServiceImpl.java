package com.dh.ssic.services;


import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.*;

import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.CurrencyRepository;
import com.dh.ssic.repository.SalaryScaleRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Service
public class SalaryScaleServiceImpl extends GenericServiceImplementation<SalaryScale> implements SalaryScaleService {
    private SalaryScaleRepository salaryScaleRepository;
    private CurrencyRepository currencyRepository;
    public SalaryScaleServiceImpl(SalaryScaleRepository salaryScaleRepository,
                                  CurrencyRepository currencyRepository) {
        this.salaryScaleRepository = salaryScaleRepository;
        this.currencyRepository = currencyRepository;
    }
    @Override
    public ReturnModel<List<SalaryScale>> GetSalaryScales(EntityService entityService) {
        ReturnModel<List<SalaryScale>> result = new ReturnModel<>();
        try {
            List<SalaryScale> results =salaryScaleRepository.GetSalaryScales(entityService);
            if (results == null || results.size()== 0) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " is empty.");
                result.setCode(0);
            } else {
                result.setObject(results);
                result.setCode(1);
                for (SalaryScale salRes:results) {
                    Currency curRes = this.currencyRepository.GetCurrencyById(salRes.getCurrencyKey(), entityService);
                    salRes.setCurrencyByCurrencyKey(curRes!=null?curRes:new Currency());
                }
            }
        } catch (NotFoundException NFoundException) {
            result.setMessage(NFoundException.getMessage());
            result.setCode(0);
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
    @Override
    public ReturnModel<SalaryScale> GetSalaryScaleById(Integer id, EntityService entityService) {
        ReturnModel<SalaryScale> result = new ReturnModel<>();
        try {
            SalaryScale results = salaryScaleRepository.GetSalaryScaleById(id, entityService);
            if (results == null ) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " is empty.");
                result.setCode(0);
            } else {
                result.setObject(results);
                result.setCode(1);
            }
        } catch (NotFoundException NFoundException) {
            result.setMessage(NFoundException.getMessage());
            result.setCode(0);
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
    @Override
    protected CrudRepository<SalaryScale, Integer> getRepository() {
        return salaryScaleRepository;
    }

}

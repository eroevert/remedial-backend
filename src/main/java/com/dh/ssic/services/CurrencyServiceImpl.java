package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.City;
import com.dh.ssic.model.Currency;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.CurrencyRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;

@Service
public class CurrencyServiceImpl extends GenericServiceImplementation<Currency> implements CurrencyService {
    private CurrencyRepository currencyRepository;

    public CurrencyServiceImpl(CurrencyRepository currencyRepository) {
        this.currencyRepository = currencyRepository;
    }
    @Override
    public ReturnModel<Currency> FindCityById(int id, EntityService entityService) {
        ReturnModel<Currency> result = new ReturnModel<>();
        try {
            Currency results = new Currency();
            results = this.currencyRepository.GetCurrencyById(id, entityService);
            if (results == null) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " with id " + id + " do not exist.");
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
    protected CrudRepository<Currency, Integer> getRepository() {
        return currencyRepository;
    }

}

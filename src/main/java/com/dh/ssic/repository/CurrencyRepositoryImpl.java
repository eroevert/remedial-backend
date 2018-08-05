package com.dh.ssic.repository;

import com.dh.ssic.model.Currency;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.*;

public class CurrencyRepositoryImpl implements CurrencyRepository {

    public CurrencyRepositoryImpl() {
    }

    @Override
    public Currency save(Currency entity) {
        return null;
    }

    @Override
    public <S extends Currency> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Currency> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<Currency> findAll() {
        return null;
    }

    @Override
    public Iterable<Currency> findAllById(Iterable<Integer> integers) {
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
    public void delete(Currency entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Currency> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public Currency GetCurrencyById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("CurrencyKey" , id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("CurrencyKey" , Integer.class);
        List<Object[]> results = entityService.executeProcedure("GetCurrency", parameters, classParameter);
        Currency currency = new Currency();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            currency.setCurrencyKey((Integer) results.get(0)[0]);
            currency.setCountryKey((Integer) results.get(0)[1]);
            currency.setName((String) results.get(0)[2]);
            currency.setCode((String) results.get(0)[3]);
            currency.setStatus((String) results.get(0)[4]);
            return currency;
        }
        return null;
    }
}

package com.dh.ssic.services;


import com.dh.ssic.model.Currency;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;


public interface CurrencyService extends GenericService<Currency> {
    public ReturnModel<Currency> FindCityById(int id, EntityService entityService);
}

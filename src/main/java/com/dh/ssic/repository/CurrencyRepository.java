package com.dh.ssic.repository;

import com.dh.ssic.model.Currency;
import com.dh.ssic.model.SalaryScale;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

public interface CurrencyRepository extends CrudRepository<Currency, Integer> {
    public Currency GetCurrencyById(Integer id, EntityService entityService);
}

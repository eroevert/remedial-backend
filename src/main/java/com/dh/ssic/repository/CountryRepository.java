package com.dh.ssic.repository;

import com.dh.ssic.model.Country;
import com.dh.ssic.model.SalaryScale;
import org.springframework.data.repository.CrudRepository;

public interface CountryRepository extends CrudRepository<Country, Integer> {
}

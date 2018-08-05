package com.dh.ssic.services;


import com.dh.ssic.model.Country;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.SalaryScale;

import java.util.List;


public interface CountryService extends GenericService<Country> {
    public ReturnModel<List<Country>> GetList_DB();
}

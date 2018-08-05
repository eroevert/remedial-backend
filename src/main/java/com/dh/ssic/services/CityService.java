package com.dh.ssic.services;


import com.dh.ssic.model.City;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface CityService extends GenericService<City> {
    List<City> getCitiesByIdCountry(Integer idCountry, EntityService entityService);
    public ReturnModel<List<City>> GetCities(EntityService entityService);
    public ReturnModel<City> FindCityById(int id, EntityService entityService);
    public ReturnModel<ReturnSPModel> SaveCity(City model, EntityService entityService);
    public ReturnModel<ReturnSPModel> DeleteCity(Integer organizationKey, EntityService entityService);
    public ReturnModel<ReturnSPModel> UpdateOrganization(City model, EntityService entityService);
}

package com.dh.ssic.repository;

import com.dh.ssic.model.City;
import com.dh.ssic.model.Item;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CityRepository extends CrudRepository<City, Integer> {
    public List<City> spGetCitiesByIdCountry(Integer idCountry, EntityService entityService);
    public City GetCityById(Integer id, EntityService entityService);
    public ReturnSPModel SaveItem(City item, EntityService entityService);
    public ReturnSPModel DeleteItem(Integer CityKey, EntityService entityService);
    public ReturnSPModel UpdateItem(City item, EntityService entityService);
    public List<City> GetCities(EntityService entityService);
}

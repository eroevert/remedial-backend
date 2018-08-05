package com.dh.ssic.repository;

import com.dh.ssic.model.City;
import com.dh.ssic.model.Item;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.*;

public class CityRepositoryImpl implements CityRepository {

    public CityRepositoryImpl() {
    }

    @Override
    public City save(City entity) {
        return null;
    }

    @Override
    public <S extends City> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<City> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<City> findAll() {
        return null;
    }

    @Override
    public Iterable<City> findAllById(Iterable<Integer> integers) {
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
    public void delete(City entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends City> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public List<City> spGetCitiesByIdCountry(Integer idCountry, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("CountryKey", idCountry);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("CountryKey", Integer.class);
        return entityService.executeProcedure("getCitiesByCountryId", parameters, classParameter);
    }
    @Override
    public City GetCityById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("CityKey" , id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("CityKey" , Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetCity", parameters, classParameter);
        City city = new City();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            city.setCityKey((Integer) results.get(0)[0]);
            city.setCode((String) results.get(0)[1]);
            city.setName((String) results.get(0)[2]);
            city.setCountryKey((Integer) results.get(0)[3]);
            return city;
        }
        return null;
    }

    @Override
    public ReturnSPModel SaveItem(City item, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("code" , item.getCode());
        parameters.put("name" , item.getName());
        parameters.put("countryKey" , item.getCountryKey());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("code" , Integer.class);
        classParameter.put("name" , Integer.class);
        classParameter.put("countryKey" , String.class);

        List<Object[]> result = entityService.executeProcedure("SPA_InsertCity", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] items:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(items);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel DeleteItem(Integer CityKey, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("CityKey" ,CityKey);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("CityKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("SPA_DeleteCity", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel UpdateItem(City item, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("CityKey" , item.getCityKey());
        parameters.put("code" , item.getCode());
        parameters.put("name" , item.getName());
        parameters.put("countryKey" , item.getCountryKey());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("CityKey" , Integer.class);
        classParameter.put("code" , Integer.class);
        classParameter.put("name" , Integer.class);
        classParameter.put("countryKey" , String.class);

        List<Object[]> result = entityService.executeProcedure("SPA_UpdateCity", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] itemRes:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(itemRes);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public List<City> GetCities(EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("SPA_GetCities", parameters, classParameter);
        List<City> result = new ArrayList<>();
        for (Object[] itemRes:results) {
            City city = new City();
            city.setCityKey((Integer) itemRes[0]);
            city.setCode((String) itemRes[1]);
            city.setName((String) itemRes[2]);
            city.setCountryKey((Integer) itemRes[3]);
            result.add(city);
        }
        return result;
    }
}

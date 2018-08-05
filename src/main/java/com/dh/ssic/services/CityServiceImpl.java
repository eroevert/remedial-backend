package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.City;

import com.dh.ssic.model.City;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.CityRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Service
public class CityServiceImpl extends GenericServiceImplementation<City> implements CityService {
    private CityRepository cityRepository;

    public CityServiceImpl(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    @Override
    protected CrudRepository<City, Integer> getRepository() {
        return cityRepository;
    }
    @Override
    public List<City> getCitiesByIdCountry(Integer idCountry, EntityService entityService) {
        return cityRepository.spGetCitiesByIdCountry(idCountry, entityService);
    }
    @Override
    public ReturnModel<List<City>> GetCities(EntityService entityService) {
        ReturnModel<List<City>> result = new ReturnModel<>();
        try {
            List<City> results = cityRepository.GetCities(entityService);
            if (results == null || results.size()== 0) {
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
    public ReturnModel<City> FindCityById(int id, EntityService entityService) {
        ReturnModel<City> result = new ReturnModel<>();
        try {
            City results = new City();
            results = this.cityRepository.GetCityById(id, entityService);
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
    public ReturnModel<ReturnSPModel> SaveCity(City model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.cityRepository.SaveItem(model, entityService);
            result.setObject(saveResult);
            result.setMessage(saveResult.getMessage());
            result.setCode(saveResult.getCode());
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
    @Override
    public ReturnModel<ReturnSPModel> DeleteCity(Integer organizationKey, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.cityRepository.DeleteItem(organizationKey, entityService);
            result.setObject(saveResult);
            result.setMessage(saveResult.getMessage());
            result.setCode(saveResult.getCode());
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
    @Override
    public ReturnModel<ReturnSPModel> UpdateOrganization(City model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.cityRepository.UpdateItem(model, entityService);
            result.setObject(saveResult);
            result.setMessage(saveResult.getMessage());
            result.setCode(saveResult.getCode());
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
}

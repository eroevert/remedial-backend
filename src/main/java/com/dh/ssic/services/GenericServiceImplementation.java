package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public abstract class GenericServiceImplementation<T> implements GenericService<T> {
    @Override
    public ReturnModel<List<T>> findAll() {

        ReturnModel<List<T>> result = new ReturnModel<>();
        try {
            List<T> results = new ArrayList<>();
            getRepository().findAll().forEach(results::add);
            if (results.isEmpty()) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The " + typeName + " list is empty.");
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
    public ReturnModel<T> findById(int id) {
        ReturnModel<T> result = new ReturnModel<>();
        try {
            Optional<T> optional = getRepository().findById(id);
            if (!optional.isPresent()) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                throw new NotFoundException(typeName + " id:" + id + " Not Found");
            } else {
                result.setObject(optional.get());
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
    public ReturnModel<T> save(T model) {
        ReturnModel<T> result = new ReturnModel<>();
        try {
            T saveResult = getRepository().save(model);
            result.setObject(saveResult);
            result.setCode(1);
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }

    @Override
    public ReturnModel<String> deleteById(int id) {
        ReturnModel<String> result = new ReturnModel<>();
        try {
            getRepository().deleteById(id);
            result.setCode(1);
        } catch (Exception exception) {
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }

    protected abstract CrudRepository<T, Integer> getRepository();
}

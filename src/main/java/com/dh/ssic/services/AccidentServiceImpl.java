package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.Accident;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.AccidentRepository;
import com.dh.ssic.repository.AccidentRepositoryImpl;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.math.BigDecimal;
import java.util.List;

@Service
public class AccidentServiceImpl extends GenericServiceImplementation<Accident> implements AccidentService {
    private AccidentRepository repository;

    public AccidentServiceImpl(AccidentRepositoryImpl repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<Accident, Integer> getRepository() {
        return repository;
    }

    @Override
    public List<Accident> getAllAccidents(EntityService entityService) {
        return repository.getAllAccident(entityService);
    }

    @Override
    public ReturnModel<Accident> getAccidentById(Integer id, EntityService entityService) {
        ReturnModel<Accident> result = new ReturnModel<>();
        try {
            Accident results = new Accident();
            results = this.repository.getAccidentById(id, entityService);
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
    public ReturnModel<BigDecimal> saveAccident(Accident accident, EntityService entityService) {
        ReturnModel<BigDecimal> result = new ReturnModel<>();
        try {
             BigDecimal saveResult = this.repository.saveAccident(accident, entityService);
            result.setObject(saveResult);
            result.setMessage("Se registro correctamente la transacción.");
            result.setCode(1);
        } catch (Exception exception) {
            exception.printStackTrace();
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }

    @Override
    public ReturnModel<ReturnSPModel> updateAccident(Accident accident, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.repository.updateAccident(accident, entityService);
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
    public ReturnModel<Integer> deleteAccident(Integer id, EntityService entityService) {
        ReturnModel<Integer> result = new ReturnModel<>();
        try {
            Integer saveResult = this.repository.deleteAccident(id, entityService);
            result.setObject(saveResult);
            result.setMessage("Se elimino correctamente");
            result.setCode(1);
        } catch (Exception exception) {
            exception.printStackTrace();
            result.setMessage(exception.getMessage());
            result.setCode(-1);
        }
        return result;
    }
}

package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.Organization;
import com.dh.ssic.model.PositionHistorical;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.PositionHistoricalRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

@Service
public class PositionHistoricalServiceImpl extends GenericServiceImplementation<PositionHistorical> implements PositionHistoricalService {
    private PositionHistoricalRepository positionHistoricalRepository;

    public PositionHistoricalServiceImpl(PositionHistoricalRepository positionHistoricalRepository) {
        this.positionHistoricalRepository = positionHistoricalRepository;
    }

    @Override
    protected CrudRepository<PositionHistorical, Integer> getRepository() {
        return positionHistoricalRepository;
    }


    @Override
    public ReturnModel<List<PositionHistorical>> findByEmployeeKey(int employeeKey, EntityService entityService) {
        ReturnModel<List<PositionHistorical>> result = new ReturnModel<>();

        try {
            List<PositionHistorical> results = new ArrayList<>();
            positionHistoricalRepository.GetPositionHistoricalByEmployee(employeeKey,entityService).forEach(results::add);
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
    public ReturnModel<ReturnSPModel> SavePositionHistorical(PositionHistorical model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.positionHistoricalRepository.SavePositionHistorical(model, entityService);
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

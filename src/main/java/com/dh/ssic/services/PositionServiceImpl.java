package com.dh.ssic.services;


import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.HierarchicalLevel;
import com.dh.ssic.model.Position;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.TypeContract;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.PositionRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Service
public class PositionServiceImpl extends GenericServiceImplementation<Position> implements PositionService {
    private PositionRepository positionRepository;

    public PositionServiceImpl(PositionRepository positionRepository) {
        this.positionRepository = positionRepository;
    }
    @Override
    public ReturnModel<List<Position>> GetPositions(EntityService entityService) {
        ReturnModel<List<Position>> result = new ReturnModel<>();
        try {
            List<Position> results =positionRepository.GetPositions(entityService);
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
    public ReturnModel<Position> GetPositionById(Integer id, EntityService entityService) {
        ReturnModel<Position> result = new ReturnModel<>();
        try {
            Position results = positionRepository.GetPositionById(id, entityService);
            if (results == null ) {
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
    protected CrudRepository<Position, Integer> getRepository() {
        return positionRepository;
    }
}

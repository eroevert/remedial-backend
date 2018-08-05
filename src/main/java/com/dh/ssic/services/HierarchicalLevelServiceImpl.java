package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.City;
import com.dh.ssic.model.HierarchicalLevel;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.HierarchicalLevelRepository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

@Service
public class HierarchicalLevelServiceImpl extends GenericServiceImplementation<HierarchicalLevel> implements HierarchicalLevelService {
    private HierarchicalLevelRepository hierarchicalLevelRepository;

    public HierarchicalLevelServiceImpl(HierarchicalLevelRepository hierarchicalLevelRepository) {
        this.hierarchicalLevelRepository = hierarchicalLevelRepository;
    }

    @Override
    protected CrudRepository<HierarchicalLevel, Integer> getRepository() {
        return hierarchicalLevelRepository;
    }
    @Override
    public ReturnModel<List<HierarchicalLevel>> GetHierarchicalLevels(EntityService entityService) {
        ReturnModel<List<HierarchicalLevel>> result = new ReturnModel<>();
        try {
            List<HierarchicalLevel> results = hierarchicalLevelRepository.GetHierarchicalLevels(entityService);
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
    public ReturnModel<HierarchicalLevel> GetHierarchicalLevel(Integer id, EntityService entityService) {
        ReturnModel<HierarchicalLevel> result = new ReturnModel<>();
        try {
            HierarchicalLevel results = hierarchicalLevelRepository.GetHierarchicalLevel(id, entityService);
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
}

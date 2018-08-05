package com.dh.ssic.repository;

import com.dh.ssic.model.Item;
import com.dh.ssic.model.Organization;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.sql.Timestamp;
import java.util.*;

public class ItemRepositoryImpl implements ItemRepository  {
    @Override
    public List<Item> GetItemsFromOrganization(Integer id, EntityService entityService) {

            Map<String, Object> parameters = new HashMap<>();
            parameters.put("OrgnanizationKey", id);
            Map<String, Class> classParameter = new HashMap<>();
            classParameter.put("OrgnanizationKey", Integer.class);
            List<Object[]> results = entityService.executeProcedure("SPA_GetItemsFromOrganization", parameters, classParameter);
            List<Item> list = new ArrayList<>();
            for (Object[] item:results) {
                Item items = new Item();
                items.setItemKey((Integer) item[0]);
                items.setOrganizationKey((Integer) item[1]);
                items.setTypeContractKey((Integer) item[2]);
                items.setItemNumber((String) item[3]);
                items.setPositionKey((Integer) item[4]);
                items.setSalaryScaleKey((Integer) item[5]);
                items.setCode((String) item[6]);
                items.setStatus((String) item[7]);
                items.setCityKey((Integer) item[8]);
                list.add(items);
            }
            return list;
    }

    @Override
    public List<Item> GetItems(EntityService entityService) {

        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("SPA_GetItems", parameters, classParameter);
        List<Item> list = new ArrayList<>();
        for (Object[] item:results) {
            Item items = new Item();
            items.setItemKey((Integer) item[0]);
            items.setOrganizationKey((Integer) item[1]);
            items.setTypeContractKey((Integer) item[2]);
            items.setItemNumber((String) item[3]);
            items.setPositionKey((Integer) item[4]);
            items.setSalaryScaleKey((Integer) item[5]);
            items.setCode((String) item[6]);
            items.setStatus((String) item[7]);
            items.setCityKey((Integer) item[8]);
            list.add(items);
        }
        return list;
    }

    @Override
    public Item GetItemById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("ItemKey" , id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("ItemKey" , Integer.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetItem", parameters, classParameter);
        Item items = new Item();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            items.setItemKey((Integer) results.get(0)[0]);
            items.setOrganizationKey((Integer) results.get(0)[1]);
            items.setTypeContractKey((Integer) results.get(0)[2]);
            items.setItemNumber((String) results.get(0)[3]);
            items.setPositionKey((Integer) results.get(0)[4]);
            items.setSalaryScaleKey((Integer) results.get(0)[5]);
            items.setCode((String) results.get(0)[6]);
            items.setStatus((String) results.get(0)[7]);
            items.setStatus(results.get(0)[8].toString());
            items.setCityKey((Integer) results.get(0)[9]);
            return items;
        }
        return null;
    }

    @Override
    public ReturnSPModel SaveItem(Item item, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("OrganizationKey" , item.getOrganizationKey());
        parameters.put("TypeContractKey" , item.getTypeContractKey());
        parameters.put("ItemNumber" , item.getItemNumber());
        parameters.put("PositionKey" , item.getPositionKey());
        parameters.put("SalaryScaleKey" , item.getSalaryScaleKey());
        parameters.put("Code" , item.getCode());
        parameters.put("Status" , item.getStatus());
        parameters.put("CityKey" , item.getCityKey());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("OrganizationKey" , Integer.class);
        classParameter.put("TypeContractKey" , Integer.class);
        classParameter.put("ItemNumber" , String.class);
        classParameter.put("PositionKey" , Integer.class);
        classParameter.put("SalaryScaleKey" , Integer.class);
        classParameter.put("Code" , String.class);
        classParameter.put("Status" , String.class);
        classParameter.put("CityKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("SPA_InsertItem", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] items:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(items);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel DeleteItem(Integer itemKey, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("ItemKey" ,itemKey);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("ItemKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("SPA_DeleteItem", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public ReturnSPModel UpdateItem(Item item, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("ItemKey" , item.getItemKey());
        parameters.put("OrganizationKey" , item.getOrganizationKey());
        parameters.put("TypeContractKey" , item.getTypeContractKey());
        parameters.put("ItemNumber" , item.getItemNumber());
        parameters.put("PositionKey" , item.getPositionKey());
        parameters.put("SalaryScaleKey" , item.getSalaryScaleKey());
        parameters.put("Code" , item.getCode());
        parameters.put("Status" , item.getStatus());
        parameters.put("CityKey" , item.getCityKey());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("ItemKey" , Integer.class);
        classParameter.put("OrganizationKey" , Integer.class);
        classParameter.put("TypeContractKey" , Integer.class);
        classParameter.put("ItemNumber" , String.class);
        classParameter.put("PositionKey" , Integer.class);
        classParameter.put("SalaryScaleKey" , Integer.class);
        classParameter.put("Code" , String.class);
        classParameter.put("Status" , String.class);
        classParameter.put("CityKey" , Integer.class);

        List<Object[]> result = entityService.executeProcedure("SPA_UpdateItem", parameters,
                classParameter);

        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] itemRes:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(itemRes);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public <S extends Item> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Item> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Item> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<Item> findAll() {
        return null;
    }

    @Override
    public Iterable<Item> findAllById(Iterable<Integer> integers) {
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
    public void delete(Item entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Item> entities) {

    }

    @Override
    public void deleteAll() {
    }

}

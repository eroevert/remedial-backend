package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;
import com.dh.ssic.model.*;

import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repository.*;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

@Service
public class ItemServiceImpl extends GenericServiceImplementation<Item> implements ItemService {
    private ItemRepository itemRepository;
    private OrganizationRepository organizationRepository;
    private TypeContractRepository typeContractRepository;
    private PositionRepository positionRepository;
    private SalaryScaleRepository salaryScaleRepository;
    private CurrencyRepository currencyRepository;

    public ItemServiceImpl(ItemRepository itemRepository,
                           OrganizationRepository organizationRepository,
                           TypeContractRepository typeContractRepository,
                           PositionRepository positionRepository,
                           SalaryScaleRepository salaryScaleRepository,
                           CurrencyRepository currencyRepository) {
        this.itemRepository = itemRepository;
        this.organizationRepository = organizationRepository;
        this.typeContractRepository = typeContractRepository;
        this.positionRepository = positionRepository;
        this.salaryScaleRepository = salaryScaleRepository;
        this.currencyRepository = currencyRepository;
    }
    @Override
    public ReturnModel<List<Item>> findByOrganizationKey(int id, EntityService entityService) {
        ReturnModel<List<Item>> result = new ReturnModel<>();
        try {
            List<Item> results = new ArrayList<>();
            this.itemRepository.GetItemsFromOrganization(id, entityService).forEach(results::add);
            if (results.isEmpty()) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The organization with id " + id + " do not have elements.");
                result.setCode(0);
            } else {
                for (Item oitemRes:results) {
                    Organization orgRes = this.organizationRepository.GetOrganizationId(oitemRes.getOrganizationKey(), entityService);
                    oitemRes.setOrganizationByOrganizationKey(orgRes!=null?orgRes:new Organization());

                    TypeContract tcRes = this.typeContractRepository.GetTypeContractById(oitemRes.getTypeContractKey(), entityService);
                    oitemRes.setTypeContractByTypeContractKey(tcRes!=null?tcRes:new TypeContract());

                    Position posRes = this.positionRepository.GetPositionById(oitemRes.getPositionKey(), entityService);
                    oitemRes.setPositionByPositionKey(posRes!=null?posRes:new Position());

                    SalaryScale salRes = this.salaryScaleRepository.GetSalaryScaleById(oitemRes.getSalaryScaleKey(), entityService);
                    if(salRes != null) {
                        salRes.setCurrencyByCurrencyKey(this.currencyRepository.GetCurrencyById(salRes.getCurrencyKey(),entityService));
                    }
                    oitemRes.setSalaryScaleBySalaryScaleKey(salRes!=null?salRes:new SalaryScale());
                }
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
    public ReturnModel<List<Item>> GetAllItems(EntityService entityService) {
        ReturnModel<List<Item>> result = new ReturnModel<>();
        try {
            List<Item> results = new ArrayList<>();
            this.itemRepository.GetItems(entityService).forEach(results::add);
            if (results.isEmpty()) {
                String typeName = (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
                typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
                result.setMessage("The items is empty.");
                result.setCode(0);
            } else {
                for (Item oitemRes:results) {
//                    Organization orgRes = this.organizationRepository.GetOrganizationId(oitemRes.getOrganizationKey(), entityService);
//                    oitemRes.setOrganizationByOrganizationKey(orgRes!=null?orgRes:new Organization());
//
//                    TypeContract tcRes = this.typeContractRepository.GetTypeContractById(oitemRes.getTypeContractKey(), entityService);
//                    oitemRes.setTypeContractByTypeContractKey(tcRes!=null?tcRes:new TypeContract());

                    Position posRes = this.positionRepository.GetPositionById(oitemRes.getPositionKey(), entityService);
                    oitemRes.setPositionByPositionKey(posRes!=null?posRes:new Position());

                    /*SalaryScale salRes = this.salaryScaleRepository.GetSalaryScaleById(oitemRes.getSalaryScaleKey(), entityService);
                    if(salRes != null) {
                        salRes.setCurrencyByCurrencyKey(this.currencyRepository.GetCurrencyById(salRes.getCurrencyKey(),entityService));
                    }
                    oitemRes.setSalaryScaleBySalaryScaleKey(salRes!=null?salRes:new SalaryScale());*/
                }
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
    public ReturnModel<Item> FindItemById(int id, EntityService entityService) {
        ReturnModel<Item> result = new ReturnModel<>();
        try {
            Item results = new Item();
            results = this.itemRepository.GetItemById(id, entityService);
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
    public ReturnModel<ReturnSPModel> SaveItem(Item model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.itemRepository.SaveItem(model, entityService);
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
    public ReturnModel<ReturnSPModel> DeleteItem(Integer itemKey, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.itemRepository.DeleteItem(itemKey, entityService);
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
    public ReturnModel<ReturnSPModel> UpdateItem(Item model, EntityService entityService) {
        ReturnModel<ReturnSPModel> result = new ReturnModel<>();
        try {
            ReturnSPModel saveResult = this.itemRepository.UpdateItem(model, entityService);
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
    protected CrudRepository<Item, Integer> getRepository() {
        return itemRepository;
    }
}

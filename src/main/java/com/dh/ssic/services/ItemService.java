package com.dh.ssic.services;


import com.dh.ssic.model.Item;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface ItemService extends GenericService<Item> {
    public ReturnModel<List<Item>> findByOrganizationKey(int id, EntityService entityService);
    public ReturnModel<Item> FindItemById(int id, EntityService entityService);
    public ReturnModel<ReturnSPModel> SaveItem(Item model, EntityService entityService);
    public ReturnModel<ReturnSPModel> DeleteItem(Integer itemKey, EntityService entityService);
    public ReturnModel<ReturnSPModel> UpdateItem(Item model, EntityService entityService);
    public ReturnModel<List<Item>> GetAllItems(EntityService entityService);
}

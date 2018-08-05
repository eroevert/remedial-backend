package com.dh.ssic.repository;

import com.dh.ssic.model.Item;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ItemRepository extends CrudRepository<Item, Integer> {
    /*public List<Item> findByOrOrganizationKey(int id);
    public Item findByCode(String code);*/
    public List<Item> GetItemsFromOrganization(Integer id, EntityService entityService);
    public Item GetItemById(Integer id, EntityService entityService);
    public ReturnSPModel SaveItem(Item item, EntityService entityService);
    public ReturnSPModel DeleteItem(Integer itemKey, EntityService entityService);
    public ReturnSPModel UpdateItem(Item item, EntityService entityService);
    public List<Item> GetItems(EntityService entityService);
}

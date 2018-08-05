package com.dh.ssic.repository;

import com.dh.ssic.model.InventoryInput;
import com.dh.ssic.model.InventoryView;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface InventoryViewRepository extends CrudRepository<InventoryInput, Integer> {

    @Query("select ii from InventoryInput ii ")
    List<InventoryInput> reportInventory();
}

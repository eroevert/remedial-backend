package com.dh.ssic.services;


import com.dh.ssic.model.InventoryInput;
import com.dh.ssic.model.InventoryView;
import com.dh.ssic.repository.InventoryViewRepository;
import org.glassfish.jersey.internal.guava.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InventoryViewService {
    @Autowired
    InventoryViewRepository reporteRepository;

    //    public List<InventoryView> findAll() {
//        Iterable<InventoryView> iterable = reporteRepository.findAll();
//        List<InventoryView> accident = Lists.newArrayList(iterable);
//        return accident;
//    }
    public List<InventoryInput> reportInventory() {
        Iterable<InventoryInput> iterable = reporteRepository.reportInventory();
        List<InventoryInput> accident = Lists.newArrayList(iterable);
        return accident;
    }
}

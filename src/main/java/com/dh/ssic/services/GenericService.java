package com.dh.ssic.services;

import com.dh.ssic.model.ReturnModel;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface GenericService<T> {
    ReturnModel<List<T>> findAll();
    @Transactional(propagation=Propagation.REQUIRED, readOnly=true, noRollbackFor=Exception.class)
    ReturnModel<T> findById(int id);
    ReturnModel<T> save(T model);
    ReturnModel<String> deleteById(int id);
}

package com.dh.ssic.services;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.TypeContract;
import com.dh.ssic.model.User;
import com.dh.ssic.repositories.EntityService;

import java.util.List;


public interface UserService extends GenericService<User> {
    public ReturnModel<User> login(User user, EntityService entityService);
    public ReturnModel<User> GetByUserName(User user, EntityService entityService);
}

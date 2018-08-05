package com.dh.ssic.repository;

import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.model.User;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {

    public ReturnSPModel ValidateUser(String userName, String password, EntityService entityService);
    public User GetUserByUsername(String userName, EntityService entityService);
}
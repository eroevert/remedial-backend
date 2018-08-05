package com.dh.ssic.repository;

import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.model.User;
import com.dh.ssic.repositories.EntityService;

import java.util.*;

public class UserRepositoryImpl implements UserRepository {

    public UserRepositoryImpl() {
    }

    @Override
    public User save(User entity) {
        return null;
    }

    @Override
    public <S extends User> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<User> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<User> findAll() {
        return null;
    }

    @Override
    public Iterable<User> findAllById(Iterable<Integer> integers) {
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
    public void delete(User entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends User> entities) {

    }

    @Override
    public void deleteAll() {

    }

    @Override
    public ReturnSPModel ValidateUser(String userName, String password,EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("username" , userName);
        parameters.put("password" , password);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("username" , String.class);
        classParameter.put("password" , String.class);
        List<Object[]> results = entityService.executeProcedure("SPA_ValidateUser", parameters, classParameter);
        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:results) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }
    @Override
    public User GetUserByUsername(String userName, EntityService entityService){
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("username" , userName);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("username" , String.class);
        List<Object[]> results = entityService.executeProcedure("SPA_GetByUsername", parameters, classParameter);
        User user = new User();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            user.setUserKey((Integer) results.get(0)[0]);
            user.setEmployeeKey((Integer) results.get(0)[1]);
            user.setRolKey((Integer) results.get(0)[2]);
            user.setStatus((String) results.get(0)[3]);
            user.setUserName((String) results.get(0)[4]);
            return user;
        }
        return null;
    }
}

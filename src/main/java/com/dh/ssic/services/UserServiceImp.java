/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.exceptions.NotFoundException;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.model.User;
import com.dh.ssic.repositories.EmployeeRepository;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.RolRepository;
import com.dh.ssic.repository.UserRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp extends GenericServiceImplementation<User> implements UserService {
    UserRepository repository;
    EmployeeRepository employeeRepository;
    RolRepository rolRepository;

    public UserServiceImp(UserRepository userRepository,
                          EmployeeRepository employeeRepository,
                          RolRepository rolRepository) {
        this.repository = userRepository;
        this.employeeRepository = employeeRepository;
        this.rolRepository = rolRepository;
    }

    @Override
    protected CrudRepository<User, Integer> getRepository() {
        return repository;
    }

    @Override
    public ReturnModel<User> login(User user, EntityService entityService) {
        ReturnModel<User> result = new ReturnModel<>();
        try {
            ReturnSPModel userResult = this.repository.ValidateUser(user.getUserName(),user.getPassword(),entityService);
            if (userResult == null) {
                result.setMessage("El usuario ingresado no existe en las bases de datos.");
                result.setCode(0);
            } else {
                    result.setMessage(userResult.getMessage());
                    result.setCode(userResult.getCode());
                    if(userResult.getCode()==1) {
                        User userRes = this.repository.GetUserByUsername(user.getUserName(),entityService);
                        userRes.setEmployeeByEmployeeKey(this.employeeRepository.getEmployeeById(userRes.getEmployeeKey(),entityService));
                        userRes.setRolByRolKey(this.rolRepository.getRolById(userRes.getRolKey(),entityService));
                        result.setObject(userRes);
                    }
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
    public ReturnModel<User> GetByUserName(User user, EntityService entityService) {
        ReturnModel<User> result = new ReturnModel<>();
        try {
            User userResult = this.repository.GetUserByUsername(user.getUserName(),entityService);
            if (userResult == null) {
                result.setMessage("El username ingresado no existe en las bases de datos.");
                result.setCode(0);
            } else {
                result.setMessage("");
                result.setCode(1);
                result.setObject(userResult);
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
}



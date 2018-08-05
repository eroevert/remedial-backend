/*Yussen Solis Garro*/
package com.dh.ssic.services;

import com.dh.ssic.model.Employee;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EmployeeRepository;
import com.dh.ssic.repositories.EmployeeRepositoryImpl;
import com.dh.ssic.repositories.EntityService;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class EmployeeServiceImp extends GenericServiceImplementation<Employee> implements EmployeeService {
    EmployeeRepository repository;

    @Override
    public List<Employee> getEmployeesByOrganizations(List<Integer> list) {
        return repository.findByOrganizationKeyIn(list);
    }

    @Override
    public List<Employee> getAllEmployee(EntityService entityService) {
         List<Employee>  res =repository.getAllEmployee(entityService);
         return res;
    }

    @Override
    public Employee getEmployeeById(Integer id, EntityService entityService) {
        return repository.getEmployeeById(id, entityService);
    }

    @Override
    public ReturnSPModel saveEmployee(Employee employee, EntityService entityService) {
        return repository.saveEmployee(employee, entityService);
    }

    @Override
    public Integer updateEmployee(Employee employee, EntityService entityService) {
        return repository.updateEmployee(employee, entityService);
    }

    @Override
    public Integer deleteEmployee(Integer employeeKey, EntityService entityService) {
        return repository.deleteEmployee(employeeKey, entityService);
    }

    public EmployeeServiceImp(EmployeeRepositoryImpl repo) {
        this.repository = repo;
    }

    @Override
    protected CrudRepository<Employee, Integer> getRepository() {
        return repository;
    }
}



package com.dh.ssic.repositories;

import com.dh.ssic.model.Employee;
import com.dh.ssic.model.ReturnSPModel;
import org.springframework.data.repository.CrudRepository;

import java.math.BigDecimal;
import java.util.List;

public interface EmployeeRepository extends CrudRepository<Employee, Integer> {
    public Employee findByEmployeeCode(String employeeCode);
    public List<Employee> findByOrganizationKeyIn(List<Integer> ids);
    public List<Employee> getAllEmployee(EntityService entityService);
    public Employee getEmployeeById(Integer id, EntityService entityService);
    public ReturnSPModel saveEmployee(Employee employee, EntityService entityService);
    public Integer updateEmployee(Employee employee, EntityService entityService);
    public Integer deleteEmployee(Integer employeeKey, EntityService entityService);
}
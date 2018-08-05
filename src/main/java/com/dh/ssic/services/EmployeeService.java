/*
yussen Solis Garro
*/
package com.dh.ssic.services;

import com.dh.ssic.model.Employee;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;

import java.math.BigDecimal;
import java.util.List;

public interface EmployeeService extends GenericService<Employee> {

    public List<Employee> getEmployeesByOrganizations(List<Integer> list);

    public List<Employee> getAllEmployee(EntityService entityService);

    public Employee getEmployeeById(Integer id, EntityService entityService);

    public ReturnSPModel saveEmployee(Employee employee, EntityService entityService);
    public Integer updateEmployee(Employee employee, EntityService entityService);
    public Integer deleteEmployee(Integer employeeKey, EntityService entityService);

}

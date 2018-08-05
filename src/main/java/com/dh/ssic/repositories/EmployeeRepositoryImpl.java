package com.dh.ssic.repositories;

import com.dh.ssic.model.Employee;
import com.dh.ssic.model.ReturnSPModel;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

public class EmployeeRepositoryImpl implements EmployeeRepository  {
    @Override
    public Employee findByEmployeeCode(String employeeCode) {
        return null;
    }

    @Override
    public List<Employee> findByOrganizationKeyIn(List<Integer> ids) {
        return null;
    }

    @Override
    public List<Employee> getAllEmployee(EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        Map<String, Class> classParameter = new HashMap<>();
        List<Object[]> results = entityService.executeProcedure("getAllEmployee", parameters, classParameter);
        List<Employee> empList = new ArrayList<>();
        for (Object[] item:results) {
            Employee employee = new Employee();
            employee.setEmployeeKey((Integer) item[0]);
            employee.setOrganizationKey((Integer) item[1]);
            employee.setEmployeeCode((String) item[2]);
            employee.setFirstName((String) item[3]);
            employee.setLastName((String) item[4]);
            employee.setBirthDate((Timestamp) item[5]);
            employee.setGender((String) item[6]);
            employee.setNationality((String) item[7]);
            employee.setAdmissionDate((Timestamp) item[8]);
            employee.setStatus(item[9].toString());
            employee.setPhoto((String) item[10]);
            employee.setRegistrationDate((Timestamp) item[11]);
            empList.add(employee);
        }
        return empList;
    }

    @Override
    public Employee getEmployeeById(Integer id, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EmployeeKey" , id);
        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EmployeeKey" , Integer.class);
        List<Object[]> results = entityService.executeProcedure("GetEmployee", parameters, classParameter);
        Employee employee = new Employee();
        if(results.size() > 0 ? results.get(0).length > 0 : false) {
            employee.setEmployeeKey((Integer) results.get(0)[0]);
            employee.setOrganizationKey((Integer) results.get(0)[1]);
            employee.setEmployeeCode((String) results.get(0)[2]);
            employee.setFirstName((String) results.get(0)[3]);
            employee.setLastName((String) results.get(0)[4]);
            employee.setBirthDate((Timestamp) results.get(0)[5]);
            employee.setGender((String) results.get(0)[6]);
            employee.setNationality((String) results.get(0)[7]);
            employee.setAdmissionDate((Timestamp) results.get(0)[8]);
            employee.setStatus(results.get(0)[9].toString());
            employee.setPhoto((String) results.get(0)[10]);
            employee.setRegistrationDate((Timestamp) results.get(0)[11]);
        }
        return employee;
    }

    @Override
    public ReturnSPModel saveEmployee(Employee employee, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("FirstName" , employee.getFirstName());
        parameters.put("LastName" , employee.getLastName());
        parameters.put("BirthDate" , employee.getBirthDate());
        parameters.put("EmployeeCode" , employee.getEmployeeCode());
        parameters.put("Gender" , employee.getGender());
        parameters.put("Nationality" , employee.getNationality());
        parameters.put("AdmissionDate" , employee.getAdmissionDate());
        parameters.put("Status" , employee.getStatus());
        parameters.put("Photo" , employee.getPhoto());
        parameters.put("OrganizationKey" , employee.getOrganizationKey());
        parameters.put("RegistrationDate" , employee.getRegistrationDate());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("FirstName" , String.class);
        classParameter.put("LastName" , String.class);
        classParameter.put("BirthDate" , Timestamp.class);
        classParameter.put("EmployeeCode" , String.class);
        classParameter.put("Gender" , String.class);
        classParameter.put("Nationality" , String.class);
        classParameter.put("AdmissionDate" , Timestamp.class);
        classParameter.put("Status" , String.class);
        classParameter.put("Photo" , String.class);
        classParameter.put("OrganizationKey" , Integer.class);
        classParameter.put("RegistrationDate" , Timestamp.class);

        List<Object[]> result = entityService.executeProcedure("InsertEmployee", parameters,
                classParameter);
        List<ReturnSPModel> list = new ArrayList<>();
        for (Object[] item:result) {
            ReturnSPModel returnSPModel = new ReturnSPModel(item);
            list.add(returnSPModel);
        }
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public Integer updateEmployee(Employee employee, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EmployeeKey" , employee.getEmployeeKey());
        parameters.put("FirstName" , employee.getFirstName());
        parameters.put("LastName" , employee.getLastName());
        parameters.put("BirthDate" , employee.getBirthDate());
        parameters.put("EmployeeCode" , employee.getEmployeeCode());
        parameters.put("Gender" , employee.getGender());
        parameters.put("Nationality" , employee.getNationality());
        parameters.put("AdmissionDate" , employee.getAdmissionDate());
        parameters.put("Status" , employee.getStatus());
        parameters.put("Photo" , employee.getPhoto());
        parameters.put("OrganizationKey" , employee.getOrganizationKey());
        parameters.put("RegistrationDate" , employee.getRegistrationDate());

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EmployeeKey" , Integer.class);
        classParameter.put("FirstName" , String.class);
        classParameter.put("LastName" , String.class);
        classParameter.put("BirthDate" , Timestamp.class);
        classParameter.put("EmployeeCode" , String.class);
        classParameter.put("Gender" , String.class);
        classParameter.put("Nationality" , String.class);
        classParameter.put("AdmissionDate" , Timestamp.class);
        classParameter.put("Status" , String.class);
        classParameter.put("Photo" , String.class);
        classParameter.put("OrganizationKey" , Integer.class);
        classParameter.put("RegistrationDate" , Timestamp.class);

        List<Integer> result = (List<Integer>) entityService.executeProcedure("UpdateEmployee", parameters,
                classParameter);
        return result.size() > 0 ? result.get(0) : null;
    }

    @Override
    public Integer deleteEmployee(Integer employeeKey, EntityService entityService) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("EmployeeKey" , employeeKey);

        Map<String, Class> classParameter = new HashMap<>();
        classParameter.put("EmployeeKey" , Integer.class);

        List<Integer> result = (List<Integer>) entityService.executeProcedure("deleteEmployee", parameters,
                classParameter);
        return result!=null && result.size() > 0 ? result.get(0) : 1;
    }

    @Override
    public <S extends Employee> S save(S entity) {
        return null;
    }

    @Override
    public <S extends Employee> Iterable<S> saveAll(Iterable<S> entities) {
        return null;
    }

    @Override
    public Optional<Employee> findById(Integer integer) {
        return Optional.empty();
    }

    @Override
    public boolean existsById(Integer integer) {
        return false;
    }

    @Override
    public Iterable<Employee> findAll() {
        return null;
    }

    @Override
    public Iterable<Employee> findAllById(Iterable<Integer> integers) {
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
    public void delete(Employee entity) {

    }

    @Override
    public void deleteAll(Iterable<? extends Employee> entities) {

    }

    @Override
    public void deleteAll() {

    }
}

/*yussen*/
package com.dh.ssic.controller;

import com.dh.ssic.command.OrganizationEmployees;
import com.dh.ssic.model.Employee;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

@Controller
@Path("/employees")
@Produces(MediaType.APPLICATION_JSON)
public class EmployeeController {
    private EmployeeService service;
    @Autowired
    ApplicationContext appContext;

    public EmployeeController(EmployeeService service) {
        this.service = service;
    }

    @GET
    public Response getEmployees() {
        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            List<Employee> list = service.getAllEmployee(entityService);
            ReturnModel<List<Employee>> result = new ReturnModel<>();
            result.setObject(list);
            responseBuilder = Response.ok(result);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getEmployeeById(@PathParam("id") @NotNull Integer id) {

        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            Employee employee = service.getEmployeeById(id, entityService);
            ReturnModel<Employee> result = new ReturnModel<>();
            result.setObject(employee);
            responseBuilder = Response.ok(result);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @POST
    @Path("/by/organization")
    public Response getEmployeesByOrganizations(OrganizationEmployees organizationEmployees) {

        Response.ResponseBuilder responseBuilder;
        try {
            List<Employee> employees = service.getEmployeesByOrganizations(organizationEmployees.getOrganizations());
            ReturnModel<List<Employee>> result = new ReturnModel<>();
            result.setObject(employees);
            responseBuilder = Response.ok(result);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @POST
    public Response saveEmployee(Employee c) {

        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            ReturnSPModel idRegister = service.saveEmployee(c, entityService);
            ReturnModel<BigDecimal> cPersisted = new ReturnModel<>();
            cPersisted.setObject(new BigDecimal(idRegister.getRowKey()));
            cPersisted.setMessage(idRegister.getMessage());
            cPersisted.setCode(idRegister.getCode());
            responseBuilder = Response.ok(cPersisted);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @PUT
    public Response updateRol(Employee c) {

        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            Integer idRegister = service.updateEmployee(c, entityService);
            ReturnModel<Integer> cPersisted = new ReturnModel<>();
            cPersisted.setObject(idRegister);
            responseBuilder = Response.ok(cPersisted);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteRol(@PathParam("id") String id) {

        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            Integer result = service.deleteEmployee(Integer.valueOf(id), entityService);
            ReturnModel<String> deleteResult = new ReturnModel<>();
            deleteResult.setObject(result.toString());
            if (Objects.equals(result.toString(), new String("1"))) {
                deleteResult.setCode(1);
            }
            responseBuilder = Response.ok(deleteResult);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }

        return responseBuilder.build();
    }

}
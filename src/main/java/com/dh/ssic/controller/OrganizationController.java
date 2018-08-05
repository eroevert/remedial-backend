package com.dh.ssic.controller;

import com.dh.ssic.ResultSetMapper;
import com.dh.ssic.model.Country;
import com.dh.ssic.model.Organization;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.EmployeeService;
import com.dh.ssic.services.OrganizationService;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/organization")
//@Produces("application/json")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class OrganizationController {
    private OrganizationService organizationService;
    @Autowired
    ApplicationContext appContext;

    public OrganizationController(OrganizationService organizationService) {
        this.organizationService = organizationService;
    }

    @GET
    public Response getOrganizations() {
        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            ReturnModel<List<Organization>> organizationList = organizationService.getAllOrganization(entityService);
            responseBuilder = Response.ok(organizationList);
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
    public Response getOrganizationsById(@PathParam("id") @NotNull Integer id) {
        Response.ResponseBuilder responseBuilder;
        try {

            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            ReturnModel<Organization> organization = organizationService.FindOrganizationById(id, entityService);
            responseBuilder = Response.ok(organization);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @GET
    @Path("/padre/{id}")
    public Response getOrganizationsByIdPadre(@PathParam("id") @NotNull Integer id) {
        Response.ResponseBuilder responseBuilder;
        try {

            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            ReturnModel<List<Organization>> organization = organizationService.FindByIdPadre(id, entityService);
            responseBuilder = Response.ok(organization);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @POST
    public Response saveOrganization(Organization organization) {
        Response.ResponseBuilder responseBuilder;
        try {

            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            ReturnModel<ReturnSPModel> organizationPersisted = organizationService.SaveOrganization(organization, entityService);
            responseBuilder = Response.ok(organizationPersisted);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @PUT
    public Response updateOrganization(Organization organization) {
        Response.ResponseBuilder responseBuilder;
        try {

            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            ReturnModel<ReturnSPModel> organizationPersisted = organizationService.UpdateOrganization(organization, entityService);
            responseBuilder = Response.ok(organizationPersisted);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteOrganization(@PathParam("id") String id) {
        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            ReturnModel<ReturnSPModel> deleteResult = organizationService.DeleteOrganization(Integer.valueOf(id), entityService);
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

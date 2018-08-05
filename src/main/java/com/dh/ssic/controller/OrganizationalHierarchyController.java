package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.OrganizationalHierarchy;
import com.dh.ssic.services.OrganizationalHierarchyService;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/organizationalhierarchy")
@Produces("application/json")
public class OrganizationalHierarchyController {
    private OrganizationalHierarchyService organizationalHierarchyService;

    public OrganizationalHierarchyController(OrganizationalHierarchyService organizationalHierarchyService) {
        this.organizationalHierarchyService = organizationalHierarchyService;
    }

    @GET
    public Response getOrganizationalHierarchys() {
        ReturnModel<List<OrganizationalHierarchy>> result = organizationalHierarchyService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getOrganizationalHierarchysById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<OrganizationalHierarchy> organizationalHierarchy = organizationalHierarchyService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(organizationalHierarchy);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveOrganizationalHierarchy(OrganizationalHierarchy organizationalHierarchy) {
        ReturnModel<OrganizationalHierarchy> organizationalHierarchyPersisted = organizationalHierarchyService.save(organizationalHierarchy);
        Response.ResponseBuilder responseBuilder = Response.ok(organizationalHierarchyPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateOrganizationalHierarchy(OrganizationalHierarchy organizationalHierarchy) {
        ReturnModel<OrganizationalHierarchy> organizationalHierarchyPersisted = organizationalHierarchyService.save(organizationalHierarchy);
        Response.ResponseBuilder responseBuilder = Response.ok(organizationalHierarchyPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteOrganizationalHierarchy(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = organizationalHierarchyService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    private void addCorsHeader(Response.ResponseBuilder responseBuilder) {
        responseBuilder.header("Access-Control-Allow-Origin", "*")
                .header("Access-Control-Allow-Credentials", "true")
                .header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
                .header("Access-Control-Allow-Headers",
                        "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
    }
}

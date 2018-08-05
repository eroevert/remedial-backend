package com.dh.ssic.controller;


import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.Rol;
import com.dh.ssic.services.RolService;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/roles")
//@Produces("application/json")
@Produces(MediaType.APPLICATION_JSON)
public class RolController {
    private RolService service;

    public RolController(RolService rolService) {
        this.service = rolService;
    }

    @GET
    public Response getRoles() {
        List<Rol> rolList = new ArrayList<>();
        ReturnModel<List<Rol>> result = service.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getrolById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<Rol> rol = service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(rol);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveRol(Rol rol) {
        System.out.println(rol.getRolKey());
        ReturnModel<Rol> rolPersisted = service.save(rol);
        Response.ResponseBuilder responseBuilder = Response.ok(rolPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateRol(Rol rol) {
        ReturnModel<Rol> rolPersisted = service.save(rol);
        Response.ResponseBuilder responseBuilder = Response.ok(rolPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteRol(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = service.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    private void addCorsHeader(Response.ResponseBuilder responseBuilder) {

    }
}

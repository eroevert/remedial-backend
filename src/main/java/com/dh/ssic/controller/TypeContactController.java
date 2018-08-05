package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.TypeContact;
import com.dh.ssic.services.TypeContactService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/typeContact")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class TypeContactController {
    private TypeContactService typeContactService;

    public TypeContactController(TypeContactService typeContactService) {
        this.typeContactService = typeContactService;
    }

    @GET
    public Response getTypeContacts() {
        ReturnModel<List<TypeContact>> result = typeContactService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result.getObject());
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getTypeContactById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<TypeContact> result = typeContactService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @POST
    public Response saveTypeContact(TypeContact typeContact) {
        typeContact.getTypeContactKey();
        ReturnModel<TypeContact> saveResult = typeContactService.save(typeContact);
        Response.ResponseBuilder responseBuilder = Response.ok(saveResult);
        return responseBuilder.build();
    }

    @PUT
    public Response updateTypeContact(TypeContact typeContact) {
        ReturnModel<TypeContact> updateResult = typeContactService.save(typeContact);
        Response.ResponseBuilder responseBuilder = Response.ok(updateResult);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteTypeContact(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = typeContactService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        return responseBuilder.build();
    }
}

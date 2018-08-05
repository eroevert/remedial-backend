package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.TypeContract;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.TypeContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/typeContract")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class TypeContractController {
    private TypeContractService typeContractService;
    @Autowired
    ApplicationContext appContext;
    public TypeContractController(TypeContractService typeContractService) {
        this.typeContractService = typeContractService;
    }

    @GET
    public Response getTypeContracts() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<TypeContract>> result = typeContractService.GetTypesContract(entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result.getObject());
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getTypeContractById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<TypeContract> result = typeContractService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @POST
    public Response saveTypeContract(TypeContract typeContract) {
        ReturnModel<TypeContract> saveResult = typeContractService.save(typeContract);
        Response.ResponseBuilder responseBuilder = Response.ok(saveResult);
        return responseBuilder.build();
    }

    @PUT
    public Response updateTypeContract(TypeContract typeContract) {
        ReturnModel<TypeContract> updateResult = typeContractService.save(typeContract);
        Response.ResponseBuilder responseBuilder = Response.ok(updateResult);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteTypeContract(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = typeContractService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        return responseBuilder.build();
    }

}

package com.dh.ssic.controller;

import com.dh.ssic.model.AccidentType;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.AccidentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/accidentType")
@Produces(MediaType.APPLICATION_JSON)
public class AccidentTypeController {
    @Autowired
    ApplicationContext appContext;
    private AccidentTypeService accidentTypeService;

    public AccidentTypeController(AccidentTypeService accidentTypeService) {
        this.accidentTypeService = accidentTypeService;
    }

    @GET
    public Response getAccidentTypes() {
        Response.ResponseBuilder responseBuilder;
        try {
            EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
            List<AccidentType> list = accidentTypeService.getAllAccidentType(entityService);
            ReturnModel<List<AccidentType>> result = new ReturnModel<>();
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
    public Response getAccidentTypeById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<AccidentType> result = accidentTypeService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @POST
    public Response saveAccidentType(AccidentType accidentType) {
        ReturnModel<AccidentType> saveResult = accidentTypeService.save(accidentType);
        Response.ResponseBuilder responseBuilder = Response.ok(saveResult);
        return responseBuilder.build();
    }

    @PUT
    public Response updateAccidentType(AccidentType accidentType) {
        ReturnModel<AccidentType> updateResult = accidentTypeService.save(accidentType);
        Response.ResponseBuilder responseBuilder = Response.ok(updateResult);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteAccidentType(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = accidentTypeService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        return responseBuilder.build();
    }
}

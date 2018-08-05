package com.dh.ssic.controller;

import com.dh.ssic.model.Accident;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.AccidentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/accidents")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin
public class AccidentController {
    private AccidentService accidentService;
    @Autowired
    ApplicationContext appContext;

    public AccidentController(AccidentService accidentService) {
        this.accidentService = accidentService;
    }

    @GET
    public Response getAccidents() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        List<Accident> list = accidentService.getAllAccidents(entityService);
        ReturnModel<List<Accident>> result = new ReturnModel<>();
        result.setObject(list);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }


    @GET
    @Path("/{id}")
    public Response getAccidentsById(@PathParam("id") @NotNull Integer id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<Accident> accident = accidentService.getAccidentById(id, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(accident);
        return responseBuilder.build();
    }

    @POST
    public Response saveAccident(Accident accident) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<BigDecimal> accidentPersisted = accidentService.saveAccident(accident, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(accidentPersisted);
        return responseBuilder.build();
    }

    @PUT
    public Response updateAccident(Accident accident) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> accidentPersisted = accidentService.updateAccident(accident, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(accidentPersisted);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteAccident(@PathParam("id") String id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<Integer> deleteResult = accidentService.deleteAccident(Integer.valueOf(id), entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        return responseBuilder.build();
    }
}

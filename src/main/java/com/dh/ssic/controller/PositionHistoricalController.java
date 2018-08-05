package com.dh.ssic.controller;

import com.dh.ssic.model.PositionHistorical;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.PositionHistoricalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/positionhistorical")
@Produces("application/json")
public class PositionHistoricalController {
    private PositionHistoricalService positionHistoricalService;
    @Autowired
    ApplicationContext appContext;
    public PositionHistoricalController(PositionHistoricalService positionHistoricalService) {
        this.positionHistoricalService = positionHistoricalService;
    }

    @GET
    public Response getPositionHistoricals() {
        ReturnModel<List<PositionHistorical>> result = positionHistoricalService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getPositionHistoricalsById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<PositionHistorical> positionHistorical = positionHistoricalService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(positionHistorical);
        // addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("employee/{id}")
    public Response getPositionHistoricalsByEmployee(@PathParam("id") @NotNull Integer id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<PositionHistorical>> positionHistorical = positionHistoricalService.findByEmployeeKey(id, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(positionHistorical);
        // addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response savePositionHistorical(PositionHistorical positionHistorical) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> positionHistoricalPersisted = positionHistoricalService.SavePositionHistorical(positionHistorical, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(positionHistoricalPersisted);
        // addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updatePositionHistorical(PositionHistorical positionHistorical) {
        ReturnModel<PositionHistorical> positionHistoricalPersisted = positionHistoricalService.save(positionHistorical);
        Response.ResponseBuilder responseBuilder = Response.ok(positionHistoricalPersisted);
        // addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deletePositionHistorical(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = positionHistoricalService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        //addCorsHeader(responseBuilder);
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

package com.dh.ssic.controller;

import com.dh.ssic.model.Position;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/position")
@Produces("application/json")
public class PositionController {
    private PositionService positionService;
    @Autowired
    ApplicationContext appContext;
    public PositionController(PositionService positionService) {
        this.positionService = positionService;
    }

    @GET
    public Response getPositions() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<Position>> result = positionService.GetPositions(entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getPositionById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<Position> position = positionService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(position);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response savePosition(Position position) {
        ReturnModel<Position> positionPersisted = positionService.save(position);
        Response.ResponseBuilder responseBuilder = Response.ok(positionPersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updatePosition(Position position) {
        ReturnModel<Position> positionPersisted = positionService.save(position);
        Response.ResponseBuilder responseBuilder = Response.ok(positionPersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deletePosition(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = positionService.deleteById(Integer.valueOf(id));
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

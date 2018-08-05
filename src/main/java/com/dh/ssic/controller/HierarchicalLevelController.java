package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.HierarchicalLevel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.HierarchicalLevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/hierarchicallevel")
@Produces("application/json")
public class HierarchicalLevelController {
    private HierarchicalLevelService hierarchicalLevelService;
    @Autowired
    ApplicationContext appContext;
    public HierarchicalLevelController(HierarchicalLevelService hierarchicalLevelService) {
        this.hierarchicalLevelService = hierarchicalLevelService;
    }

    @GET
    public Response getHierarchicalLevels() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<HierarchicalLevel>> result = hierarchicalLevelService.GetHierarchicalLevels(entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getHierarchicalLevelsById(@PathParam("id") @NotNull Integer id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<HierarchicalLevel> hierarchicalLevel = hierarchicalLevelService.GetHierarchicalLevel(id, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(hierarchicalLevel);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveHierarchicalLevel(HierarchicalLevel hierarchicalLevel) {
        ReturnModel<HierarchicalLevel> hierarchicalLevelPersisted = hierarchicalLevelService.save(hierarchicalLevel);
        Response.ResponseBuilder responseBuilder = Response.ok(hierarchicalLevelPersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateHierarchicalLevel(HierarchicalLevel hierarchicalLevel) {
        ReturnModel<HierarchicalLevel> hierarchicalLevelPersisted = hierarchicalLevelService.save(hierarchicalLevel);
        Response.ResponseBuilder responseBuilder = Response.ok(hierarchicalLevelPersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteHierarchicalLevel(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = hierarchicalLevelService.deleteById(Integer.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }
}

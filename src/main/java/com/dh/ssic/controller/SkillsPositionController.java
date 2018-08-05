package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.SkillsPosition;
import com.dh.ssic.services.SkillsPositionService;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/skillsposition")
@Produces("application/json")
public class SkillsPositionController {
    private SkillsPositionService skillsPositionService;

    public SkillsPositionController(SkillsPositionService skillsPositionService) {
        this.skillsPositionService = skillsPositionService;
    }

    @GET
    public Response getSkillsPositions() {
        ReturnModel<List<SkillsPosition>> result = skillsPositionService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getSkillsPositionsById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<SkillsPosition> skillsPosition = skillsPositionService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(skillsPosition);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveSkillsPosition(SkillsPosition skillsPosition) {
        ReturnModel<SkillsPosition> skillsPositionPersisted = skillsPositionService.save(skillsPosition);
        Response.ResponseBuilder responseBuilder = Response.ok(skillsPositionPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateSkillsPosition(SkillsPosition skillsPosition) {
        ReturnModel<SkillsPosition> skillsPositionPersisted = skillsPositionService.save(skillsPosition);
        Response.ResponseBuilder responseBuilder = Response.ok(skillsPositionPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteSkillsPosition(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = skillsPositionService.deleteById(Integer.valueOf(id));
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

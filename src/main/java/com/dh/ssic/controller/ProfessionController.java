package com.dh.ssic.controller;

import com.dh.ssic.model.Profession;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.services.ProfessionService;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/profession")
@Produces("application/json")
public class ProfessionController {
    private ProfessionService professionService;

    public ProfessionController(ProfessionService professionService) {
        this.professionService = professionService;
    }

    @GET
    public Response getProfessions() {
        ReturnModel<List<Profession>> result = professionService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getProfessionById(@PathParam("id") @NotNull int id) {
        ReturnModel<Profession> profession = professionService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(profession);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveProfession(Profession profession) {
        ReturnModel<Profession> professionPersisted = professionService.save(profession);
        Response.ResponseBuilder responseBuilder = Response.ok(professionPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateProfession(Profession profession) {
        ReturnModel<Profession> professionPersisted = professionService.save(profession);
        Response.ResponseBuilder responseBuilder = Response.ok(professionPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteProfession(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = professionService.deleteById(Integer.valueOf(id));
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

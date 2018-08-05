package com.dh.ssic.controller;

import com.dh.ssic.command.PoliticNotifications;
import com.dh.ssic.model.Politics;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.services.PoliticsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/politics")
@Produces("application/json")
@CrossOrigin
public class PoliticsController {

    private PoliticsService politicsService;

    public PoliticsController(PoliticsService politicsService) {
        this.politicsService = politicsService;
    }

    @GET
    public Response getPolitics() {
        Response.ResponseBuilder responseBuilder;
        try {
            ReturnModel<List<Politics>> result = politicsService.findAll();
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
    public Response getPoliticsById(@PathParam("id") @NotNull int id) {
        Response.ResponseBuilder responseBuilder;
        try {
            ReturnModel<Politics> politic = politicsService.findById(id);
            responseBuilder = Response.ok(politic);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @POST
    public Response savePolitics(PoliticNotifications politicNotifications) {
        Response.ResponseBuilder responseBuilder;
        try {
            ReturnModel<Politics> professionPersisted = politicsService.createPolitic(politicNotifications);
            responseBuilder = Response.ok(professionPersisted);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @PUT
    public Response updatePolitics(Politics politic) {
        Response.ResponseBuilder responseBuilder;
        try {
            ReturnModel<Politics> professionPersisted = politicsService.save(politic);
            responseBuilder = Response.ok(professionPersisted);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deletePolitics(@PathParam("id") String id) {
        Response.ResponseBuilder responseBuilder;
        try {
            ReturnModel<String> deleteResult = politicsService.deleteById(Integer.valueOf(id));
            responseBuilder = Response.ok(deleteResult);
        } catch (Exception e) {
            ReturnModel<ReturnSPModel> resError = new ReturnModel<>();
            resError.setCode(-1);
            resError.setMessage(e.getMessage());
            responseBuilder = Response.ok(resError);
        }
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

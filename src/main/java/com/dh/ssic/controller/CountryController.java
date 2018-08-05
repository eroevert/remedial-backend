package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.Country;
import com.dh.ssic.services.CountryService;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/country")
@Produces("application/json")
public class CountryController {
    private CountryService countryService;

    public CountryController(CountryService countryService) {
        this.countryService = countryService;
    }

    @GET
    public Response getCountrys() {
        ReturnModel<List<Country>> result = countryService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }
    @GET
    @Path("/JDBC")
    public Response getCountrys_JDBC() {
        ReturnModel<List<Country>> result = countryService.GetList_DB();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getCountrysById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<Country> country = countryService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(country);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveCountry(Country country) {
        ReturnModel<Country> countryPersisted = countryService.save(country);
        Response.ResponseBuilder responseBuilder = Response.ok(countryPersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateCountry(Country country) {
        ReturnModel<Country> countryPersisted = countryService.save(country);
        Response.ResponseBuilder responseBuilder = Response.ok(countryPersisted);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteCountry(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = countryService.deleteById(Integer.valueOf(id));
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

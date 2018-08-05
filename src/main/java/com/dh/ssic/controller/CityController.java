package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.City;
import com.dh.ssic.model.ReturnSPModel;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.NameService;
import com.dh.ssic.services.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/city")
@Produces("application/json")
public class CityController {
    private CityService cityService;
    @Autowired
    ApplicationContext appContext;

    public CityController(CityService cityService) {
        this.cityService = cityService;
    }

    @GET
    public Response getCities() {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<City>> result = cityService.GetCities(entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @GET
    @Path("/getCitiesByCountryId/{idCountry}")
    public Response getCitysByIdCountry(@PathParam("idCountry") @NotNull Integer id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<List<City>> result = new ReturnModel<>();
        result.setObject(cityService.getCitiesByIdCountry(id, entityService));
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getCitysById(@PathParam("id") @NotNull Integer id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<City> city = cityService.FindCityById(id, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(city);
        return responseBuilder.build();
    }

    @POST
    public Response saveCity(City city) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> cityPersisted = cityService.SaveCity(city, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(cityPersisted);
        return responseBuilder.build();
    }

    @PUT
    public Response updateCity(City city) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> cityPersisted = cityService.UpdateOrganization(city, entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(cityPersisted);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteCity(@PathParam("id") String id) {
        EntityService entityService = (EntityService) appContext.getBean(NameService.ENTITY_SERVICE);
        ReturnModel<ReturnSPModel> deleteResult = cityService.DeleteCity(Integer.valueOf(id), entityService);
        Response.ResponseBuilder responseBuilder = Response.ok(deleteResult);
        return responseBuilder.build();
    }
}

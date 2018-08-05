package com.dh.ssic.controller;

import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.model.Currency;
import com.dh.ssic.services.CurrencyService;
import org.springframework.stereotype.Controller;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/currency")
@Produces("application/json")
public class CurrencyController {
    private CurrencyService currencyService;

    public CurrencyController(CurrencyService currencyService) {
        this.currencyService = currencyService;
    }

    @GET
    public Response getCurrencys() {
        ReturnModel<List<Currency>> result = currencyService.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getCurrencysById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<Currency> currency = currencyService.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(currency);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveCurrency(Currency currency) {
        ReturnModel<Currency> currencyPersisted = currencyService.save(currency);
        Response.ResponseBuilder responseBuilder = Response.ok(currencyPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateCurrency(Currency currency) {
        ReturnModel<Currency> currencyPersisted = currencyService.save(currency);
        Response.ResponseBuilder responseBuilder = Response.ok(currencyPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteCurrency(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = currencyService.deleteById(Integer.valueOf(id));
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

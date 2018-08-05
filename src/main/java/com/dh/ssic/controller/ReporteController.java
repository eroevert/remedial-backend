package com.dh.ssic.controller;

import com.dh.ssic.model.Accident;
import com.dh.ssic.services.ReporteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import java.util.List;

@Controller
@Path("/reporte")
@Produces("application/json")
public class ReporteController {
    @Autowired
    ReporteService reporteService;

    @GET
    @Path("/{nombre}/{cargo}")
    public Response getSalaryScalesById(@PathParam("nombre")  String nombre, @PathParam("cargo")  String cargo ) {
       List<Accident> result = reporteService.reporteAccident(nombre,cargo);

        Response.ResponseBuilder responseBuilder = Response.ok(result);
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

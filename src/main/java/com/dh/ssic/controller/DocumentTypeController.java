package com.dh.ssic.controller;

import com.dh.ssic.model.DocumentType;
import com.dh.ssic.model.ReturnModel;
import com.dh.ssic.services.DocumentTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/documenttypes")
@Produces("application/json")
@CrossOrigin
//@Produces(MediaType.APPLICATION_JSON)
public class DocumentTypeController {
    private DocumentTypeService service;

    public DocumentTypeController(DocumentTypeService documentTypeService) {
        this.service = documentTypeService;
    }

    @GET
    public Response getDocumentTypes() {
        List<DocumentType> DocumentTypesList = new ArrayList<>();
        ReturnModel<List<DocumentType>> result = service.findAll();
        Response.ResponseBuilder responseBuilder = Response.ok(result);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getDocumentTypesById(@PathParam("id") @NotNull Integer id) {
        ReturnModel<DocumentType> organization = service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(organization);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveDocumentType(DocumentType documentType) {
        System.out.println(documentType.getDocumentTypeKey());
        ReturnModel<DocumentType> organizationPersisted = service.save(documentType);
        Response.ResponseBuilder responseBuilder = Response.ok(organizationPersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateDocumentType(DocumentType documentType) {
        ReturnModel<DocumentType> documenttypePersisted = service.save(documentType);
        Response.ResponseBuilder responseBuilder = Response.ok(documenttypePersisted);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @DELETE
    @Path("/delete/{id}")
    public Response deleteDocumentType(@PathParam("id") String id) {
        ReturnModel<String> deleteResult = service.deleteById(Integer.valueOf(id));
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

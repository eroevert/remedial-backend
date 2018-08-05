package com.dh.ssic;

import com.dh.ssic.controller.*;
import com.dh.ssic.repositories.EntityService;
import com.dh.ssic.repositories.EntityServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.ws.rs.Path;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerResponseContext;
import javax.ws.rs.container.ContainerResponseFilter;
import javax.ws.rs.ext.ContextResolver;
import javax.ws.rs.ext.Provider;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

@Component
@ApplicationPath("/")
public class JerseyConfig extends ResourceConfig {

    @Autowired
    public JerseyConfig(ObjectMapper objectMapper) {
        // register endpoints
        //packages("com.dh.ssic.controller");
        // register jackson for json
                register(new ObjectMapperContextResolver(objectMapper));
        register(MultiPartFeature.class);
        register(new CorsFilter());

        register(AcademicInformationController.class);
        register(AcademicLevelController.class);
        register(AccidentController.class);
        register(CityController.class);
        register(ContactInformationController.class);
        register(CountryController.class);
        register(CurrencyController.class);
        register(DocumentTypeController.class);
        register(EmployeeController.class);
        register(EquipmentAssignmentController.class);
        register(EquipmentController.class);
        register(EquipmentTypeController.class);
        register(HierarchicalLevelController.class);
        register(IndexController.class);
        register(InstitutionController.class);
        register(InventoryViewController.class);
        register(ItemController.class);
        register(LoginController.class);
        register(NotificationController.class);
        register(OrganizationalHierarchyController.class);
        register(OrganizationController.class);
        register(PersonalDocumentController.class);
        register(PoliticsController.class);
        register(PositionController.class);
        register(ProfessionController.class);
        register(ReporteController.class);
        register(RolController.class);
        register(SalaryScaleController.class);
        register(SkillController.class);
        register(SkillsPositionController.class);
        register(TypeContactController.class);
        register(TypeContractController.class);
        register(UserController.class);
        register(WorkExperienceController.class);

        register(EntityServiceImpl.class);
        register(EntityService.class);
    }

    @Autowired
    ApplicationContext appCtx;
    @PostConstruct
    public void setup() {
        Map<String,Object> beans = appCtx.getBeansWithAnnotation(Path.class);
        for (Object o : beans.values()) {
            System.out.println(" -> " + o.getClass().getName());
            register(o);
        }
        String[] beanNames = appCtx.getBeanDefinitionNames();
        Arrays.sort(beanNames);
        for (String beanName : beanNames) {
            System.out.println("------->"+beanName);
        }
    }

    @Provider
    public static class ObjectMapperContextResolver implements ContextResolver<ObjectMapper> {
        private final ObjectMapper mapper;

        public ObjectMapperContextResolver(ObjectMapper mapper) {
            this.mapper = mapper;
        }

        @Override
        public ObjectMapper getContext(Class<?> type) {
            return mapper;
        }
    }

    @Provider
    public class CorsFilter implements ContainerResponseFilter {
        @Override
        public void filter(ContainerRequestContext requestContext,
                           ContainerResponseContext responseContext) throws IOException {
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Origin", "*");
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Credentials", "false");
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Headers",
                    "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
            responseContext.getHeaders().add(
                    "Access-Control-Allow-Methods",
                    "GET, POST, PUT, DELETE, OPTIONS, HEAD");
        }
    }

}



package com.dh.ssic.bootstrap;

import com.dh.ssic.model.*;
import com.dh.ssic.repositories.*;
import com.dh.ssic.repository.*;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//@Component
//public class DevBootstrap implements ApplicationListener<ContextRefreshedEvent> {
//    private EquipmentAssignmentRepository equipmentAssignmentRepository;
//    private EquipmentRepository equipmentRepository;
//    private EquipmentTypeRepository equipmentTypeRepository;
//    private EmployeeRepository employeeRepository;
//    private HierarchicalLevelRepository hierarchicalLevelRepository;
//    private OrganizationRepository organizationRepository;
//    private RolRepository rolRepository;
//    private UserRepository userRepository;
//    private DocumenTypeRepository documentTypeRepsitory;
//    private PersonalDocumentRepository personalDocumentRepository;
//    private PositionHistoricalRepository positionHistoricalRepository;
//    private ItemRepository itemRepository;
//
//    public DevBootstrap(EquipmentAssignmentRepository equipmentAssignmentRepository, EquipmentRepository equipmentRepository,
//                        EquipmentTypeRepository equipmentTypeRepository, EmployeeRepository employeeRepository,
//                        HierarchicalLevelRepository hierarchicalLevelRepository, OrganizationRepository organizationRepository,
//                        RolRepository rolRepository, UserRepository userRepository, DocumenTypeRepository documentTypeRepsitory, PersonalDocumentRepository personalDocumentRepository,
//                        PositionHistoricalRepository positionHistoricalRepository, ItemRepository itemRepository) {
//        this.equipmentAssignmentRepository = equipmentAssignmentRepository;
//        this.equipmentTypeRepository = equipmentTypeRepository;
//        this.employeeRepository = employeeRepository;
//        this.equipmentRepository = equipmentRepository;
//        this.hierarchicalLevelRepository = hierarchicalLevelRepository;
//        this.organizationRepository = organizationRepository;
//        this.rolRepository = rolRepository;
//        this.userRepository = userRepository;
//        this.documentTypeRepsitory = documentTypeRepsitory;
//        this.personalDocumentRepository = personalDocumentRepository;
//        this.positionHistoricalRepository = positionHistoricalRepository;
//        this.itemRepository = itemRepository;
//    }
//
//    @Override
//    public void onApplicationEvent(ContextRefreshedEvent applicationEvent) {
//        initData();
//    }
//
//    private void initData() {
//        buildRole();
//        buildEquipmentType();
//        buildEquipment();
//        buildHierarchyLevel();
//
//        try {
//            buildOrganization();
//            buildEmployee();
//            buildPersonalDocument();
//            buildUser();
//            buildEquipmentAssignment();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    private void buildRole() {
//        Rol rol = new Rol();
//        rol.setDescription("Rol de administrador");
//        rol.setName("Administrador");
//        rolRepository.save(rol);
//    }
//
//    private void buildUser() {
//        Rol rol = rolRepository.findByName("Administrador");
//        Employee employee = employeeRepository.findByEmployeeCode("EMP-1");
//        User user = new User();
//        user.setEmployeeKey(employee.getEmployeeKey());
//        user.setPassword("123456");
//        user.setUserName("admin");
//        user.setRolKey(rol.getRolKey());
//        user.setStatus("1");
//        userRepository.save(user);
//
//        Employee employeeguest = employeeRepository.findByEmployeeCode("test");
//        User userguest = new User();
//        userguest.setEmployeeKey(employeeguest.getEmployeeKey());
//        userguest.setPassword("123456");
//        userguest.setUserName("guest");
//        userguest.setRolKey(rol.getRolKey());
//        userguest.setStatus("1");
//        userRepository.save(userguest);
//    }
//
//    private void buildEquipmentType() {
//        EquipmentType equipmentType = new EquipmentType();
//        equipmentType.setDescription("Equipos de Protección individual");
//        equipmentType.setName("Protección individual");
//        equipmentTypeRepository.save(equipmentType);
//        EquipmentType equipmentType2 = new EquipmentType();
//        equipmentType2.setDescription("Equipos de Protección colectiva");
//        equipmentType2.setName("Protección colectiva");
//        equipmentTypeRepository.save(equipmentType2);
//        EquipmentType equipmentType3 = new EquipmentType();
//        equipmentType3.setDescription("Equipos de comunicación");
//        equipmentType3.setName("Construccion");
//        equipmentTypeRepository.save(equipmentType3);
//    }
//
//    private void buildEquipment() {
//
//        EquipmentType equipmentType = equipmentTypeRepository.getSingleEquipmentTypeByName("Protección individual");
//
//        Equipment equipment = new Equipment();
//        equipment.setCode("EQ-1");
//        equipment.setDescription("Guantes");
//        equipment.setName("Guantes");
//        equipment.setStatus("1");
//        equipment.setEquipmentTypeKey(equipmentType.getEquipmentTypeKey());
//        equipmentRepository.save(equipment);
//        Equipment equipment2 = new Equipment();
//        equipment2.setCode("EQ-2");
//        equipment2.setDescription("Barbijo");
//        equipment2.setName("Barbijo");
//        equipment2.setStatus("1");
//        equipment2.setEquipmentTypeKey(equipmentType.getEquipmentTypeKey());
//        equipmentRepository.save(equipment2);
//        Equipment equipment3 = new Equipment();
//        equipment3.setCode("EQ-3");
//        equipment3.setDescription("Lentes");
//        equipment3.setName("Lentes");
//        equipment3.setStatus("1");
//        equipment3.setEquipmentTypeKey(equipmentType.getEquipmentTypeKey());
//        equipmentRepository.save(equipment3);
//    }
//
//    private void buildEmployee() throws Exception {
//
//        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        Date date = dateFormat.parse("23/09/2007");
//        long time = date.getTime();
//
//        Organization organization = organizationRepository.findByName("Jefatura Nivel 1");
//        Employee employee = new Employee();
//        employee.setOrganizationKey(organization.getOrganizationKey());
//        employee.setAdmissionDate(new Timestamp(time));
//        employee.setBirthDate(new Timestamp(time));
//        employee.setEmployeeCode("EMP-1");
//        employee.setFirstName("JUAN");
//        employee.setLastName("PEREZ");
//        employee.setGender("M");
//        employee.setNationality("BOLIVIANA");
//        employee.setPhoto("Y");
//        employee.setStatus("1");
//        employeeRepository.save(employee);
//    }
//
//    private void buildPosotionHistorical() throws Exception {
//        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        Date date = dateFormat.parse("23/09/2007");
//        long time = date.getTime();
//        Employee employee = employeeRepository.findByEmployeeCode("EMP-1");
//
//        //Item item = itemRepository.findById(1);
//        PositionHistorical positionHistorical = new PositionHistorical();
//        positionHistorical.setEmployeeKey(employee.getEmployeeKey());
//        positionHistorical.setItemKey(1);
//        positionHistorical.setMemoNumber("123456");
//        positionHistorical.setStatus("1");
//        positionHistorical.setApprovalDate(new Timestamp(time));
//        positionHistorical.setStart(new Timestamp(time));
//        positionHistorical.setEnd(new Timestamp(time));
//        positionHistorical.setResponsibleKey(1);
//        positionHistoricalRepository.save(positionHistorical);
//
//    }
//
//    /*
//    *  private int historialCargoId;
//    private int employeeKey;
//    private int itemKey;
//    private String memoNumber;
//    private Timestamp start;
//    private Timestamp end;
//    private String status;
//    private int responsibleKey;
//    private Timestamp approvalDate;
//    private Employee employeeByEmployeeKey;
//    private Item itemByItemKey;
//    * */
//
//    private void buildPersonalDocument() throws Exception {
//        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        Date date = dateFormat.parse("23/09/2007");
//        long time = date.getTime();
//        Employee employee = employeeRepository.findByEmployeeCode("EMP-1");
//        DocumentType documentType = documentTypeRepsitory.findByName("Carnet de Identidad");
//        PersonalDocument personalDocument = new PersonalDocument();
//        personalDocument.setEmployeeKey(employee.getEmployeeKey());
//        personalDocument.setDocumentKey(documentType.getDocumentTypeKey());
//        personalDocument.setNumber("123456");
//        personalDocument.setDueDate(new Timestamp(time));
//        personalDocument.setIssueDate(new Timestamp(time));
//        personalDocument.setObservation("OBSErVACION");
//        //personalDocument.setDigital(();
//        personalDocument.setStatus("1");
//        personalDocument.setReference("ref");
//        personalDocument.setDocumentTypeByDocumentKey(documentType);
//        personalDocument.setEmployeeByEmployeeKey(employee);
//        personalDocumentRepository.save(personalDocument);
//
//
//       /* private int personalDocumentKey;
//        private int employeeKey;
//        private int documentKey;
//        private String number;
//        private Timestamp issueDate;
//        private Timestamp dueDate;
//        private String observation;
//        private byte[] digital;
//        private String status;
//        private String reference;
//        private Employee employeeByEmployeeKey;
//        private DocumentType documentTypeByDocumentKey;*/
//    }
//
//    private void buildHierarchyLevel() {
//        HierarchicalLevel hierarchicalLevel = new HierarchicalLevel();
//        hierarchicalLevel.setHierarchicalLevelKey(1);
//        hierarchicalLevel.setLevel("0");
//        hierarchicalLevel.setName("Directorio");
//        hierarchicalLevel.setStatus("1");
//        hierarchicalLevelRepository.save(hierarchicalLevel);
//
////    HierarchicalLevel hierarchicalLevel1 = new HierarchicalLevel();
////        hierarchicalLevel.setHierarchicalLevelKey(2);
////        hierarchicalLevel1.setLevel("1");
////        hierarchicalLevel1.setName("Gerencia General");
////        hierarchicalLevel1.setStatus("1");
////        hierarchicalLevelRepository.save(hierarchicalLevel1);
////
////        HierarchicalLevel hierarchicalLevel2 = new HierarchicalLevel();
////        hierarchicalLevel.setHierarchicalLevelKey(3);
////        hierarchicalLevel2.setLevel("2");
////        hierarchicalLevel2.setName("Gerencia de areas");
////        hierarchicalLevel2.setStatus("1");
////        hierarchicalLevelRepository.save(hierarchicalLevel2);
////
////        HierarchicalLevel hierarchicalLevel3 = new HierarchicalLevel();
////        hierarchicalLevel.setHierarchicalLevelKey(4);
////        hierarchicalLevel3.setLevel("4");
////        hierarchicalLevel3.setName("Jefatura de Departamento");
////        hierarchicalLevel3.setStatus("1");
////        hierarchicalLevelRepository.save(hierarchicalLevel3);
//
//    }
//
//    private void buildOrganization() throws ParseException {
//        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        Date date = dateFormat.parse("28/04/2018");
//        long time = date.getTime();
//
//        HierarchicalLevel hierarchicalLevel = hierarchicalLevelRepository.findByName("Directorio");
//
//        Organization organization = new Organization();
//        organization.setCode("ORG-1");
//        organization.setDescription("Jefatura");
//        organization.setEnd(new Timestamp(time));
//        organization.setGestion("2018");
//        organization.setIdPadre(1);
//        organization.setHierarchicalLevelKey(hierarchicalLevel.getHierarchicalLevelKey());
//        organization.setName("Jefatura Nivel 1");
//        organization.setStart(new Timestamp(time));
//        organization.setStatus("1");
//        organization.setUpdatedOn(new Date());
//        organization.setCreatedOn(new Date());
//        organizationRepository.save(organization);
//    }
//
//    private void buildEquipmentAssignment() throws ParseException {
//        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        Date date = dateFormat.parse("28/04/2018");
//        long time = date.getTime();
//
//        User user = userRepository.findByUserName("admin");
//        Employee employee = employeeRepository.findByEmployeeCode("EMP-1");
//        List<Equipment> equipmentList = equipmentRepository.findByCode("EQ-1").get();
//        Equipment equipment = equipmentList.size() > 0 ? equipmentList.get(0) : null;
//        EquipmentAssignment equipmentAssignment = new EquipmentAssignment();
//        equipmentAssignment.setUserKey(user.getUserKey());
//        equipmentAssignment.setDateRegistration(new Timestamp(time));
//        equipmentAssignment.setObservations("Asignación temporal");
//        equipmentAssignment.setEmployeeKey(employee.getEmployeeKey());
//        equipmentAssignment.setEquipmentKey(equipment.getEquipmentKey());
//        equipmentAssignment.setStatus("1");
//        equipmentAssignment.setDate(new Date());
//        equipmentAssignment.setCreatedOn(new Timestamp(time));
//        equipmentAssignmentRepository.save(equipmentAssignment);
//        List<Equipment> equipmentList2 = equipmentRepository.findByCode("EQ-2").get();
//        Equipment equipment2 = equipmentList2.size() > 0 ? equipmentList2.get(0) : null;
//        EquipmentAssignment equipmentAssignment2 = new EquipmentAssignment();
//        equipmentAssignment2.setUserKey(user.getUserKey());
//        equipmentAssignment2.setDateRegistration(new Timestamp(time));
//        equipmentAssignment2.setObservations("Asignación temporal");
//        equipmentAssignment2.setEmployeeKey(employee.getEmployeeKey());
//        equipmentAssignment2.setEquipmentKey(equipment2.getEquipmentKey());
//        equipmentAssignment2.setStatus("1");
//        equipmentAssignment2.setDate(new Date());
//        equipmentAssignment2.setCreatedOn(new Timestamp(time));
//        equipmentAssignmentRepository.save(equipmentAssignment2);
//    }
//}

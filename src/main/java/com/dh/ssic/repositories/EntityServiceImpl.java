package com.dh.ssic.repositories;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;
import java.util.Map;

@Repository(value = "entityService")
public class EntityServiceImpl implements EntityService {

    @PersistenceContext
    EntityManager em = null;


    public Object getEntity(String queryService, Object... values) {

        return getEntity(queryService, java.util.Arrays.asList(values));
    }

    public Object getEntity(String queryService, List values) {

        return findSingleResultNamedQuery(queryService, values);
    }

    public List getLsEntity(String queryService, Object... values) {

        return getLsEntity(queryService, java.util.Arrays.asList(values));
    }

    @Transactional(readOnly = true)
    public List getLsEntity(String queryService, List values) {

        if (queryService == null || values == null) return null;

        Query query = em.createNamedQuery(queryService);

        for (int i = 0; i < values.size(); i++)

            query.setParameter(i + 1, values.toArray()[i]);

        return query.getResultList();
    }


    @Transactional(readOnly = true)
    public <T> List<T> find(Class<T> tClass, String queryString, Object... values) {

        Query query = em.createQuery(queryString, tClass);

        for (int i = 0; i < java.util.Arrays.asList(values).size(); i++)

            query.setParameter(i + 1, java.util.Arrays.asList(values).toArray()[i]);

        return query.getResultList();
    }

    @Transactional(readOnly = true)
    public List pagination(String queryString, int firstResult, int maxResult, Object... values) {

        Query query = em.createNamedQuery(queryString);

        for (int i = 0; i < java.util.Arrays.asList(values).size(); i++)

            query.setParameter(i + 1, values[i]);

        query.setFirstResult(firstResult);
        query.setMaxResults(maxResult);

        return query.getResultList();
    }

    @Transactional(readOnly = true)
    public List find(String queryString, Object... values) {

        Query query = em.createQuery(queryString);

        for (int i = 0; i < java.util.Arrays.asList(values).size(); i++)

            query.setParameter(i + 1, values[i]);

        return query.getResultList();
    }


    @Transactional(readOnly = true)
    public List find(final String queryString, final List values) {

        Query query = em.createQuery(queryString);

        for (int i = 0; i < values.size(); i++)

            query.setParameter(i + 1, values.toArray()[i]);

        return query.getResultList();
    }

    @Transactional(readOnly = true)
    public List executeQuery(final String queryString) {
        Query query = em.createNativeQuery(queryString);
        return query.getResultList();
    }

//    @Transactional(readOnly = true)
//    public Object getSingleValueProcedureNative(final String storeProcedureName, final Map<String, Object> parameters,
//                                                final Map<String, Class> classParameters) {
//      String queryString = "EXEC " + storeProcedureName
//      int count = 0
//      for(Map.Entry<String, Object> parameter: parameters.entrySet()) {
//        count = count + 1
//        String compare = classParameters.get(parameter.getKey()).isInstance(Integer) ? parameter.getValue() : "'" + parameter.getValue() + "'"
//        queryString = queryString + " @" + parameter.getKey() + " = " + compare + (count != parameters.size() ? "," : "")
//      }
////      Query query = em.createNativeQuery(queryString)
////        return query.resultList
//      return  null
//    }

    @Transactional(readOnly = true)
    public List executeProcedure(final String storeProcedureName, final Map<String, Object> parameters, final Map<String, Class> classParameter) {
        StoredProcedureQuery storedProcedure = em.createStoredProcedureQuery(storeProcedureName);

        for (Map.Entry<String, Class> parameter : classParameter.entrySet()) {
            storedProcedure.registerStoredProcedureParameter(parameter.getKey(), parameter.getValue(), ParameterMode.IN);
        }

        for (Map.Entry<String, Object> parameter : parameters.entrySet()) {
            if (parameter.getValue() != null) {
                storedProcedure.setParameter(parameter.getKey(), parameter.getValue());
            } else {
                storedProcedure.setParameter(parameter.getKey(), "");
            }

        }

        return storedProcedure.getResultList();
    }

    @Transactional(readOnly = true)
    public int executeUpdate(final String queryString) {
        Query query = em.createNativeQuery(queryString);
        return query.executeUpdate();
    }

    @Transactional(readOnly = true)
    public <T> T find(Class<T> entityClass, Object primaryKey) throws DataAccessException {

        return em.find(entityClass, primaryKey);
    }

    @Transactional
    public void persist(Object entity) {

        em.persist(entity);
    }

    @Transactional
    public <T> T merge(T entity) {

        return em.merge(entity);
    }

    @Transactional
    public <T> T remove(T entity) {

        return em.merge(entity);
    }

    @Transactional
    public void delete(Object entity) {

        em.remove(entity);
    }

    public <T> T getReference(Class<T> tClass, Object primaryKey) {

        em.getReference(tClass, primaryKey);
        return null;
    }

    public void flush() {

        em.flush();
    }

    public Object findSingleResult(String queryString, List values) {

        Object model = find(queryString, values);

        return model != null && java.util.Arrays.asList(model).size() > 0 ? java.util.Arrays.asList(model).toArray()[0] : null;
    }

    public Object findSingleResultNamedQuery(final String name, final List values) {

        Object model = getLsEntity(name, values);

        return model != null && java.util.Arrays.asList(model).size() > 0 ? java.util.Arrays.asList(model).toArray()[0] : null;
    }

    public void close() {
        em.close();
    }

}


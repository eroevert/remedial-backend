package com.dh.ssic.repositories;

import org.springframework.dao.DataAccessException;

import java.util.List;
import java.util.Map;

public interface EntityService {

    public Object getEntity(String queryService, Object... values);

    public Object getEntity(String queryService, List values);

    public List getLsEntity(String queryService, Object... values);

    public List getLsEntity(String queryService, List values);

	public <T> List<T> find(Class<T> tClass, String query, Object... values);

	public <T> List<T> pagination(String query, int firstResult, int maxResult, Object... values);

	public List find(String queryString, Object... values);


    public <T> T find(Class<T> entityClass, Object primaryKey) throws DataAccessException;

    public void persist(Object entity);

    public <T> T merge(T entity);

    public <T> T remove(T entity);

    public void delete(Object entity);

    public <T> T getReference(Class<T> tClass, Object primaryKey);

    public void flush();

    public List executeQuery(final String queryString);

    public int executeUpdate(final String queryString);

    public void close();

    List executeProcedure(final String queryString, final Map<String, Object> parameters,
                          final Map<String, Class> classParameter);

//    Object getSingleValueProcedureNative(final String queryString, final Map<String, Object> parameters,
//                          final Map<String, Class> classParameters);
}
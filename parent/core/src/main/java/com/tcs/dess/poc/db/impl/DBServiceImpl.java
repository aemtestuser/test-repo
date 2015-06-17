package com.tcs.dess.poc.db.impl;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.commons.datasource.poolservice.DataSourcePool;
import com.tcs.dess.poc.db.DBService;


@Service(value=DBService.class)
@Component(metatype=true, immediate=true)
public class DBServiceImpl implements DBService{
	
	@Reference
	private DataSourcePool dataSourcePool;
	
	private static final Logger logger = LoggerFactory.getLogger(DBServiceImpl.class);

	@Override
	public Connection getConnection(){
		Connection conn = null;
		try {
			Object dataSourceObj = dataSourcePool.getDataSource(DATASOURCE_NAME);
			if(dataSourceObj == null){
				logger.warn("getConnection :: DataSource Object is NULL. Cannot create connection");
				return null;
			}
			if(!(dataSourceObj instanceof DataSource)){
				logger.warn("getConnection :: DataSource Object is not of type javax.sql.DataSource. Cannot create Connection");
				return null;
			}
			DataSource ds = (DataSource)dataSourceObj;
			conn = ds.getConnection();
		} catch (Exception e) {
			logger.error("Error occured while creating the Database connection.",e);
		}
		return conn;
	}

	@Override
	public void disposeConnection(Connection conn){
		if(conn == null){
			logger.info("disposeConnection :: Connection is already NULL.");
		}else{
			try {
				if(!conn.isClosed()){
					conn.close();
				}
			} catch (SQLException e) {
				logger.error("disposeConnection :: Exception occurred while closing the connection",e);
			}
		}		
	}

	@Override
	public void commit(Connection connection) {
		try{
			if(!connection.getAutoCommit()){
				connection.commit();
				logger.info("commit :: Transaction is committed.");
			}else{
				logger.info("commit :: Transaction is autocommitted.");
			}			
		}catch(Exception e){
			logger.error("Error occurred while committing",e);
		}
		
	}

	@Override
	public void rollback(Connection connection) {
		try{
			if(!connection.getAutoCommit()){
				connection.rollback();;
				logger.info("commit :: Transaction is rolled back.");
			}else{
				logger.info("commit :: Transaction is autorollback.");
			}			
		}catch(Exception e){
			logger.error("Error occurred while rolling back",e);
		}
		
	}
}

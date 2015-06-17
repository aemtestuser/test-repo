package com.tcs.dess.poc.db;

import java.sql.Connection;

public interface DBService {
	
	String DATASOURCE_NAME = "pocds";
	
	public Connection getConnection();
	
	public void disposeConnection(Connection conn);
	
	public void commit(Connection connection);
	
	public void rollback(Connection connection);

}

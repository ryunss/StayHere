package sqlmapper;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "sqlmapper/Configuration.xml";
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(reader != null)reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public static SqlSessionFactory getInstance() {
		return sqlSessionFactory;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

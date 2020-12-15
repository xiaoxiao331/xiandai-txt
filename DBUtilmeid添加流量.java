package tms.dlw.com.util.active;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import gaia.com.util.tools.fcc.StringUtil;

public class DBUtilmeid {
	
	public static Log log = LogFactory.getLog(DBUtilmeid.class);
	
	private static DBUtilmeid db = null;
	private static Connection conn = null;
	private static String user = "TMSISSWAS";
	private static String password = "gtms45!@";
	private static String driver = "com.tmax.tibero.jdbc.TbDriver";
    private static String url = "jdbc:tibero:thin:@10.124.253.151:1521:CCS";
   // private static String url = "jdbc:tibero:thin:@10.107.252.48:1521:GCS";
	//private static String url = "jdbc:tibero:thin:@10.109.132.134:1521:CCS";
	private DBUtilmeid(){
		
	}
	
	public static DBUtilmeid getInstance(){
		if(db == null){
			synchronized (DBUtilmeid.class) {
				if(db == null){
					db = new DBUtilmeid();
				}
			}
		}
		return db;
	}
	
	static {
		// 加载驱动
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// 建立连接
	public static Connection getConn(){
		try{
			return DriverManager.getConnection(url, user, password);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] args) {

		String meid = "89860919740008326276";
		String vin = "";	
		String cnvrVal = "";  
		String strOpio = "";
		String FLOW_PACKAGE_TYPE="";
		//List<String> vehlcdList = Arrays.asList("DN8");

		// 测试插入
		//String insert_sql = "insert into bt_ccs_certification_data(vin,meid,ccsp_id,CSMR_NM,SERVNUMBER,CERTIFICATION_STATUS)values(?,1111,1111,'ceshi','18611403856','01')";
		//System.out.println(insert(insert_sql, "1111"));
		
		// 2、根据 vin 查询 meid
		log.info("开始获取 meid");
		//String meid_sql = "SELECT MEID FROM Bt_Car_Mst bccd WHERE bccd.VIN=?";
		String vin_sql = "SELECT vin FROM Bt_Car_Mst@ims_link bccd WHERE bccd.meid=?";
		
		Map<String, Object> vinMap = query(vin_sql, meid);
		if(vinMap != null){
			vin = StringUtil.isNullToString(vinMap.get("VIN"));
		}else{
			log.info("查询 vin 错误");
			return;
		}
		log.info("获取vin值=" + vin);
		
		
		
		// 1、根据 vin 查询 cnvr_val
		log.info("开始获取 cnvrVal");
		String cnvr_val_sql = "select cnvr_val from tb_car_dgn WHERE vin=? and dgn_cd ='00023'";
		Map<String, Object> cnvrValmap = query(cnvr_val_sql, vin);
		if(cnvrValmap != null){
			cnvrVal = StringUtil.isNullToString(cnvrValmap.get("CNVR_VAL"));
		}else{
			log.info("查询 cnvr_val 错误");
			return;
		}
		log.info("获取 cnvrVal值=" + cnvrVal);
		
		
		//查询车种信息
		boolean isopio3=false;
		String FLOW_PACKAGE_TYPE_sql="select FLOW_PACKAGE_TYPE From bt_car_mst b,tb_vehl_cd t where b.sale_vehl_cd=t.vehicle_cd  and vin=?" ;
		Map<String, Object> salevehlmap = query(FLOW_PACKAGE_TYPE_sql, vin);
		if(salevehlmap != null){
			FLOW_PACKAGE_TYPE = StringUtil.isNullToString(salevehlmap.get("FLOW_PACKAGE_TYPE"));
		
		}else{
			log.info("查询 FLOW_PACKAGE_TYPE 错误");
			return;
		}
		log.info("获取FLOW_PACKAGE_TYPE值=" + FLOW_PACKAGE_TYPE);
		log.info("isopio3===========>"+isopio3);
		
		// 3、判断 是否10G
		log.info("开始获取 strOpio");
		List<String> codeList = Arrays.asList("HC2B","KC2B","HC3B","KC2W","HC2F");
		 if(FLOW_PACKAGE_TYPE.equals("1")){
	            strOpio ="3";//3年无限流量
	        }
	        else if(FLOW_PACKAGE_TYPE.equals("2")){
	            
	            strOpio ="4";//5年无限流量
	        }
	        else if (FLOW_PACKAGE_TYPE.equals("3")){//无限流量
	            return;
	        }
//	      if ("HC2B".equals(dgnVal)||"KC2B".equals(dgnVal)||"HC3B".equals(dgnVal)) {
	        else { 
	            
	            if(codeList.contains(cnvrVal)) {
	        
	            strOpio ="2";//10G
	            }
	       
	        else {
	            strOpio ="1";//500M
	        }
	      }
		log.info("获取 strOpio值=" + strOpio);
		
		// 4、添加流量
		try {
			log.info("开始添加流量");
			String rString = CUActiveUtil.activeFreeCommodity("014", meid, strOpio, vin);
			log.info("流量添加结束: " + rString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String rString = "{\"result\":true,\"errorCode\":\"E200\",\"errorDescription\":\"激活成功！\"}";
		
		boolean result = false;
        String errorCode = "";
        String errorDescription = "";
		if(StringUtils.isNotBlank(rString)){
			JSONObject jsonObject = JSON.parseObject(rString);
			result = jsonObject.getBoolean("result");
			errorCode = jsonObject.getString("errorCode");
	        errorDescription = jsonObject.getString("errorDescription");
	        
	        if(result){
	        	// 插入数据
	        	System.out.println(result);
	        	System.out.println(errorCode);
	        	System.out.println(errorDescription);
	        	System.out.println("插入数据");
	        	
	    		// 5、插入流量添加的记录
	    		String insert_sql = "insert into bt_cu_activefreecommodity@ims_link(ICCID, RESULT, ERRORCODE, ERRORDESCRIPTION, RGST_ID, RGST_DTM) values (?, '1', 'E200', '激活成功！', 'main', SYSDATE)";
	    		log.info("开始插入结果");
	    		boolean bool = insert(insert_sql, meid);
	    		log.info("插入结果结束：" + bool);
	        }
		}
		
	}

	/**
	 * 查询数据
	 * @param sql
	 * @param params
	 * @return
	 */
	public static Map<String, Object> query(String sql, Object...params){
		// 创建Map映射存取每一列对应的值
		Map<String, Object> map = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try{
			// 获取连接
			conn = getConn();
			// 获得 PreparedStatement 对象进行预编译(?占位符)
			pst = conn.prepareStatement(sql);
			int paramsIndex = 1;
			for(Object p : params){
				pst.setObject(paramsIndex++, p);
			}
			// 执行sql获得结果集对象
			rs = pst.executeQuery();
			// 获得结果集中列的信息
			ResultSetMetaData rst = rs.getMetaData();
			// 获得结果集中列的数量
			int column= rst.getColumnCount();
			// 处理结果
			while(rs.next()){
				map = new HashMap<String, Object>();
				for(int i = 1; i <= column; i++){
					map.put(rst.getColumnName(i), rs.getObject(i));
					System.out.println(rst.getColumnName(i)+"----------"+rs.getObject(i));
				}
			}
			return map;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			// 关闭资源
			close(rs, pst, conn);
		}
	}
	
	/**
	 * 插入数据
	 * @param sql
	 * @param params
	 * @return
	 */
	public static boolean insert(String sql, Object...params){
		// 创建Map映射存取每一列对应的值
		PreparedStatement pst = null;
		try{
			// 获取连接
			conn = getConn();
			// 获得 PreparedStatement 对象进行预编译(?占位符)
			pst = conn.prepareStatement(sql);
			int paramsIndex = 1;
			for(Object p : params){
				pst.setObject(paramsIndex++, p);
			}
			// 执行sql
			pst.executeUpdate();
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			// 关闭资源
			close(null, pst, conn);
		}
	}
	
	// 关闭资源
	private static void close(ResultSet rs, PreparedStatement pst, Connection conn) {
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs = null;
		}
		if(pst != null){
			try {
				pst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			pst = null;
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}
	
	public static boolean isopio3(String vin){
		String sale_vehl_cd="";
		List<String> vehlcdList = Arrays.asList("DN8");

		boolean isopio3=false;
		String Sale_vehl_cd_sql="select sale_vehl_cd From bt_car_mst where  vin=?" ;
		Map<String, Object> salevehlmap = query(Sale_vehl_cd_sql, vin);
		if(salevehlmap != null){
			sale_vehl_cd = StringUtil.isNullToString(salevehlmap.get("SALE_VEHL_CD"));
			
			if(vehlcdList.contains(sale_vehl_cd)){
			    isopio3=true;
			}
			
		
		}else{
			log.info("查询 sale_vehl_cd 错误");
			return isopio3;
		}
		log.info("获取 sale_vehl_cd值=" + sale_vehl_cd);
		log.info("isopio3===========>"+isopio3);
		return isopio3;
		
		
	}
}

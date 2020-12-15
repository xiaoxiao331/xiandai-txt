package tms.dlw.com.util.active;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.SSLContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;

import gaia.com.util.tools.fcc.StringUtil;
import tms.dlw.com.util.AddrUtil;
import tms.dlw.com.util.CUUtil;
import tms.dlw.ibs.btc.vo.EditDevicesResVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CUJiHuo.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HSW
 * @since 2020年1月16日
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2020年1月16日     HSW     	최초 생성
 * </pre>
 * DEACTIVATED
 */

public class CUJiHuo2 {
    
	final static String EXCEL_LOCAL = "d:\\000.xls";
	
    public static Log log = LogFactory.getLog(CUUtil.class);
    
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    public static void main(String[] args) throws Exception {
//    	// 读取Excel表格内容数据
//        InputStream is2 = new FileInputStream(EXCEL_LOCAL);
//        ExcelReader excelReader = new ExcelReader();
//        List<DataModelVO> voList = excelReader.readExcelContent(is2);
//        
//        for (DataModelVO dataModelVO : voList) {
//		    // DEACTIVATED  ACTIVATED
//		    sendCuApi(dataModelVO.getMeid(),"ACTIVATED");
//        }
         sendCuApi("89860919740031485057", "ACTIVATED");
    }
    
    public static Boolean sendCuApi(String strMeid, String strStatus) throws Exception {
        
        boolean resultSt = false;
       
        // 直连 激活
        EditDevicesResVO editDevicesResVO = null;
        // 访问地址
        String url = AddrUtil.CU_10646_URL + strMeid;
        // 消息头
        Map<String, String> headsMap = new HashMap<String, String>();
        headsMap.put("Content-Type", "application/json");
        headsMap.put("Authorization", AddrUtil.AUTH_KEY);
        // 消息体
        Map<String, String> paramsMap = new HashMap<String, String>();
        paramsMap.put("status", strStatus);
	    // paramsMap.put("ratePlan","110WLW032650_MON-FLEX_300M_5S_SC");
        //3年5年免费流量
       // paramsMap.put("ratePlan","110WLW032650_MON-FLEX_300M_5S_MERGED_SC");
        //无限流量
        //  paramsMap.put("ratePlan","110WLW032650_MON-FLEX_1534M-5S_Merged");

        editDevicesResVO = doPut(url, headsMap, paramsMap);
        
        log.info(" cu ---------->>>>>end--EditDevicesResVO.getResponseCode():" + editDevicesResVO.getResponseCode());
        log.info(" cu ---------->>>>>end--EditDevicesResVO.getIccid():" + editDevicesResVO.getIccid());
        log.info(" cu ---------->>>>>end--EditDevicesResVO.getErrorCode():" + editDevicesResVO.getErrorCode());
        log.info(" cu ---------->>>>>end--EditDevicesResVO.getErrorMessage():" + editDevicesResVO.getErrorMessage());
        
        if(editDevicesResVO!=null && editDevicesResVO.getIccid() != null && strMeid.equals(editDevicesResVO.getIccid()) 
                && "200".equals(editDevicesResVO.getResponseCode())) {
            resultSt = true;
        }
        return resultSt;
    }
    
    /**
     * 访问 卡激活地址
     * @param url 访问地址
     * @param headsMap 消息头
     * @param paramsMap 参数
     * @return
     * @throws KeyManagementException 
     * @throws NoSuchAlgorithmException 
     */
    public static EditDevicesResVO doPut(String url, Map<String, String> headsMap, Map<String, String> paramsMap) throws Exception {
        log.info("CUApiRestOpenServiceImpl=>>sendCuApi=>>doPost=>>start effective");
        
        SSLContext ctx = SSLContexts.custom().useTLS().build();       
	    SSLConnectionSocketFactory  sslsf = new SSLConnectionSocketFactory(ctx,new String[]{"TLSv1.2"},null,SSLConnectionSocketFactory.getDefaultHostnameVerifier());        
        
        EditDevicesResVO editDevicesResVO = new EditDevicesResVO();
        String rs = null;
        CloseableHttpClient httpClient = HttpClientBuilder.create().setSSLSocketFactory(sslsf).build();
        String jsonString = JSON.toJSONString(paramsMap);
        log.info("param:" + jsonString);
        StringEntity entity = new StringEntity(jsonString, "UTF-8");
        log.info("entity:" + entity.getContentLength());
        HttpPut httpPut = new HttpPut(url);
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(15000).setConnectionRequestTimeout(15000).setSocketTimeout(15000).setRedirectsEnabled(true).build();
        httpPut.setConfig(requestConfig);
        for (String eachKey : headsMap.keySet()) {
            httpPut.setHeader(eachKey, headsMap.get(eachKey));
        }
        httpPut.setEntity(entity);
        //httpPut.setHeader("Connection","keep-alive");
        //httpPut.setProtocolVersion(HttpVersion.HTTP_1_1);

        CloseableHttpResponse response = null;
        try {
            log.info("httpClient execute:");
            response = httpClient.execute(httpPut);
            log.info("响应状态为:" + response.getStatusLine());
            HttpEntity responseEntity = response.getEntity();
            // 赋值 响应状态
            editDevicesResVO.setResponseCode(StringUtil.isNullToString(response.getStatusLine().getStatusCode()));
            if (responseEntity != null) {
                log.info("响应内容长度为:" + responseEntity.getContentLength());
                rs = EntityUtils.toString(responseEntity);
                log.info("响应内容为:" + rs);
                if(!StringUtil.isEmpty(rs)){
                    //HashMap<String, String> returnData = JSON.parseObject(rs, new TypeReference<HashMap<String, String>>() {});
                    com.alibaba.fastjson.JSONObject jsonObjectRs = JSON.parseObject(rs);
                    String returnIccid = jsonObjectRs.getString("iccid");
                    editDevicesResVO.setIccid(returnIccid);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            log.error("CUApiRestOpenServiceImpl=>>sendCuApi=>>doPost=>>execute", e);
        } finally {
            try {
                if (httpClient != null) {
                    httpClient.close();
                }
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        log.info("CUApiRestOpenServiceImpl=>>sendCuApi=>>doPost=>>end effective");
        return editDevicesResVO;
    }
    
   

}

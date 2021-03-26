/*  查询qq认证时间，单不代表所有的车型     链接CCS的库  */
	select * from BT_QQ_VIN_CHECK_INFO where VIN = 'LBECNAFD2MZ068989 ';
	
	/** 百度激活   ISADAS  1或者是 0 查找日志*/
	select OPN_DTM,mdfy_dtm, mdfy_id, isadas from bt_svc_opn_mst where vin ='LBES6AFD7KW041861';
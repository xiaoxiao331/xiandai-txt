--   开通失败时使用的sql
	select meid from bt_car_mst where vin='LBECNAFDXLZ000356';
	select *from bt_car_mst where vin='LBECNADD4LZ026938';     -- 车辆主表
	select *from bt_car_mst where meid='89860920740019752129';  
	
	select FIN_SMS_PW_YN from bt_tmnl_svc where meid= '89860920770008753838';     --   查出的值  1为加密    空为不加密
	select * from bt_tmnl_svc where meid='89860919740034307910';
	update bt_tmnl_svc set FIN_SMS_PW_YN=''   where meid= '89860919740001642927';    --- 修改成不加密
	update bt_tmnl_svc set FIN_SMS_PW_YN='1' where meid= '89860920770008753838';    --- 修改成加密
	update bt_car_mst set meid='89860920770040886695' WHERE VIN='LBECNAFD9MZ071016';
	update bt_car_mst set CAR_RGST_NO='浙A5Z88C' WHERE VIN='LBECNAFD0LZ011270';
	-- bt_tmnl_svc (终端服务表)
	select * from bt_tmnl_svc where meid='89860920740019752129'; 
	update bt_tmnl_svc set OPNG_PTT_ST_CD='EF' where meid='89860114511100609858'    -- 终端状态改为注册完毕   ER代表？SF代表？ EF代表开通   原始：SR // 二代
	update bt_tmnl_svc set OPNG_PTT_ST_CD='OF' where meid='D91010F64F5E24'   -- 原始  OP  终端表  // 一代 A开头
	--   A1000023C0FA1D  字母开头改为  OF
	COMMIT;
	ROLLBACK;
	
--   经销商账号过期修改
/*   CSMC_SCN   k/d  代表是url尾部字母
https://hmc.hyundaibluelink.com.cn/dlw/com/loginK.do     起亚
https://hmc.hyundaibluelink.com.cn/dlw/com/loginD.do     起亚 东风悦达起亚是 D  悦达起亚 是 K 
*/
	select * from bt_user@dlw_link where USER_ID= 'HD426000'   -- and USER_DLFG='U' and USER_CO_CD='K'   --// H 现代   K 起亚
	update bt_user@dlw_link  set USER_PW= 'd4eb1d726afc8e09e47f9614e92b51570bc92be69f1a5cf9c91c768277c7ad62', 
	CNNC_DTM='2021/03/25 00:00:00',LAST_PW_CHNG_DT='20210325'
	where USER_ID= 'HD426000' and USER_DLFG='U' and USER_CO_CD= 'K' --AND CSMC_SCN= 'D';     
	
	update bt_user@dlw_link  set CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     --  不修改密码
	
	update bt_user@dlw_link  set fail_cnt='0' where user_id='HD426000'        -- 解锁密码次数
	
	select  CSMC_SCN from bt_user@dlw_link where user_id='HN041000';
	
	COMMIT;
	ROLLBACK;
	
	-- bt_csmr_mst  客户数据   空白页(bt_car_cntt 和 tb_svc_open_mst数据不一致)
	-- bt_svc_opn_mst  开通表
	-- tb_car_mst 车辆表
	-- tb_car_cntt 合同表
	-- tb_car_tmnl_pair_if 匹配表
	-- tb_car_dgn 219表
	-- tb_svc_invc Invoice表
	-- bt_pcs_profile_info,bt_ccs_certification_data,bt_ccs_drivinglicense  实名认证的三个表  
	-- bt_tmnl_prdn,bt_tmnl_svc 终端表
	-- bt_meid_altr_bkgd  更换终端表
	-- bt_eml_snd_bkgd 定期检查报告表
	-- bt_car_prvs,bt_car_svc_st 服务开通明细两个表
--vin错误   工单号 S-B-20201211-18    新车加入查询提示：无法查询车辆信息 ( 两个合同数据导致 S-D-20201231-52 )   合同
	select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBECNAFDXLZ000356';   -- 查出两个字段  执行下边sql  看是否相同
			--     D2018111111111D         A11607570624547
	select DLR_CD,car_csmr_no from bt_svc_opn_mst where VIN = 'LBECNAFDXLZ000356';   --   D20121222000223    C58997893671285
	select DLR_CD,csmr_no,CSMR_SALE_DT from bt_car_mst where VIN = 'LBECNAFDXLZ000356';
			--  执行修改不同的两个字段
	update    bt_car_mst set DLR_CD='D20121222000204' where VIN = 'LBECNAFDXLZ000356';
	update    bt_car_mst set csmr_no='C20201024000029' where VIN = 'KMHR381C9MU235027';
	
	update    bt_svc_opn_mst set DLR_CD= 'D20121222000083' where VIN = 'LBECNAFD4LZ000255';   -- 原始  D20121222000017
	update    bt_svc_opn_mst set car_csmr_no= 'A11605086986987' where VIN = 'LBECNAFD4LZ000255';  -- 原始 C58997893610265
	
	select  DLR_CD from  bt_svc_ent_rq  where VIN = 'LBECNAFD4LZ001471';
	update    bt_svc_ent_rq set DLR_CD='D20170511000001' where VIN = 'LBECNAFD4LZ001471';
	COMMIT;
	ROLLBACK;
    select * from  bt_svc_opn_mst where vin='LJD6AA2D1M0019786'   
      select CSMR_SALE_DT from  bt_car_mst where vin='LJD2AA195M0263940'
    /**  bt_car_mst  车辆数据   CSMR_SALE_DT 一年内算新车过一年的都是二手车   **/
    update bt_car_mst set CSMR_SALE_DT='20200205' where vin='LBESUBFD8KW000098'  -- CSMR_SALE_DT 不等为空  也报vin错误
    
-- 实名认证确认以及修改
-- 通过vin查询客户信息(客户信息页面空白 S-B-20201221-74/S-B-20201221-75  )
	select * FROM bt_ccs_certification_data@ims_link	WHERE meid = '89860920740009902932';
	SELECT * FROM bt_ccs_certification_data@ims_link	WHERE vin = 'LBECNAFDXLZ000356'     -- 认证表
	update bt_ccs_certification_data@ims_link set CERTIFICATION_STATUS='01',AUDITCODE='' WHERE VIN = 'LBECNAFDXLZ000356';    --   重新提交认证
	update  bt_ccs_certification_data@ims_link set meid= '89860920740019752129' WHERE VIN= 'LBECNADDXMZ049576';   -- 和车机iccid不一致
	update  bt_ccs_certification_data@ims_link set SERVNUMBER= '17825361650' WHERE VIN= 'LJD6AA2D2L0003613';   -- 更改手机号  15920281616

/** 多次重新提交 查询时仍是为提交状态的  先查询 然后 pw 是非空的(随便编个密码就行)，然后是把原来的数据删除重新提交
	TMNL_SVC_TYPE 非空的，实名认证表中meid和匹配表中meid不同也会导致车辆被注册过
*/
	select * from BT_TMNL_prdn where meid ='89860920740010025400';
	select * from BT_TMNL_SVC where meid ='89860920770038607053';
	select * from bt_ccs_certification_data@ims_link where vin = 'LBEDNAKE8LY012014'; 
	update BT_TMNL_prdn set pw='LB769' where meid ='89860920740013424519';
	update BT_TMNL_SVC set TMNL_SVC_TYPE='S' where meid ='89860920770038607053'   -- 为空也会导致vin错误
	select TMNL_SVC_TYPE from BT_TMNL_SVC where meid ='89860919740038159960' 
	update bt_ccs_certification_data@ims_link set CSMR_NM='马金瑞' WHERE vin = 'LBEDUAHD3LZ000736';  -- 含有空格导致多次提交失败
	update bt_ccs_certification_data@ims_link set CSMR_NM='耿滇' where meid ='89860920740013537542';
	--   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H      现代的
    --   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K       起亚的
    
--  匹配表
	update BT_CAR_TMNL_PAIR_IF@ims_link set meid= '89860920770038612210' where vin = 'LBENUBKC4LS340447'  -- AND  RGST_ID='QRopen'   -- 修改匹配表的数据
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where vin = 'LBENUBKC4LS340447' ;
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where meid= '89860920770008800084';
	delete BT_CAR_TMNL_PAIR_IF@ims_link WHERE meid= '89860919740008168124';
	ROLLBACK;
	COMMIT;
	select mdn,imsi,auth_key,crc_vrf_cd from bt_tmnl_svc where meid= '89860114511100646009'   --  查询dn  MDN
	
--  通过经销商系统改VIN     问题：车机与系统vin不一致
	select  DLR_CD ,co_cd from bt_car_mst@ims_link where vin='LBES6AFD1KW046473';
	---   c123456
	-- c3da3ba264b78534883802320637da3dfaf1454eea9502ec6ba1539fab5a4bcb
	select * from bt_user@dlw_link where USER_DLR_CD='D20121222001075' and USER_DLFG='U' and USER_CO_CD='H'
	
	select * from bt_user@dlw_link where USER_ID='D0026195' and USER_DLFG='U' and USER_CO_CD='H'
	
	update bt_user@dlw_link set USER_PW= '04b10b1ea8a3db83aa866819302939f8784264a53c6415111579c03c32e46452',
	CNNC_DTM='2021/03/15 00:00:00',LAST_PW_CHNG_DT='20210315'       
	where USER_ID='D0074788' and USER_DLFG='U' and USER_CO_CD='H';
	ROLLBACK;
	COMMIT;
	
	/* 问题：车机与系统 iccid 不一致，tms系统更换时提示 已经被注册过  V-B-20201215-47 基本DATA -->  匹配信息问题( iccid 都属于  匹配信息问题)
	     问题：实名认证时候输入 vin 提示服务器错误
	*/
	select *from bt_car_mst where meid= '89860920770042957205';
	update  bt_car_mst set meid='' where vin='LBECNAFD6MZ052309';
	SELECT * FROM bt_car_mst where vin='LBECNADDXMZ049576';
	
	select *from BT_CAR_TMNL_PAIR_IF where meid= '89860920770042957205';
	update BT_CAR_TMNL_PAIR_IF set meid='' WHERE vin='LBECNAFD9MZ070027';
	delete BT_CAR_TMNL_PAIR_IF WHERE vin='LBES6AFD6KW084684';
	select *from BT_CAR_TMNL_PAIR_IF where vin='LBEDNAKE1LY016809';
	
	select *from bt_car_mst where meid= '89860920770038607053'
	--   不存在的iccid   
	select TMNL_SVC_TYPE from BT_TMNL_SVC where meid='89860920770038608853';
	update BT_TMNL_SVC set TMNL_SVC_TYPE='S' where meid ='89860920770038608853'
	
/*  查询qq认证时间，单不代表所有的车型     链接CCS的库  */
	select * from BT_QQ_VIN_CHECK_INFO where VIN = 'LBETLBFC1KY449318 ';
	
/*   查询日志系统对应的参数表   */
	SELECT * FROM bt_svc_id_mapp@iss_link 

/*  解决客户提交页面空白    暂时还没有太懂  2020-12-17	*/
	select * from  BT_CAR_CNTT where vin ='LBEDNAFD9LY000228'
	
	select csmr_no from bt_car_mst where vin= 'LJD2AA140L0244697'
	DECLARE         
	     jVIN VARCHAR2(17) := 'LJD2AA140L0232078';  
	    jMEID VARCHAR2(20) := '';
	    jCSMR_NO VARCHAR2(16):= 'A11609462862407'; -- 需改动
	    jCNTT_NO VARCHAR2(12):= '';
	    jMDN VARCHAR2(11) := '';
	    mVIN VARCHAR2(17) := 'LJD2AA140L0232078';  
	    mMEID VARCHAR2(20) := '';
	BEGIN
	--------------- 插入 BT_CSMR_MST  ------
	--DELETE BT_CSMR_MST WHERE CSMR_NO = 'C58997893658112'
	 --UPDATE BT_CSMR_MST SET EML='solyonglee@gmobis.com' WHERE CSMR_NO='C2017093357739'
	 --SELECT * FROM BT_CSMR_M	
	ST WHERE CSMR_NO ='A11609462862407' FOR UPDATE
	/**/
	INSERT INTO BT_CSMR_MST@ims_link (CSMR_NO,CSMR_NM,CSMR_SCN_CD,CSMR_DCRM_TYPE_CD,CSMR_DCRM_NO,HP1,HP2,EML,ZIP,WPA_CD,MPOL_CD,
	                                              ADDR1,ADDR2,ADDR3,BRDY,HAK_CD,MARI_EON,SEX,RGST_DTM,RGST_ID,MDFY_DTM,MDFY_ID,
	                                              CSMC_SCN,DLR_CD,CSMR_RGST_OPS,CO_CD,CORP_CD,DMS_DLR_CD,DMS_CSMR_NO)
	SELECT  jCSMR_NO,'test','1','1','1511111111111111111','111','00000000','test@test.com','402560
	','28','402560','北京','北京','北京','19840810','8','N','M',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM',
	             CSMC_SCN,DLR_CD,'S',CO_CD,CORP_CD,DMS_DLR_CD,'' FROM BT_CAR_MST@ims_link WHERE VIN=mVIN;      
             end;   
             
             update bt_car_mst set CSMR_NO='A11609462862407' where vin='LJD2AA140L0232078'
	
	/*
	S-B-20201228-35  经销商来电要求解除服务，核实信息，新车加入提示VIN错误，经销商服务已经开通，表示是试驾车临时开通服务
	*/
	
	--select * from BT_TEST_VIN WHERE VIN = 'LBEDUAHD5LZ000222'
	--update  BT_TEST_VIN   set DLRSALE_YN=1 where vin='LBECNAFD8LZ000288'
	DELETE FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LJD5AA1D9L0010734'  ;
	DELETE FROM BT_SVC_INVC@iss_link		WHERE vin = 'LJD5AA1D9L0010734';
	DELETE FROM bt_svc_ent_rq@iss_link		WHERE VIN = 'LJD5AA1D9L0010734'  ;
	
	DELETE FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LJD5AA1D9L0010734' ;
	DELETE FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LJD5AA1D9L0010734' ;
	DELETE FROM BT_PCS_PROFILE_INFO@iss_link	
	
	
	/**    修改客户车牌号：这是第二步骤，第一步骤是在postman中操作的  */
	SELECT * FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LBECNADD4LZ026938' ;
	SELECT * FROM  bt_ccs_drivinglicense@ims_link WHERE PLATE_NO = '辽A680F3' ;
	update bt_ccs_drivinglicense@ims_link	 set PLATE_NO= '桂NZE260' WHERE vin= 'LBECNADD4LZ026938';
	ROLLBACK;
	COMMIT;
	
	/**   客户来电表示APP注册，输入车架号查询提示服务器错误  因为合同表数据有多条  */
	select *from bt_car_mst where vin='LBECNADD7MZ054203'
	select *from bt_car_mst where MEID='89860920740019718047'  -- 两条数据
	update bt_car_mst	 set MEID= '' WHERE vin= 'LBECNAFD5MZ054052';
  	select *from BT_CAR_CNTT@IMS_LINK where vin='LBECNAFD8MZ063876'
	delete from  BT_CAR_CNTT@IMS_LINK where  vin='LBEDNAFD4LY011024' and CSMR_NO!='A11609220632221'
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where MEID = '89860920740009902932' ;-- 匹配两条数据
	delete from  BT_CAR_TMNL_PAIR_IF@ims_link where  MEID = '89860920770040857126' ;
	update BT_CAR_TMNL_PAIR_IF@ims_link 	 set MEID= '' WHERE vin= 'LBECNAFD5MZ054052';
	/*  终端更换的记录   第二步骤是执行  CUUtil.java  */
	select * from bt_meid_altr_bkgd where vin = 'LBENUBKC4LS340447'
	
	/*   在dlw中通过输入vin 查出有两个结果  */
	---更改CONT_SN ;
	select *from bt_car_mst where vin= 'LJD6AA2D1M0019304'
	select *from bt_svc_opn_mst where vin= 'LJD6AA2D1M0019304'
	select *from bt_tmnl_svc where meid= '89860920740013539449';
	select *from bt_tmnl_svc where cont_sn= '91615537056899'
	--将cont_sn更改为一个不存在的cont_sn
	update BT_SVC_INVC@iss_link	set CONT_SN= '91615537056899'  where vin= 'LJD6AA2D1M0019304';
	update bt_svc_ent_rq set CONT_SN= '91615537056899'  where vin= 'LJD6AA2D1M0019304';
	
	update bt_svc_opn_mst set CONT_SN= '91615537056899'  where vin= 'LJD6AA2D1M0019304';
	update bt_car_svc_st set CONT_SN= '91615537056899' where vin= 'LJD6AA2D1M0019304';
	update bt_tmnl_svc set CONT_SN= '91615537056899' where meid= '89860920740013539449';	
	
	/*  删除增值服务缴费记录，从新开通    申请数据 */
	select * FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LBETLBFD2FY000843' 
	select * from  bt_svc_ent_rq@iss_link		WHERE VIN = 'LBETLBFD2FY000843';
	DELETE FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LBETLBFD2FY000843'  and cont_sn='91615790532950';
	DELETE FROM BT_SVC_INVC@iss_link		WHERE vin = 'LBETLBFD2FY000843' and cont_sn='91615790532950';
	DELETE FROM bt_svc_ent_rq@iss_link		WHERE VIN = 'LBETLBFD2FY000843' and cont_sn='91615790532950'  ;
	/** 删除增值服务重新申请 */
 	select * FROM BT_SVC_INVC@iss_link		WHERE vin = 'LJDXAA12XL0100742';  -- 记录   ASKF_AFFR_SCN=9 成功
 	delete from BT_SVC_INVC@iss_link  where vin='LBECNADDXMZ049402' and ASKF_SN=3
 	update BT_SVC_INVC@iss_link set ASKF_SN=3 where vin= 'LJD3AA2D5K0015305' and ASKF_AFFR_SCN ='09'; -- 一般不使用
	select *from BT_RCP_INFO where vin='LJDXAA12XL0100742'
	delete from BT_RCP_INFO where vin='LJD3AA2D5K0015305'
	--开通增值服务
	https://hmc.hyundaibluelink.com.cn/dlw/qropen/psvcopen/one.do?iccid=89860918710003568868&cocd=K
	COMMIT;
	/*  邮件   */
	--bt_csmr_mst  客户数据
	select  * FROM BT_CSMR_MST where CSMR_NO ='A11613703874940';
	select CSMR_NO from bt_car_mst where vin='LBECNAFD6LZ044810';     -- 车辆主表
	SELECT * FROM BT_CSMR_MST where CSMR_NO ='A11607677089575';
	SELECT * FROM  BT_EML_SND_BKGD@ISS_LINK where  vin='LBECNAFD6LZ044810';  -- SND_YN  Y发 N否
	
	/* 输入vin 整个页面时空白  */
	select * from bt_car_mst where vin='LBECNAFD4LZ001471';     -- 车辆主表
	select * from bt_car_mst where csmr_no='C20201206000188';   
	select * from bt_csmr_mst  where csmr_no='C20201206000188'; 
	update bt_csmr_mst set csmc_scn='D' where csmr_no='C20180106000053';   -- 原来是K    东风悦达起亚是 D  悦达起亚 是 K 
	-- 第一查询合同数据
	select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBEDNAFD2LY000443';  --CSMR_NO=''=8 合同编号
	--  因为合同数据中的与下边三个表中数据不一致
	select * from bt_svc_opn_mst@iss_link where vin ='LBEDNAFD2LY000443';  -- 开通服务后使用
	select * from bt_svc_invc@iss_link where vin ='LBEDNAFD2LY000443'; -- 服务区间表
	select * from bt_svc_ent_rq@iss_link where vin ='LBEDNAFD2LY000443';
	update bt_svc_opn_mst@iss_link set CAR_CSMR_NO='C20201201001320' where VIN='LBEDNAFD2LY000443';  
	update bt_svc_invc@iss_link set CSMR_NO='C20201201001320' where VIN='LBEDNAFD2LY000443';  
	update bt_svc_ent_rq@iss_link set CAR_CSMR_NO='C20201201001320' where VIN='LBEDNAFD2LY000443';  
	/*  实名认证时候  输入vin  提示车辆被注册   问题是：匹配表中的ICCID不一致导致*/
	COMMIT;
	/**  手机绑定车辆和删除车辆  先执行以下sql查询信息后执行 CCSPUtil.java */
	select *  FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBEDNAKE7LY001666'; --使用：MASTER_ID字段值
	select  t.VEHICLE_NM_CN ,t.HVAC_TEMP_TYPE,FUEL_TYPE from bt_car_mst b,tb_vehl_cd t where b.SALE_VEHL_CD=t.sale_vehicle_cd and  vin= 'LBEDNAKE7LY001666';
	SELECT * FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LBEDNAKE7LY001666' ;
	
	/** 更改手机号  */
	select *  FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LJD6AA2D2L0003613'
	update bt_ccs_certification_data@ims_link set SERVNUMBER='17825361650' WHERE VIN = 'LJD6AA2D2L0003613'
	
	select CSMR_NO from bt_car_mst where vin='LJD6AA2D2L0003613'
	SELECT * FROM BT_CSMR_MST WHERE CSMR_NO ='C58997893673635'
	update BT_CSMR_MST set HP1='178',hp2='25361650' WHERE CSMR_NO ='C58997893673635'
	
	select * FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LJD6AA2D2L0003613';
	update bt_svc_opn_mst@iss_link set UGY_TEL_NO1='178', UGY_TEL_NO2='25361650' WHERE VIN = 'LJD6AA2D2L0003613';
	
	select * FROM BT_PCS_PROFILE_INFO@iss_link		WHERE VIN = 'LJD6AA2D2L0003613';
	update BT_PCS_PROFILE_INFO@iss_link	  set PROFILE_PNUM='17825361650' WHERE VIN = 'LJD6AA2D2L0003613'; 
	
	/**  tmsdlwwas@ 10.124.253.153:1521:CCS IMS_PROD TIBERO_6X   二手车输入vin报错    用户输入Vin 空白页 */
	DECLARE         -- 第一步
     jVIN VARCHAR2(17) := 'LBEDMBKD0JZ225868';  
    jMEID VARCHAR2(20) := '';
    jCSMR_NO VARCHAR2(16):= 'B58997893675868'; -- 需改动
    jCNTT_NO VARCHAR2(12):= 'A2475395868'; -- 需改动
    jMDN VARCHAR2(11) := '';
    mVIN VARCHAR2(17) := 'LBEDMBKD0JZ225868';  
    mMEID VARCHAR2(20) := '';
	BEGIN
	
	INSERT INTO BT_CAR_CNTT@ims_link (CNTT_NO,CNTT_ST_CD,CNTT_DT,CNTT_CRGR,WHOT_DT,INSU_VSN_EON,NPLT_VSN_EON,RGST_DTM,RGST_ID,MDFY_DTM,MDFY_ID,IECL_CD,XRCL_CD,CO_CD,VIN,CORP_CD,DLR_CD,CSMR_NO,CSMC_SCN,DMS_DLR_CD)
	SELECT jCNTT_NO,'8','20151009','A07V7018','20151009','N','N',SYSDATE,RGST_ID,SYSDATE,MDFY_ID,
	             IECL_CD,XRCL_CD,CO_CD,jVIN,CORP_CD,dlr_cd, jCSMR_NO csmr_no,CSMC_SCN,dms_dlr_cd FROM BT_CAR_MST@ims_link
	              WHERE VIN=mVIN;  
	
	INSERT INTO BT_CSMR_MST@ims_link (CSMR_NO,CSMR_NM,CSMR_SCN_CD,CSMR_DCRM_TYPE_CD,CSMR_DCRM_NO,HP1,HP2,EML,ZIP,WPA_CD,MPOL_CD,
	                                              ADDR1,ADDR2,ADDR3,BRDY,HAK_CD,MARI_EON,SEX,RGST_DTM,RGST_ID,MDFY_DTM,MDFY_ID,
	                                              CSMC_SCN,DLR_CD,CSMR_RGST_OPS,CO_CD,CORP_CD,DMS_DLR_CD,DMS_CSMR_NO)
	SELECT  jCSMR_NO,'test','1','1','1511111111111111111','111','00000000','test@test.com','402560','28','402560','北京','北京','北京','19840810','8','N','M',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM',
	             CSMC_SCN,DLR_CD,'S',CO_CD,CORP_CD,DMS_DLR_CD,'' FROM BT_CAR_MST@ims_link WHERE VIN=mVIN;
	             
	             end;
	             
	update  bt_car_mst set CSMR_NO='B58997893675868' where vin='LBEDMBKD0JZ225868'  -- 第二步
	
	/**  APP中增加登录车辆   没有蓝牙钥匙加入*/
	select SALE_VEHL_CD from bt_car_mst where vin ='LBENUBDC4MS343962'  -- 第一查车型
	select *from bt_car_mst where SALE_VEHL_CD='NUF'  -- 第二查车型
	select * from TB_CAR_DGN@IMS_LINK where vin ='LBENUBDC4MS343962'
	update TB_CAR_DGN@IMS_LINK  set CNVR_VAL=1 where vin ='LBENUBDC4MS343962' and dgn_cd='00067'
	commit;

	/** 二手车 在 dlw中 缺少 服务中心值*/
	select *from bt_tmnl_svc where meid='D91010F65189A8'
	select *from bt_tmnl_prdn where meid='D91010F65189A8'
	update bt_tmnl_svc set  MOFM_CD='CTJV' where  meid='D91010F65189A8';
	update bt_tmnl_prdn set  MOFM_CD='CTJV' where  meid='D91010F6557A55';
	
	/**
数据库中某个表扩容字段的长度
当表里的字段长度不够的时候，这时候需要扩容字段：
*/
alter table 表名 modify 字段名  字段类型  字段类型长度 ; 

例子：

alter table user modify name  varchar2 (32); 	
	
	/**   邮箱登录查看APP日志  OMS库 */
	
	select * from BT_TRANSACTION a,BT_SCEN_TRAN b
where a.tid = b.tid 
and a.start_time  BETWEEN TO_DATE('2021-02-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2021-02-03 23:57:00', 'YYYY-MM-DD HH24:MI:SS')
and b.header like '%LBECNAFD2LZ033657%'
and a.SCENARIO = 'G2RDO-D';

/**   查询流量添加失败的 **/
select a.*from bt_cu_activefreecommodity a,bt_car_mst b
where 
a.iccid=b.meid and b.SALE_VEHL_CD not in('NPF','KA4')
 and a.rgst_dtm<to_date('2021-03-02 00:00:00','yyyy-mm-dd hh24:mi:ss')
and a.rgst_dtm>=to_date('2021-03-01 00:00:00','yyyy-mm-dd hh24:mi:ss')
and (a.result=0 or a.result is null)

/**    是OPIO的车，系统显示是哈曼  **/   终端数据
select * from  BT_CAR_PRDN_INFO where vin='LJDUAA2J0L0012467'
select * from  BT_TMNL_PRDN where meid='89860919740008272298'
select * from  BT_TMNL_svc where meid='89860919740008272298'
update BT_CAR_PRDN_INFO set TMNL_TYPE ='I' where vin='LJDUAA2J0L0012467'    --A是哈曼的 I 不是
update BT_TMNL_PRDN set MOFM_CD='CUJV' where meid='89860919740008272298'
update BT_TMNL_svc set MOFM_CD='CUJV' where meid='89860919740008272298'

/** dlw中是停机保号  查询vin中是注册完毕  是因为  cont_sn为空了**/
select * from bt_svc_opn_mst where VIN = 'LJD6AA244L0014581';--D20121222001153
SELECT * FROM BT_TMNL_SVC WHERE meid ='89860920740013534119'
update BT_TMNL_SVC set cont_sn='91612095558368' WHERE meid ='89860920740013534119'
SELECT * FROM BT_TMNL_SVC WHERE cont_sn ='91612095558362'
-- 如果修改完后 dlw中查询有两条记录执行下边sql
---重复的话更改CONT_SN
update BT_SVC_INVC@iss_link	set CONT_SN='91612095558362'  where vin='LJD6AA244L0014581';
update bt_svc_ent_rq set CONT_SN='91612095558362'  where vin='LJD6AA244L0014581';
update bt_svc_opn_mst set CONT_SN='91612095558362'  where vin='LJD6AA244L0014581';
update bt_car_svc_st set CONT_SN='91612095558362' where vin='LJD6AA244L0014581';
update bt_tmnl_svc set CONT_SN='91612095558362' where meid='89860920740013534119';

/** 解除服务  用IE调试兼容模式 */
http://10.124.253.150:17001/dlw/ct.do?ctUserId=JVCCAGENT&ctUserPw=eaa6b185b4265cd07e3f1c92cb302371b251b4e946f515c4f7a0466b84c353fa&csmrNo=A11610197571481&dlrCd=D20121222001153&vin=LBE3SBFC0JW005795

select *from bt_svc_invc@iss_link  where vin='LJDUAA2J6J0010901'
update bt_svc_invc@iss_link set TRTM_CMPL_SCN='Y'  where vin='LBE3SBFC0JW005795' and cont_sn='';  -- 未解决再执行下边sql
update  bt_svc_invc@iss_link b set ASKF_SN=0 where vin='LBE3SBFC0JW005795' and cont_sn='91613007191844' and ASKF_AFFR_SCN='09'

/*** 用户开通服务提示车辆已注册其他用户，错误代码9910000666 */
身份证最后那个x要在页面上改成大写的在提交才行 数据库里改了不行

/** 邮件定期发送 车速到达511  */
select * from BT_DRVG_INFO_G2 where  vin = 'LJD6AA2D8L0010971'  --  TRSC_ID  去oms查询
--TMU2是车机上送的511
/**  APP 服务都无法使用 OMS报500*/
--- Cause: java.sql.SQLException: JDBC-11048:"TMSISSADM"."BT_SVC_OPN_MST"."SMT_ERR_NO" The value is too large for the column. (Actual value: 2, Maximum value: 1)
	select * FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'KNAKU8111E5454879'; -- SMT_ERR_NO 字段修改为 0
	update  bt_svc_opn_mst@iss_link set SMT_ERR_NO=0 where vin='LBETLBFC8JY426486';
	COMMIT;
	
	/** ble */
	update TB_CAR_DGN@IMS_LINK set CNVR_VAL=2 where vin ='LJD6AIRDETO000001' and dgn_cd in('00002');-- 1：ble和ccsp都可用，2：只能ble
	
	
	----查询车辆信息报错 收费开通

 SELECT A.TMNL_TYPE,C.TMNL_TYPE  FROM  BT_CAR_PRDN_INFO@IMS_LINK A, BT_VEHL_SVC@ims_link C
	   WHERE A.VIN = 'KMHGC41C1EU266337' AND   A.SALE_VEHICLE_CD = C.vehicle_cd AND   A.CSMC_SCN = C.CSMC_SCN
	 --以BT_VEHL_SVC	 TMNL_TYPE 为准 
update BT_CAR_PRDN_INFO@IMS_LINK A set TMNL_TYPE='P' where VIN = 'KMHGC41C1EU266337' 
	
	/*    CT   V-K-20210312-15  MDN:15340063576  ESN: 80C7F00B  -- 格式  发给孙盛镐*/
	select ESN,MDN from BT_TMNL_SVC  where meid ='D91010F64F5E24';

	--服务开通需要删除以下数据  实名认证的邮箱和提供的邮箱不一致  测试车也可执行
	select * FROM bt_svc_opn_mst@iss_link WHERE VIN = 'LBECNAFD6LZ044810';
DELETE FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LBECNAFD6LZ044810';
DELETE FROM BT_SVC_INVC@iss_link		WHERE vin = 'LBECNAFD6LZ044810';
DELETE FROM bt_svc_ent_rq@iss_link		WHERE VIN = 'LBECNAFD6LZ044810';

DELETE FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBEDUAHDXLZ001916';
DELETE FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LBEDUAHDXLZ001916';
DELETE FROM BT_PCS_PROFILE_INFO@iss_link		WHERE VIN = 'LBEDUAHDXLZ001916';
--  测试车再dlw中取消失败了就执行下边的
select * from BT_TEST_VIN  where VIN = 'LJD6AA246L0005378'
update BT_TEST_VIN set DLRSALE_YN=1 where VIN = 'LJD6AA246L0005378'

/** 上传行驶证后点击下一步提示SQL错误  服务器错误  因为一个ICCID对应了两个VIN*/
	select *from bt_car_mst where vin='LBECNAFD9MZ070271';     -- 车辆主表
	select *from bt_car_mst where meid='89860920770042957205';  
	update bt_car_mst set meid='' where vin='LBECNAFD9MZ070027'; 
	commit;

/** 车辆开通日期 **/

select OPN_DTM from  bt_svc_opn_mst where vin='LBECNAFDXLZ030392'   
	
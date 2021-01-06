
--   开通失败时使用的sql
	select meid from bt_car_mst where vin='LBES6AFD2LW143053';
	select *from bt_car_mst where vin='LBECNAFD6LZ004968';     -- 车辆主表
	select *from bt_car_mst where meid='89860920740009978486';  
	
	select FIN_SMS_PW_YN from bt_tmnl_svc where meid='89860920740015635328';     --   查出的值  1为加密    空为不加密
	select * from bt_tmnl_svc where meid='89860115511101274644';
	update bt_tmnl_svc set FIN_SMS_PW_YN=''   where meid='89860920740015635328';    --- 修改成不加密
	update bt_tmnl_svc set FIN_SMS_PW_YN='1' where meid='89860920740015635328';    --- 修改成加密
	update bt_car_mst set meid='89860920740009978486' WHERE VIN='LJD6AA2D3L0011641';
	
	select * from bt_tmnl_svc where meid='A1000023C0A7E0'; 
	update bt_tmnl_svc set OPNG_PTT_ST_CD='EF' where meid='89860115511101195468'    -- 终端状态改为注册完毕   ER代表？SF代表？ EF代表开通   原始：SR
	update bt_tmnl_svc set OPNG_PTT_ST_CD='OF' where meid='A1000023C0A7E0'   -- 原始  OP
	--   A1000023C0FA1D  字母开头改为  OF
	COMMIT;
	ROLLBACK;
	
--   经销商账号过期修改
/*   CSMC_SCN   k/d  代表是url尾部字母
https://hmc.hyundaibluelink.com.cn/dlw/com/loginK.do     起亚
https://hmc.hyundaibluelink.com.cn/dlw/com/loginD.do     起亚
*/
	select * from bt_user@dlw_link where USER_ID= 'D0016602'    and USER_DLFG='U' and USER_CO_CD='K'   --// H 现代   K 起亚
	update bt_user@dlw_link  set USER_PW= 'a3dbff4c565b0ee0ea7cb6858df1daa88282c6cc182fb299c8f0024916a5a2ab', CNNC_DTM='2020/12/28 00:00:00',LAST_PW_CHNG_DT='20201228'
	where USER_ID= 'D0016602' and USER_DLFG='U' and USER_CO_CD='H';     
	
	update bt_user@dlw_link  set CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     --  不修改密码
	
	update bt_user@dlw_link  set fail_cnt='0' where user_id='HD150000'        -- 解锁密码次数
	
	select  CSMC_SCN from bt_user@dlw_link where user_id='HN041000';
	
	COMMIT;
	ROLLBACK;
	
--vin错误   工单号 S-B-20201211-18    新车加入查询提示：无法查询车辆信息 ( 两个合同数据导致 S-D-20201231-52 )   合同
	select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBEADDFC7KY000148';   -- 查出两个字段  执行下边sql  看是否相同
			--     D2018111111111D         A11609381093287
	select DLR_CD,car_csmr_no from bt_svc_opn_mst where VIN = 'LJDUAA246G0023232';   --   D20110212000003    C2017093357710
	select DLR_CD,csmr_no from bt_car_mst where VIN = 'LJDUAA246G0023232';
			--  执行修改不同的两个字段
	update    bt_car_mst set DLR_CD='D2018111111111D' where VIN = 'LJDUAA246G0023232';
	update    bt_car_mst set csmr_no='C20180106000053' where VIN = 'LJDUAA246G0023232';
	
	update    bt_svc_opn_mst set DLR_CD= 'D20110212000003' where VIN = 'LJD1AA226H0000066';   -- 原始  D20121222000017
	update    bt_svc_opn_mst set car_csmr_no= 'C2017093357710' where VIN = 'LJD1AA226H0000066';  -- 原始 C58997893610265
	COMMIT;
	ROLLBACK;
    select *from 	 bt_svc_opn_mst where vin='KMHGN41C9GU132057'
    
    
-- 实名认证确认以及修改
-- 通过vin查询客户信息(客户信息页面空白 S-B-20201221-74/S-B-20201221-75  )
	select * FROM bt_ccs_certification_data@ims_link	WHERE meid = '89860920740010011814';
	SELECT * FROM bt_ccs_certification_data@ims_link	WHERE vin = 'LBECNAFD6LZ004968'     -- 认证表
	update bt_ccs_certification_data@ims_link set CERTIFICATION_STATUS='01',AUDITCODE='' WHERE VIN = 'LBECNAFD6LZ004968';    --   重新提交认证
	update  bt_ccs_certification_data@ims_link set meid= '89860920770008766152' WHERE VIN= 'LBECNAFD3LZ004121';   -- 和车机iccid不一致
	
	--   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H      现代的
    --   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K       起亚的
    
--  匹配表
	update BT_CAR_TMNL_PAIR_IF@ims_link set meid= '89860920770008758670' where vin = 'LBECNAFD9LZ007007'  -- 修改匹配表的数据
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where vin = 'LBECNAFD9LZ007007' ;
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where meid= '89860920740010011814';
	delete BT_CAR_TMNL_PAIR_IF@ims_link WHERE meid= '89860919740034306342';
	
	select mdn,imsi,auth_key,crc_vrf_cd from bt_tmnl_svc where meid= '89860920770008808244'   --  查询dn  MDN
	
--  通过经销商系统改VIN     问题：车机与系统vin不一致
	select  DLR_CD ,co_cd from bt_car_mst@ims_link where vin='LBECNAFD9LZ007007';
	---   c123456
	-- c3da3ba264b78534883802320637da3dfaf1454eea9502ec6ba1539fab5a4bcb
	select * from bt_user@dlw_link where USER_DLR_CD='D20121229000002' and USER_DLFG='U' and USER_CO_CD='H'
	
	select * from bt_user@dlw_link where USER_ID='D0055516' and USER_DLFG='U' and USER_CO_CD='K'
	
	update bt_user@dlw_link set USER_PW= '04b10b1ea8a3db83aa866819302939f8784264a53c6415111579c03c32e46452',
	CNNC_DTM='2020/12/14 00:00:00',LAST_PW_CHNG_DT='20201214'
	where USER_ID='D0055516' and USER_DLFG='U' and USER_CO_CD='H'
	ROLLBACK;
	COMMIT;
--  问题：车机与系统 iccid 不一致，tms系统更换时提示 已经被注册过  V-B-20201215-47 基本DATA -->  匹配信息问题( iccid 都属于  匹配信息问题)
	select *from bt_car_mst where meid= '89860920740013440259';
	update  bt_car_mst set meid='' where vin='LJD2AA148L0248366';
	SELECT * FROM bt_car_mst where vin='LJD2AA14XL0248448';
	
	select *from BT_CAR_TMNL_PAIR_IF where meid= '89860920740013440259';
	update BT_CAR_TMNL_PAIR_IF set meid='' WHERE vin='LJD2AA148L0248366';
	delete BT_CAR_TMNL_PAIR_IF WHERE vin='LBES6AFD6KW084684';
	select *from BT_CAR_TMNL_PAIR_IF where vin='LJD2AA14XL0248448';
	
	select *from bt_car_mst where meid= '89860920740009932087'
	
/*  查询qq认证时间，单不代表所有的车型     链接CCS的库*/
	select * from BT_QQ_VIN_CHECK_INFO where VIN = 'LJD6AA245L0001547';
	
-- 查询日志系统对应的参数表
	SELECT * FROM bt_svc_id_mapp@iss_link 

--   解决客户提交页面空白    暂时还没有太懂  2020-12-17	
	select * from  BT_CAR_CNTT where vin ='LJD2AA140L0244697'
	
	select csmr_no from bt_car_mst where vin= 'LJD2AA140L0244697'

	DECLARE         
	     jVIN VARCHAR2(17) := 'LJD2AA140L0232078';  
	    jMEID VARCHAR2(20) := '';
	    jCSMR_NO VARCHAR2(16):= 'A11609462862407';
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
	
	--select * from BT_TEST_VIN WHERE VIN = 'LBECNAFD8LZ000288'
	
	--update  BT_TEST_VIN   set DLRSALE_YN=1 where vin='LBECNAFD8LZ000288'
	DELETE FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LJD5AA1D9L0010734'  ;
	DELETE FROM BT_SVC_INVC@iss_link		WHERE vin = 'LJD5AA1D9L0010734';
	DELETE FROM bt_svc_ent_rq@iss_link		WHERE VIN = 'LJD5AA1D9L0010734'  ;
	
	DELETE FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LJD5AA1D9L0010734' ;
	DELETE FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LJD5AA1D9L0010734' ;
	DELETE FROM BT_PCS_PROFILE_INFO@iss_link	
	
	
	/**
		修改客户车牌号：这是第二步骤，第一步骤是在postman中操作的
	*/
	SELECT * FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LBESUBFC2LW036670' ;
	update bt_ccs_drivinglicense@ims_link	 set PLATE_NO= '鲁FE0M29' WHERE vin= 'LBESUBFC2LW036670';
	ROLLBACK;
	COMMIT;
	
	
	/**   客户来电表示APP注册，输入车架号查询提示服务器错误  因为合同表数据有多条
	*/
	select *from bt_car_mst where vin='LBEDNAFD4LY011024'
  	select *from BT_CAR_CNTT@IMS_LINK where vin='LBEDNAFD4LY011024'
	
	delete from  BT_CAR_CNTT@IMS_LINK where  vin='LBEDNAFD4LY011024' and CSMR_NO!='A11609220632221'
	
	/*  终端更换的记录   第二步骤是执行  CUUtil.java
	*/
	select * from bt_meid_altr_bkgd where vin = 'LJD2AA149J0027422'
	
	/*   在dlw中通过输入vin 查出有两个结果
	*/
	---更改CONT_SN ;
	select *from bt_car_mst where vin= 'LJD6AA247L0013215'
	select *from bt_svc_opn_mst where vin= 'LJD6AA247L0013215'
	select *from bt_tmnl_svc where meid= '89860920740013549497';
	select *from bt_tmnl_svc where cont_sn= '91609749684031'
	--将cont_sn更改为一个不存在的cont_sn
	update BT_SVC_INVC@iss_link	set CONT_SN= '91609749684031'  where vin= 'LJD6AA247L0013215';
	update bt_svc_ent_rq set CONT_SN= '91609749684031'  where vin= 'LJD6AA247L0013215';
	
	update bt_svc_opn_mst set CONT_SN= '91609749684031'  where vin= 'LJD6AA247L0013215';
	update bt_car_svc_st set CONT_SN= '91609749684031' where vin= 'LJD6AA247L0013215';
	update bt_tmnl_svc set CONT_SN= '91609749684031' where meid= '89860920740013549497';	
	
	
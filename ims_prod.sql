
--   开通失败时使用的sql
	select meid from bt_car_mst where vin='LJD6AA243L0011350';
	select *from bt_car_mst where vin='LBESUBFC0LW043049';     -- 车辆主表
	
	select FIN_SMS_PW_YN from bt_tmnl_svc where meid='89860920740014734353';     --   查出的值  1为加密    空为不加密
	select * from bt_tmnl_svc where meid='89860115511101274644';
	update bt_tmnl_svc set FIN_SMS_PW_YN='' where meid='89860919740034286643';    --- 修改成不加密
	update bt_car_mst set meid='89860920740013597868' WHERE VIN='LBECNAFD0LZ020907';
	COMMIT;
	select * from bt_tmnl_svc where meid='89860115511100109825'; 
	update bt_tmnl_svc set OPNG_PTT_ST_CD='EF' where meid='89860115511100109825'    -- 终端状态改为注册完毕
--   经销商账号过期修改
	select * from bt_user@dlw_link where USER_ID='D0070736'    and USER_DLFG='U' and USER_CO_CD='K'   --// H 现代   K 起亚
	update bt_user@dlw_link  set USER_PW='8730e61fe88e302e09c6bb3cde5065366d7f6b60bfe8b649b8df05f6d7123477', CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0070736' and USER_DLFG='U' and USER_CO_CD='H'     
	
	update bt_user@dlw_link  set CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     --  不修改密码
	
	update bt_user@dlw_link  set fail_cnt='0' where user_id='D0117536'        -- 解锁密码次数
	
	select  CSMC_SCN from bt_user@dlw_link where user_id='D0117536';
	COMMIT;

--vin错误   工单号 S-B-20201211-18
	select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBEDNAFC0LY004188';   -- 查出两个字段  执行下边sql  看是否相同
			--     D20121222000065         C20201207000043
	select DLR_CD,car_csmr_no from bt_svc_opn_mst where VIN = 'LBEDNAFC0LY004188';
	select DLR_CD,csmr_no from bt_car_mst where VIN = 'LBEDNAFC0LY004188';
			--  执行修改不同的两个字段
	update    bt_car_mst set DLR_CD='D20121222000017' where VIN = 'LBEDNAFC0LY004188';
	update    bt_car_mst set csmr_no='C20201019000173' where VIN = 'LBEDNAFC0LY004188';
	COMMIT;
	
	update    bt_svc_opn_mst set car_csmr_no='C20201019000173' where VIN = 'LBEDNAKE2LY000134';
	COMMIT;

-- 实名认证确认以及修改
	select * FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBECNAFD0LZ020907';
	SELECT * FROM bt_ccs_certification_data@ims_link	WHERE vin = 'LJD3AA2D6L0039968'     -- 认证表
	update bt_ccs_certification_data@ims_link set CERTIFICATION_STATUS='01',AUDITCODE='' WHERE VIN = 'LBECNAFD0LZ020907';    --   重新提交认证
	
	--   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H      现代的
    --   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K       起亚的
--  匹配表
	update BT_CAR_TMNL_PAIR_IF@ims_link set meid='89860920740013569073' where vin = 'LJD6AA243L0011350'  -- 修改匹配表的数据
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where vin = 'LJD6AA243L0011350' ;
	
	select mdn,imsi,auth_key,crc_vrf_cd from bt_tmnl_svc where meid='89860920740013555791'   --  查询dn
	
--  通过经销商系统改VIN     问题：车机与系统vin不一致
	select  DLR_CD ,co_cd from bt_car_mst@ims_link where vin='LJD6AA243L0011350';
	---   c123456789
	-- c3da3ba264b78534883802320637da3dfaf1454eea9502ec6ba1539fab5a4bcb
	select * from bt_user@dlw_link where USER_DLR_CD='D20120724000210' and USER_DLFG='U' and USER_CO_CD='K'
	
	select * from bt_user@dlw_link where USER_ID='D0032593' and USER_DLFG='U' and USER_CO_CD='K'
	
	update bt_user@dlw_link set USER_PW='c3da3ba264b78534883802320637da3dfaf1454eea9502ec6ba1539fab5a4bcb',
	CNNC_DTM='2020/12/14 00:00:00',LAST_PW_CHNG_DT='20201214'
	where USER_ID='D0032593' and USER_DLFG='U' and USER_CO_CD='K'
	
	COMMIT;
--  问题：车机与系统 iccid 不一致，tms系统更换时提示 已经被注册过  V-B-20201215-47 基本DATA -->  匹配信息问题( iccid 都属于  匹配信息问题)
	select *from bt_car_mst where meid='89860919730064540787';
	update  bt_car_mst set meid='' where vin='TESTAA2F9L0000787';
	SELECT * FROM bt_car_mst where vin='LJD3AA2D6L0039968';
	
	select *from BT_CAR_TMNL_PAIR_IF where meid='89860919730064540787';
	update BT_CAR_TMNL_PAIR_IF set meid='' WHERE vin='LBECNAFD7LZ023691';
	select *from BT_CAR_TMNL_PAIR_IF where vin='LJD3AA2D6L0039968';
	
	
	
	
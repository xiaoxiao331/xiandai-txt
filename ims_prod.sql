
--   开通失败时使用的sql
select meid from bt_car_mst where vin='LBETLBFD5GY189229';

select FIN_SMS_PW_YN from bt_tmnl_svc where meid='89860920770008840361';     --   查出的值  1为加密    空为不加密
select * from bt_tmnl_svc where meid='89860920770008840361';
update bt_tmnl_svc set FIN_SMS_PW_YN='' where meid='89860920770008840361';    --- 修改成不加密
	COMMIT;
	select * from bt_tmnl_svc where meid='89860920740013570790'; 
	update bt_tmnl_svc set OPNG_PTT_ST_CD='EF' where meid='89860920740013570790'    -- 终端状态改为注册完毕
--   经销商账号过期修改
	select * from bt_user@dlw_link where USER_ID='D0099456'    and USER_DLFG='U' and USER_CO_CD='K'   --// H 现代   K 起亚
	update bt_user@dlw_link  set USER_PW='9b72e28b0ddb570faab7710279386b8fd910f3648fc30bed2118fdbfb9f5a639', CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     
	
update bt_user@dlw_link  set CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     --  不修改密码
	
	update bt_user@dlw_link  set fail_cnt='0' where user_id='D0117536'        -- 解锁密码次数
	
	select  CSMC_SCN from bt_user@dlw_link where user_id='D0117536';
	COMMIT;

--vin错误   工单号 S-B-20201211-18
select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBEDMBKD6JZ225387';   -- 查出两个字段  执行下边sql  看是否相同
		--     D20121222000702         C20201123000430
select DLR_CD,car_csmr_no from bt_svc_opn_mst where VIN = 'LBEDMBKD6HZ212777';
select DLR_CD,csmr_no from bt_car_mst where VIN = 'LBEDMBKD6HZ212777';
		--  执行修改不同的两个字段
update    bt_car_mst set DLR_CD='D20121222000017' where VIN = 'LBEDMBKD6HZ212777';
update    bt_car_mst set csmr_no='C20201019000173' where VIN = 'LBEDMBKD6HZ212777';
COMMIT;

update    bt_svc_opn_mst set car_csmr_no='C20201019000173' where VIN = 'LBEDNAKE2LY000134';
COMMIT;

-- 实名认证确认以及修改
select * FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBETLBFD5GY189229';
update bt_ccs_certification_data@ims_link set CERTIFICATION_STATUS='01',AUDITCODE='' WHERE VIN = 'LBETLBFD5GY189229';    --   重新提交认证
	
	--   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H      现代的

    --   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K       起亚的
	
	update BT_CAR_TMNL_PAIR_IF@ims_link set meid='89860114511100019330' where vin = 'LBETLBFD5GY189229'  -- 修改匹配表的数据
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where vin = 'LBETLBFD5GY189229' ;
	
	select mdn,imsi,auth_key,crc_vrf_cd from bt_tmnl_svc where meid='89860114511100019330'   --  查询dn
	
	
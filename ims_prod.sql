
--   ��ͨʧ��ʱʹ�õ�sql
select meid from bt_car_mst where vin='LBETLBFD5GY189229';

select FIN_SMS_PW_YN from bt_tmnl_svc where meid='89860920770008840361';     --   �����ֵ  1Ϊ����    ��Ϊ������
select * from bt_tmnl_svc where meid='89860920770008840361';
update bt_tmnl_svc set FIN_SMS_PW_YN='' where meid='89860920770008840361';    --- �޸ĳɲ�����
	COMMIT;
	select * from bt_tmnl_svc where meid='89860920740013570790'; 
	update bt_tmnl_svc set OPNG_PTT_ST_CD='EF' where meid='89860920740013570790'    -- �ն�״̬��Ϊע�����
--   �������˺Ź����޸�
	select * from bt_user@dlw_link where USER_ID='D0099456'    and USER_DLFG='U' and USER_CO_CD='K'   --// H �ִ�   K ����
	update bt_user@dlw_link  set USER_PW='9b72e28b0ddb570faab7710279386b8fd910f3648fc30bed2118fdbfb9f5a639', CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     
	
update bt_user@dlw_link  set CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     --  ���޸�����
	
	update bt_user@dlw_link  set fail_cnt='0' where user_id='D0117536'        -- �����������
	
	select  CSMC_SCN from bt_user@dlw_link where user_id='D0117536';
	COMMIT;

--vin����   ������ S-B-20201211-18
select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBEDMBKD6JZ225387';   -- ��������ֶ�  ִ���±�sql  ���Ƿ���ͬ
		--     D20121222000702         C20201123000430
select DLR_CD,car_csmr_no from bt_svc_opn_mst where VIN = 'LBEDMBKD6HZ212777';
select DLR_CD,csmr_no from bt_car_mst where VIN = 'LBEDMBKD6HZ212777';
		--  ִ���޸Ĳ�ͬ�������ֶ�
update    bt_car_mst set DLR_CD='D20121222000017' where VIN = 'LBEDMBKD6HZ212777';
update    bt_car_mst set csmr_no='C20201019000173' where VIN = 'LBEDMBKD6HZ212777';
COMMIT;

update    bt_svc_opn_mst set car_csmr_no='C20201019000173' where VIN = 'LBEDNAKE2LY000134';
COMMIT;

-- ʵ����֤ȷ���Լ��޸�
select * FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBETLBFD5GY189229';
update bt_ccs_certification_data@ims_link set CERTIFICATION_STATUS='01',AUDITCODE='' WHERE VIN = 'LBETLBFD5GY189229';    --   �����ύ��֤
	
	--   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H      �ִ���

    --   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K       ���ǵ�
	
	update BT_CAR_TMNL_PAIR_IF@ims_link set meid='89860114511100019330' where vin = 'LBETLBFD5GY189229'  -- �޸�ƥ��������
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where vin = 'LBETLBFD5GY189229' ;
	
	select mdn,imsi,auth_key,crc_vrf_cd from bt_tmnl_svc where meid='89860114511100019330'   --  ��ѯdn
	
	
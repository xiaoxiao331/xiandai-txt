
--   ��ͨʧ��ʱʹ�õ�sql
	select meid from bt_car_mst where vin='LBECNAFD7LZ011122';
	select *from bt_car_mst where vin='LBESUBFC7LW032081';     -- ��������
	
	select FIN_SMS_PW_YN from bt_tmnl_svc where meid='89860920770023552033';     --   �����ֵ  1Ϊ����    ��Ϊ������
	select * from bt_tmnl_svc where meid='89860115511101274644';
	update bt_tmnl_svc set FIN_SMS_PW_YN='' where meid='89860919730006666542';    --- �޸ĳɲ�����
	update bt_car_mst set meid='89860920740013597868' WHERE VIN='LBECNAFD0LZ020907';
	
	select * from bt_tmnl_svc where meid='89860115511100109825'; 
	update bt_tmnl_svc set OPNG_PTT_ST_CD='EF' where meid='89860115511100109825'    -- �ն�״̬��Ϊע�����
	COMMIT;
	ROLLBACK;
--   �������˺Ź����޸�
	select * from bt_user@dlw_link where USER_ID='D0124001'    and USER_DLFG='U' and USER_CO_CD='K'   --// H �ִ�   K ����
	update bt_user@dlw_link  set USER_PW='4ce85f0eb506bc91de7836be10f9939d2e42631d332e71533f0ab4a4a6416d2e', CNNC_DTM='2020/12/17 00:00:00',LAST_PW_CHNG_DT='20201217'
	where USER_ID='D0124001' and USER_DLFG='U' and USER_CO_CD='K'     
	
	update bt_user@dlw_link  set CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     --  ���޸�����
	
	update bt_user@dlw_link  set fail_cnt='0' where user_id='D0130808'        -- �����������
	
	select  CSMC_SCN from bt_user@dlw_link where user_id='D0117536';
	COMMIT;
	ROLLBACK;
--vin����   ������ S-B-20201211-18
	select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBEADADE3GX000321';   -- ��������ֶ�  ִ���±�sql  ���Ƿ���ͬ
			--     D20121222000242         A11539828105426
	select DLR_CD,car_csmr_no from bt_svc_opn_mst where VIN = 'LBES6AFD8JW001254';
	select DLR_CD,csmr_no from bt_car_mst where VIN = 'LBES6AFD8JW001254';
			--  ִ���޸Ĳ�ͬ�������ֶ�
	update    bt_car_mst set DLR_CD='D2018111111111D' where VIN = 'LBES6AFD8JW001254';
	update    bt_car_mst set csmr_no='B2020121700938' where VIN = 'LBES6AFD8JW001254';
	
	update    bt_svc_opn_mst set car_csmr_no='C20201019000173' where VIN = 'LBECNAFD0LZ029381';
	COMMIT;
	ROLLBACK;
-- ʵ����֤ȷ���Լ��޸�
	select * FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBETMBKD2LZ018798';
	SELECT * FROM bt_ccs_certification_data@ims_link	WHERE vin = 'LBESUBFC4LW046620'     -- ��֤��
	update bt_ccs_certification_data@ims_link set CERTIFICATION_STATUS='01',AUDITCODE='' WHERE VIN = 'LJD6AA245L0015299';    --   �����ύ��֤
	
	--   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H      �ִ���
    --   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K       ���ǵ�
--  ƥ���
	update BT_CAR_TMNL_PAIR_IF@ims_link set meid='89860920740000654920' where vin = 'LBESUBFC4LW046620'  -- �޸�ƥ��������
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where vin = 'LBES6AFD7KW066890' ;
	
	select mdn,imsi,auth_key,crc_vrf_cd from bt_tmnl_svc where meid='89860920740013555791'   --  ��ѯdn
	
--  ͨ��������ϵͳ��VIN     ���⣺������ϵͳvin��һ��
	select  DLR_CD ,co_cd from bt_car_mst@ims_link where vin='LBESUBFC4LW046620';
	---   c123456789
	-- c3da3ba264b78534883802320637da3dfaf1454eea9502ec6ba1539fab5a4bcb
	select * from bt_user@dlw_link where USER_DLR_CD='D20121222001312' and USER_DLFG='U' and USER_CO_CD='H'
	
	select * from bt_user@dlw_link where USER_ID='D0000380' and USER_DLFG='U' and USER_CO_CD='K'
	
	update bt_user@dlw_link set USER_PW='c3da3ba264b78534883802320637da3dfaf1454eea9502ec6ba1539fab5a4bcb',
	CNNC_DTM='2020/12/14 00:00:00',LAST_PW_CHNG_DT='20201214'
	where USER_ID='D0000380' and USER_DLFG='U' and USER_CO_CD='H'
	ROLLBACK;
	COMMIT;
--  ���⣺������ϵͳ iccid ��һ�£�tmsϵͳ����ʱ��ʾ �Ѿ���ע���  V-B-20201215-47 ����DATA -->  ƥ����Ϣ����( iccid ������  ƥ����Ϣ����)
	select *from bt_car_mst where meid='89860919740002500587';
	update  bt_car_mst set meid='' where vin='LBECNAFD3LZ029682';
	SELECT * FROM bt_car_mst where vin='LBESUBFC7LW032081';
	
	select *from BT_CAR_TMNL_PAIR_IF where meid='89860920740010426301';
	update BT_CAR_TMNL_PAIR_IF set meid='' WHERE vin='LBECNAFD3LZ029682';
	delete BT_CAR_TMNL_PAIR_IF WHERE vin='LBETMBKD4LZ018768';
	select *from BT_CAR_TMNL_PAIR_IF where vin='LBESUBFC7LW032081';
	
	select *from bt_car_mst where meid='89860920770023544733'
	
	
-- ��ѯ��־ϵͳ��Ӧ�Ĳ�����
	SELECT * FROM bt_svc_id_mapp@iss_link 

--   ����ͻ��ύҳ��հ�    ��ʱ��û��̫��  2020-12-17	
	select * from  BT_CAR_CNTT where vin ='LJD2AA140L0232078'
	
	select csmr_no from bt_car_mst where vin='LJD2AA140L0232078'

	DECLARE         
	     jVIN VARCHAR2(17) := 'LJD2AA140L0232078';  
	    jMEID VARCHAR2(20) := '';
	    jCSMR_NO VARCHAR2(16):= 'C20201217001719';
	    jCNTT_NO VARCHAR2(12):= '';
	    jMDN VARCHAR2(11) := '';
	    mVIN VARCHAR2(17) := 'LJD2AA140L0232078';  
	    mMEID VARCHAR2(20) := '';
	BEGIN

	--------------- ���� BT_CSMR_MST  ------
	
	--DELETE BT_CSMR_MST WHERE CSMR_NO = 'C58997893658112'
	 --UPDATE BT_CSMR_MST SET EML='solyonglee@gmobis.com' WHERE CSMR_NO='C2017093357739'
	 --SELECT * FROM BT_CSMR_M
	
	ST WHERE CSMR_NO ='C588977936580810' FOR UPDATE
	 
	/**/
	INSERT INTO BT_CSMR_MST@ims_link (CSMR_NO,CSMR_NM,CSMR_SCN_CD,CSMR_DCRM_TYPE_CD,CSMR_DCRM_NO,HP1,HP2,EML,ZIP,WPA_CD,MPOL_CD,
	                                              ADDR1,ADDR2,ADDR3,BRDY,HAK_CD,MARI_EON,SEX,RGST_DTM,RGST_ID,MDFY_DTM,MDFY_ID,
	                                              CSMC_SCN,DLR_CD,CSMR_RGST_OPS,CO_CD,CORP_CD,DMS_DLR_CD,DMS_CSMR_NO)
	SELECT  jCSMR_NO,'test','1','1','1511111111111111111','111','00000000','test@test.com','402560
	','28','402560','����','����','����','19840810','8','N','M',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM',
	             CSMC_SCN,DLR_CD,'S',CO_CD,CORP_CD,DMS_DLR_CD,'' FROM BT_CAR_MST@ims_link WHERE VIN=mVIN;
             
             
             end;
             
             update bt_car_mst set CSMR_NO='C20201217001719' where vin='LJD2AA140L0232078'
	
	
	
	
	
	
	
	
	
	
	
	
--   ��ͨʧ��ʱʹ�õ�sql
	select meid from bt_car_mst where vin='LBECNAFDXLZ000356';
	select *from bt_car_mst where vin='LBECNADD4LZ026938';     -- ��������
	select *from bt_car_mst where meid='89860920740019752129';  
	
	select FIN_SMS_PW_YN from bt_tmnl_svc where meid= '89860920770008753838';     --   �����ֵ  1Ϊ����    ��Ϊ������
	select * from bt_tmnl_svc where meid='89860919740034307910';
	update bt_tmnl_svc set FIN_SMS_PW_YN=''   where meid= '89860919740001642927';    --- �޸ĳɲ�����
	update bt_tmnl_svc set FIN_SMS_PW_YN='1' where meid= '89860920770008753838';    --- �޸ĳɼ���
	update bt_car_mst set meid='89860920770040886695' WHERE VIN='LBECNAFD9MZ071016';
	update bt_car_mst set CAR_RGST_NO='��A5Z88C' WHERE VIN='LBECNAFD0LZ011270';
	-- bt_tmnl_svc (�ն˷����)
	select * from bt_tmnl_svc where meid='89860920740019752129'; 
	update bt_tmnl_svc set OPNG_PTT_ST_CD='EF' where meid='89860114511100609858'    -- �ն�״̬��Ϊע�����   ER����SF���� EF����ͨ   ԭʼ��SR // ����
	update bt_tmnl_svc set OPNG_PTT_ST_CD='OF' where meid='D91010F64F5E24'   -- ԭʼ  OP  �ն˱�  // һ�� A��ͷ
	--   A1000023C0FA1D  ��ĸ��ͷ��Ϊ  OF
	COMMIT;
	ROLLBACK;
	
--   �������˺Ź����޸�
/*   CSMC_SCN   k/d  ������urlβ����ĸ
https://hmc.hyundaibluelink.com.cn/dlw/com/loginK.do     ����
https://hmc.hyundaibluelink.com.cn/dlw/com/loginD.do     ���� �����ô������� D  �ô����� �� K 
*/
	select * from bt_user@dlw_link where USER_ID= 'HD426000'   -- and USER_DLFG='U' and USER_CO_CD='K'   --// H �ִ�   K ����
	update bt_user@dlw_link  set USER_PW= 'd4eb1d726afc8e09e47f9614e92b51570bc92be69f1a5cf9c91c768277c7ad62', 
	CNNC_DTM='2021/03/25 00:00:00',LAST_PW_CHNG_DT='20210325'
	where USER_ID= 'HD426000' and USER_DLFG='U' and USER_CO_CD= 'K' --AND CSMC_SCN= 'D';     
	
	update bt_user@dlw_link  set CNNC_DTM='2020/12/01 00:00:00',LAST_PW_CHNG_DT='20201201'
	where USER_ID='D0099456' and USER_DLFG='U' and USER_CO_CD='K'     --  ���޸�����
	
	update bt_user@dlw_link  set fail_cnt='0' where user_id='HD426000'        -- �����������
	
	select  CSMC_SCN from bt_user@dlw_link where user_id='HN041000';
	
	COMMIT;
	ROLLBACK;
	
	-- bt_csmr_mst  �ͻ�����   �հ�ҳ(bt_car_cntt �� tb_svc_open_mst���ݲ�һ��)
	-- bt_svc_opn_mst  ��ͨ��
	-- tb_car_mst ������
	-- tb_car_cntt ��ͬ��
	-- tb_car_tmnl_pair_if ƥ���
	-- tb_car_dgn 219��
	-- tb_svc_invc Invoice��
	-- bt_pcs_profile_info,bt_ccs_certification_data,bt_ccs_drivinglicense  ʵ����֤��������  
	-- bt_tmnl_prdn,bt_tmnl_svc �ն˱�
	-- bt_meid_altr_bkgd  �����ն˱�
	-- bt_eml_snd_bkgd ���ڼ�鱨���
	-- bt_car_prvs,bt_car_svc_st ����ͨ��ϸ������
--vin����   ������ S-B-20201211-18    �³������ѯ��ʾ���޷���ѯ������Ϣ ( ������ͬ���ݵ��� S-D-20201231-52 )   ��ͬ
	select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBECNAFDXLZ000356';   -- ��������ֶ�  ִ���±�sql  ���Ƿ���ͬ
			--     D2018111111111D         A11607570624547
	select DLR_CD,car_csmr_no from bt_svc_opn_mst where VIN = 'LBECNAFDXLZ000356';   --   D20121222000223    C58997893671285
	select DLR_CD,csmr_no,CSMR_SALE_DT from bt_car_mst where VIN = 'LBECNAFDXLZ000356';
			--  ִ���޸Ĳ�ͬ�������ֶ�
	update    bt_car_mst set DLR_CD='D20121222000204' where VIN = 'LBECNAFDXLZ000356';
	update    bt_car_mst set csmr_no='C20201024000029' where VIN = 'KMHR381C9MU235027';
	
	update    bt_svc_opn_mst set DLR_CD= 'D20121222000083' where VIN = 'LBECNAFD4LZ000255';   -- ԭʼ  D20121222000017
	update    bt_svc_opn_mst set car_csmr_no= 'A11605086986987' where VIN = 'LBECNAFD4LZ000255';  -- ԭʼ C58997893610265
	
	select  DLR_CD from  bt_svc_ent_rq  where VIN = 'LBECNAFD4LZ001471';
	update    bt_svc_ent_rq set DLR_CD='D20170511000001' where VIN = 'LBECNAFD4LZ001471';
	COMMIT;
	ROLLBACK;
    select * from  bt_svc_opn_mst where vin='LJD6AA2D1M0019786'   
      select CSMR_SALE_DT from  bt_car_mst where vin='LJD2AA195M0263940'
    /**  bt_car_mst  ��������   CSMR_SALE_DT һ�������³���һ��Ķ��Ƕ��ֳ�   **/
    update bt_car_mst set CSMR_SALE_DT='20200205' where vin='LBESUBFD8KW000098'  -- CSMR_SALE_DT ����Ϊ��  Ҳ��vin����
    
-- ʵ����֤ȷ���Լ��޸�
-- ͨ��vin��ѯ�ͻ���Ϣ(�ͻ���Ϣҳ��հ� S-B-20201221-74/S-B-20201221-75  )
	select * FROM bt_ccs_certification_data@ims_link	WHERE meid = '89860920740009902932';
	SELECT * FROM bt_ccs_certification_data@ims_link	WHERE vin = 'LBECNAFDXLZ000356'     -- ��֤��
	update bt_ccs_certification_data@ims_link set CERTIFICATION_STATUS='01',AUDITCODE='' WHERE VIN = 'LBECNAFDXLZ000356';    --   �����ύ��֤
	update  bt_ccs_certification_data@ims_link set meid= '89860920740019752129' WHERE VIN= 'LBECNADDXMZ049576';   -- �ͳ���iccid��һ��
	update  bt_ccs_certification_data@ims_link set SERVNUMBER= '17825361650' WHERE VIN= 'LJD6AA2D2L0003613';   -- �����ֻ���  15920281616

/** ��������ύ ��ѯʱ����Ϊ�ύ״̬��  �Ȳ�ѯ Ȼ�� pw �Ƿǿյ�(������������)��Ȼ���ǰ�ԭ��������ɾ�������ύ
	TMNL_SVC_TYPE �ǿյģ�ʵ����֤����meid��ƥ�����meid��ͬҲ�ᵼ�³�����ע���
*/
	select * from BT_TMNL_prdn where meid ='89860920740010025400';
	select * from BT_TMNL_SVC where meid ='89860920770038607053';
	select * from bt_ccs_certification_data@ims_link where vin = 'LBEDNAKE8LY012014'; 
	update BT_TMNL_prdn set pw='LB769' where meid ='89860920740013424519';
	update BT_TMNL_SVC set TMNL_SVC_TYPE='S' where meid ='89860920770038607053'   -- Ϊ��Ҳ�ᵼ��vin����
	select TMNL_SVC_TYPE from BT_TMNL_SVC where meid ='89860919740038159960' 
	update bt_ccs_certification_data@ims_link set CSMR_NM='�����' WHERE vin = 'LBEDUAHD3LZ000736';  -- ���пո��¶���ύʧ��
	update bt_ccs_certification_data@ims_link set CSMR_NM='����' where meid ='89860920740013537542';
	--   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H      �ִ���
    --   https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K       ���ǵ�
    
--  ƥ���
	update BT_CAR_TMNL_PAIR_IF@ims_link set meid= '89860920770038612210' where vin = 'LBENUBKC4LS340447'  -- AND  RGST_ID='QRopen'   -- �޸�ƥ��������
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where vin = 'LBENUBKC4LS340447' ;
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where meid= '89860920770008800084';
	delete BT_CAR_TMNL_PAIR_IF@ims_link WHERE meid= '89860919740008168124';
	ROLLBACK;
	COMMIT;
	select mdn,imsi,auth_key,crc_vrf_cd from bt_tmnl_svc where meid= '89860114511100646009'   --  ��ѯdn  MDN
	
--  ͨ��������ϵͳ��VIN     ���⣺������ϵͳvin��һ��
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
	
	/* ���⣺������ϵͳ iccid ��һ�£�tmsϵͳ����ʱ��ʾ �Ѿ���ע���  V-B-20201215-47 ����DATA -->  ƥ����Ϣ����( iccid ������  ƥ����Ϣ����)
	     ���⣺ʵ����֤ʱ������ vin ��ʾ����������
	*/
	select *from bt_car_mst where meid= '89860920770042957205';
	update  bt_car_mst set meid='' where vin='LBECNAFD6MZ052309';
	SELECT * FROM bt_car_mst where vin='LBECNADDXMZ049576';
	
	select *from BT_CAR_TMNL_PAIR_IF where meid= '89860920770042957205';
	update BT_CAR_TMNL_PAIR_IF set meid='' WHERE vin='LBECNAFD9MZ070027';
	delete BT_CAR_TMNL_PAIR_IF WHERE vin='LBES6AFD6KW084684';
	select *from BT_CAR_TMNL_PAIR_IF where vin='LBEDNAKE1LY016809';
	
	select *from bt_car_mst where meid= '89860920770038607053'
	--   �����ڵ�iccid   
	select TMNL_SVC_TYPE from BT_TMNL_SVC where meid='89860920770038608853';
	update BT_TMNL_SVC set TMNL_SVC_TYPE='S' where meid ='89860920770038608853'
	
/*  ��ѯqq��֤ʱ�䣬�����������еĳ���     ����CCS�Ŀ�  */
	select * from BT_QQ_VIN_CHECK_INFO where VIN = 'LBETLBFC1KY449318 ';
	
/*   ��ѯ��־ϵͳ��Ӧ�Ĳ�����   */
	SELECT * FROM bt_svc_id_mapp@iss_link 

/*  ����ͻ��ύҳ��հ�    ��ʱ��û��̫��  2020-12-17	*/
	select * from  BT_CAR_CNTT where vin ='LBEDNAFD9LY000228'
	
	select csmr_no from bt_car_mst where vin= 'LJD2AA140L0244697'
	DECLARE         
	     jVIN VARCHAR2(17) := 'LJD2AA140L0232078';  
	    jMEID VARCHAR2(20) := '';
	    jCSMR_NO VARCHAR2(16):= 'A11609462862407'; -- ��Ķ�
	    jCNTT_NO VARCHAR2(12):= '';
	    jMDN VARCHAR2(11) := '';
	    mVIN VARCHAR2(17) := 'LJD2AA140L0232078';  
	    mMEID VARCHAR2(20) := '';
	BEGIN
	--------------- ���� BT_CSMR_MST  ------
	--DELETE BT_CSMR_MST WHERE CSMR_NO = 'C58997893658112'
	 --UPDATE BT_CSMR_MST SET EML='solyonglee@gmobis.com' WHERE CSMR_NO='C2017093357739'
	 --SELECT * FROM BT_CSMR_M	
	ST WHERE CSMR_NO ='A11609462862407' FOR UPDATE
	/**/
	INSERT INTO BT_CSMR_MST@ims_link (CSMR_NO,CSMR_NM,CSMR_SCN_CD,CSMR_DCRM_TYPE_CD,CSMR_DCRM_NO,HP1,HP2,EML,ZIP,WPA_CD,MPOL_CD,
	                                              ADDR1,ADDR2,ADDR3,BRDY,HAK_CD,MARI_EON,SEX,RGST_DTM,RGST_ID,MDFY_DTM,MDFY_ID,
	                                              CSMC_SCN,DLR_CD,CSMR_RGST_OPS,CO_CD,CORP_CD,DMS_DLR_CD,DMS_CSMR_NO)
	SELECT  jCSMR_NO,'test','1','1','1511111111111111111','111','00000000','test@test.com','402560
	','28','402560','����','����','����','19840810','8','N','M',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM',
	             CSMC_SCN,DLR_CD,'S',CO_CD,CORP_CD,DMS_DLR_CD,'' FROM BT_CAR_MST@ims_link WHERE VIN=mVIN;      
             end;   
             
             update bt_car_mst set CSMR_NO='A11609462862407' where vin='LJD2AA140L0232078'
	
	/*
	S-B-20201228-35  ����������Ҫ�������񣬺�ʵ��Ϣ���³�������ʾVIN���󣬾����̷����Ѿ���ͨ����ʾ���Լݳ���ʱ��ͨ����
	*/
	
	--select * from BT_TEST_VIN WHERE VIN = 'LBEDUAHD5LZ000222'
	--update  BT_TEST_VIN   set DLRSALE_YN=1 where vin='LBECNAFD8LZ000288'
	DELETE FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LJD5AA1D9L0010734'  ;
	DELETE FROM BT_SVC_INVC@iss_link		WHERE vin = 'LJD5AA1D9L0010734';
	DELETE FROM bt_svc_ent_rq@iss_link		WHERE VIN = 'LJD5AA1D9L0010734'  ;
	
	DELETE FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LJD5AA1D9L0010734' ;
	DELETE FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LJD5AA1D9L0010734' ;
	DELETE FROM BT_PCS_PROFILE_INFO@iss_link	
	
	
	/**    �޸Ŀͻ����ƺţ����ǵڶ����裬��һ��������postman�в�����  */
	SELECT * FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LBECNADD4LZ026938' ;
	SELECT * FROM  bt_ccs_drivinglicense@ims_link WHERE PLATE_NO = '��A680F3' ;
	update bt_ccs_drivinglicense@ims_link	 set PLATE_NO= '��NZE260' WHERE vin= 'LBECNADD4LZ026938';
	ROLLBACK;
	COMMIT;
	
	/**   �ͻ������ʾAPPע�ᣬ���복�ܺŲ�ѯ��ʾ����������  ��Ϊ��ͬ�������ж���  */
	select *from bt_car_mst where vin='LBECNADD7MZ054203'
	select *from bt_car_mst where MEID='89860920740019718047'  -- ��������
	update bt_car_mst	 set MEID= '' WHERE vin= 'LBECNAFD5MZ054052';
  	select *from BT_CAR_CNTT@IMS_LINK where vin='LBECNAFD8MZ063876'
	delete from  BT_CAR_CNTT@IMS_LINK where  vin='LBEDNAFD4LY011024' and CSMR_NO!='A11609220632221'
	select * from BT_CAR_TMNL_PAIR_IF@ims_link  where MEID = '89860920740009902932' ;-- ƥ����������
	delete from  BT_CAR_TMNL_PAIR_IF@ims_link where  MEID = '89860920770040857126' ;
	update BT_CAR_TMNL_PAIR_IF@ims_link 	 set MEID= '' WHERE vin= 'LBECNAFD5MZ054052';
	/*  �ն˸����ļ�¼   �ڶ�������ִ��  CUUtil.java  */
	select * from bt_meid_altr_bkgd where vin = 'LBENUBKC4LS340447'
	
	/*   ��dlw��ͨ������vin ������������  */
	---����CONT_SN ;
	select *from bt_car_mst where vin= 'LJD6AA2D1M0019304'
	select *from bt_svc_opn_mst where vin= 'LJD6AA2D1M0019304'
	select *from bt_tmnl_svc where meid= '89860920740013539449';
	select *from bt_tmnl_svc where cont_sn= '91615537056899'
	--��cont_sn����Ϊһ�������ڵ�cont_sn
	update BT_SVC_INVC@iss_link	set CONT_SN= '91615537056899'  where vin= 'LJD6AA2D1M0019304';
	update bt_svc_ent_rq set CONT_SN= '91615537056899'  where vin= 'LJD6AA2D1M0019304';
	
	update bt_svc_opn_mst set CONT_SN= '91615537056899'  where vin= 'LJD6AA2D1M0019304';
	update bt_car_svc_st set CONT_SN= '91615537056899' where vin= 'LJD6AA2D1M0019304';
	update bt_tmnl_svc set CONT_SN= '91615537056899' where meid= '89860920740013539449';	
	
	/*  ɾ����ֵ����ɷѼ�¼�����¿�ͨ    �������� */
	select * FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LBETLBFD2FY000843' 
	select * from  bt_svc_ent_rq@iss_link		WHERE VIN = 'LBETLBFD2FY000843';
	DELETE FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LBETLBFD2FY000843'  and cont_sn='91615790532950';
	DELETE FROM BT_SVC_INVC@iss_link		WHERE vin = 'LBETLBFD2FY000843' and cont_sn='91615790532950';
	DELETE FROM bt_svc_ent_rq@iss_link		WHERE VIN = 'LBETLBFD2FY000843' and cont_sn='91615790532950'  ;
	/** ɾ����ֵ������������ */
 	select * FROM BT_SVC_INVC@iss_link		WHERE vin = 'LJDXAA12XL0100742';  -- ��¼   ASKF_AFFR_SCN=9 �ɹ�
 	delete from BT_SVC_INVC@iss_link  where vin='LBECNADDXMZ049402' and ASKF_SN=3
 	update BT_SVC_INVC@iss_link set ASKF_SN=3 where vin= 'LJD3AA2D5K0015305' and ASKF_AFFR_SCN ='09'; -- һ�㲻ʹ��
	select *from BT_RCP_INFO where vin='LJDXAA12XL0100742'
	delete from BT_RCP_INFO where vin='LJD3AA2D5K0015305'
	--��ͨ��ֵ����
	https://hmc.hyundaibluelink.com.cn/dlw/qropen/psvcopen/one.do?iccid=89860918710003568868&cocd=K
	COMMIT;
	/*  �ʼ�   */
	--bt_csmr_mst  �ͻ�����
	select  * FROM BT_CSMR_MST where CSMR_NO ='A11613703874940';
	select CSMR_NO from bt_car_mst where vin='LBECNAFD6LZ044810';     -- ��������
	SELECT * FROM BT_CSMR_MST where CSMR_NO ='A11607677089575';
	SELECT * FROM  BT_EML_SND_BKGD@ISS_LINK where  vin='LBECNAFD6LZ044810';  -- SND_YN  Y�� N��
	
	/* ����vin ����ҳ��ʱ�հ�  */
	select * from bt_car_mst where vin='LBECNAFD4LZ001471';     -- ��������
	select * from bt_car_mst where csmr_no='C20201206000188';   
	select * from bt_csmr_mst  where csmr_no='C20201206000188'; 
	update bt_csmr_mst set csmc_scn='D' where csmr_no='C20180106000053';   -- ԭ����K    �����ô������� D  �ô����� �� K 
	-- ��һ��ѯ��ͬ����
	select DLR_CD,csmr_no ,cntt_st_cd from bt_car_cntt where VIN = 'LBEDNAFD2LY000443';  --CSMR_NO=''=8 ��ͬ���
	--  ��Ϊ��ͬ�����е����±������������ݲ�һ��
	select * from bt_svc_opn_mst@iss_link where vin ='LBEDNAFD2LY000443';  -- ��ͨ�����ʹ��
	select * from bt_svc_invc@iss_link where vin ='LBEDNAFD2LY000443'; -- ���������
	select * from bt_svc_ent_rq@iss_link where vin ='LBEDNAFD2LY000443';
	update bt_svc_opn_mst@iss_link set CAR_CSMR_NO='C20201201001320' where VIN='LBEDNAFD2LY000443';  
	update bt_svc_invc@iss_link set CSMR_NO='C20201201001320' where VIN='LBEDNAFD2LY000443';  
	update bt_svc_ent_rq@iss_link set CAR_CSMR_NO='C20201201001320' where VIN='LBEDNAFD2LY000443';  
	/*  ʵ����֤ʱ��  ����vin  ��ʾ������ע��   �����ǣ�ƥ����е�ICCID��һ�µ���*/
	COMMIT;
	/**  �ֻ��󶨳�����ɾ������  ��ִ������sql��ѯ��Ϣ��ִ�� CCSPUtil.java */
	select *  FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBEDNAKE7LY001666'; --ʹ�ã�MASTER_ID�ֶ�ֵ
	select  t.VEHICLE_NM_CN ,t.HVAC_TEMP_TYPE,FUEL_TYPE from bt_car_mst b,tb_vehl_cd t where b.SALE_VEHL_CD=t.sale_vehicle_cd and  vin= 'LBEDNAKE7LY001666';
	SELECT * FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LBEDNAKE7LY001666' ;
	
	/** �����ֻ���  */
	select *  FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LJD6AA2D2L0003613'
	update bt_ccs_certification_data@ims_link set SERVNUMBER='17825361650' WHERE VIN = 'LJD6AA2D2L0003613'
	
	select CSMR_NO from bt_car_mst where vin='LJD6AA2D2L0003613'
	SELECT * FROM BT_CSMR_MST WHERE CSMR_NO ='C58997893673635'
	update BT_CSMR_MST set HP1='178',hp2='25361650' WHERE CSMR_NO ='C58997893673635'
	
	select * FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LJD6AA2D2L0003613';
	update bt_svc_opn_mst@iss_link set UGY_TEL_NO1='178', UGY_TEL_NO2='25361650' WHERE VIN = 'LJD6AA2D2L0003613';
	
	select * FROM BT_PCS_PROFILE_INFO@iss_link		WHERE VIN = 'LJD6AA2D2L0003613';
	update BT_PCS_PROFILE_INFO@iss_link	  set PROFILE_PNUM='17825361650' WHERE VIN = 'LJD6AA2D2L0003613'; 
	
	/**  tmsdlwwas@ 10.124.253.153:1521:CCS IMS_PROD TIBERO_6X   ���ֳ�����vin����    �û�����Vin �հ�ҳ */
	DECLARE         -- ��һ��
     jVIN VARCHAR2(17) := 'LBEDMBKD0JZ225868';  
    jMEID VARCHAR2(20) := '';
    jCSMR_NO VARCHAR2(16):= 'B58997893675868'; -- ��Ķ�
    jCNTT_NO VARCHAR2(12):= 'A2475395868'; -- ��Ķ�
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
	SELECT  jCSMR_NO,'test','1','1','1511111111111111111','111','00000000','test@test.com','402560','28','402560','����','����','����','19840810','8','N','M',SYSDATE,'SYSTEM',SYSDATE,'SYSTEM',
	             CSMC_SCN,DLR_CD,'S',CO_CD,CORP_CD,DMS_DLR_CD,'' FROM BT_CAR_MST@ims_link WHERE VIN=mVIN;
	             
	             end;
	             
	update  bt_car_mst set CSMR_NO='B58997893675868' where vin='LBEDMBKD0JZ225868'  -- �ڶ���
	
	/**  APP�����ӵ�¼����   û������Կ�׼���*/
	select SALE_VEHL_CD from bt_car_mst where vin ='LBENUBDC4MS343962'  -- ��һ�鳵��
	select *from bt_car_mst where SALE_VEHL_CD='NUF'  -- �ڶ��鳵��
	select * from TB_CAR_DGN@IMS_LINK where vin ='LBENUBDC4MS343962'
	update TB_CAR_DGN@IMS_LINK  set CNVR_VAL=1 where vin ='LBENUBDC4MS343962' and dgn_cd='00067'
	commit;

	/** ���ֳ� �� dlw�� ȱ�� ��������ֵ*/
	select *from bt_tmnl_svc where meid='D91010F65189A8'
	select *from bt_tmnl_prdn where meid='D91010F65189A8'
	update bt_tmnl_svc set  MOFM_CD='CTJV' where  meid='D91010F65189A8';
	update bt_tmnl_prdn set  MOFM_CD='CTJV' where  meid='D91010F6557A55';
	
	/**
���ݿ���ĳ���������ֶεĳ���
��������ֶγ��Ȳ�����ʱ����ʱ����Ҫ�����ֶΣ�
*/
alter table ���� modify �ֶ���  �ֶ�����  �ֶ����ͳ��� ; 

���ӣ�

alter table user modify name  varchar2 (32); 	
	
	/**   �����¼�鿴APP��־  OMS�� */
	
	select * from BT_TRANSACTION a,BT_SCEN_TRAN b
where a.tid = b.tid 
and a.start_time  BETWEEN TO_DATE('2021-02-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2021-02-03 23:57:00', 'YYYY-MM-DD HH24:MI:SS')
and b.header like '%LBECNAFD2LZ033657%'
and a.SCENARIO = 'G2RDO-D';

/**   ��ѯ�������ʧ�ܵ� **/
select a.*from bt_cu_activefreecommodity a,bt_car_mst b
where 
a.iccid=b.meid and b.SALE_VEHL_CD not in('NPF','KA4')
 and a.rgst_dtm<to_date('2021-03-02 00:00:00','yyyy-mm-dd hh24:mi:ss')
and a.rgst_dtm>=to_date('2021-03-01 00:00:00','yyyy-mm-dd hh24:mi:ss')
and (a.result=0 or a.result is null)

/**    ��OPIO�ĳ���ϵͳ��ʾ�ǹ���  **/   �ն�����
select * from  BT_CAR_PRDN_INFO where vin='LJDUAA2J0L0012467'
select * from  BT_TMNL_PRDN where meid='89860919740008272298'
select * from  BT_TMNL_svc where meid='89860919740008272298'
update BT_CAR_PRDN_INFO set TMNL_TYPE ='I' where vin='LJDUAA2J0L0012467'    --A�ǹ����� I ����
update BT_TMNL_PRDN set MOFM_CD='CUJV' where meid='89860919740008272298'
update BT_TMNL_svc set MOFM_CD='CUJV' where meid='89860919740008272298'

/** dlw����ͣ������  ��ѯvin����ע�����  ����Ϊ  cont_snΪ����**/
select * from bt_svc_opn_mst where VIN = 'LJD6AA244L0014581';--D20121222001153
SELECT * FROM BT_TMNL_SVC WHERE meid ='89860920740013534119'
update BT_TMNL_SVC set cont_sn='91612095558368' WHERE meid ='89860920740013534119'
SELECT * FROM BT_TMNL_SVC WHERE cont_sn ='91612095558362'
-- ����޸���� dlw�в�ѯ��������¼ִ���±�sql
---�ظ��Ļ�����CONT_SN
update BT_SVC_INVC@iss_link	set CONT_SN='91612095558362'  where vin='LJD6AA244L0014581';
update bt_svc_ent_rq set CONT_SN='91612095558362'  where vin='LJD6AA244L0014581';
update bt_svc_opn_mst set CONT_SN='91612095558362'  where vin='LJD6AA244L0014581';
update bt_car_svc_st set CONT_SN='91612095558362' where vin='LJD6AA244L0014581';
update bt_tmnl_svc set CONT_SN='91612095558362' where meid='89860920740013534119';

/** �������  ��IE���Լ���ģʽ */
http://10.124.253.150:17001/dlw/ct.do?ctUserId=JVCCAGENT&ctUserPw=eaa6b185b4265cd07e3f1c92cb302371b251b4e946f515c4f7a0466b84c353fa&csmrNo=A11610197571481&dlrCd=D20121222001153&vin=LBE3SBFC0JW005795

select *from bt_svc_invc@iss_link  where vin='LJDUAA2J6J0010901'
update bt_svc_invc@iss_link set TRTM_CMPL_SCN='Y'  where vin='LBE3SBFC0JW005795' and cont_sn='';  -- δ�����ִ���±�sql
update  bt_svc_invc@iss_link b set ASKF_SN=0 where vin='LBE3SBFC0JW005795' and cont_sn='91613007191844' and ASKF_AFFR_SCN='09'

/*** �û���ͨ������ʾ������ע�������û����������9910000666 */
���֤����Ǹ�xҪ��ҳ���ϸĳɴ�д�����ύ���� ���ݿ�����˲���

/** �ʼ����ڷ��� ���ٵ���511  */
select * from BT_DRVG_INFO_G2 where  vin = 'LJD6AA2D8L0010971'  --  TRSC_ID  ȥoms��ѯ
--TMU2�ǳ������͵�511
/**  APP �����޷�ʹ�� OMS��500*/
--- Cause: java.sql.SQLException: JDBC-11048:"TMSISSADM"."BT_SVC_OPN_MST"."SMT_ERR_NO" The value is too large for the column. (Actual value: 2, Maximum value: 1)
	select * FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'KNAKU8111E5454879'; -- SMT_ERR_NO �ֶ��޸�Ϊ 0
	update  bt_svc_opn_mst@iss_link set SMT_ERR_NO=0 where vin='LBETLBFC8JY426486';
	COMMIT;
	
	/** ble */
	update TB_CAR_DGN@IMS_LINK set CNVR_VAL=2 where vin ='LJD6AIRDETO000001' and dgn_cd in('00002');-- 1��ble��ccsp�����ã�2��ֻ��ble
	
	
	----��ѯ������Ϣ���� �շѿ�ͨ

 SELECT A.TMNL_TYPE,C.TMNL_TYPE  FROM  BT_CAR_PRDN_INFO@IMS_LINK A, BT_VEHL_SVC@ims_link C
	   WHERE A.VIN = 'KMHGC41C1EU266337' AND   A.SALE_VEHICLE_CD = C.vehicle_cd AND   A.CSMC_SCN = C.CSMC_SCN
	 --��BT_VEHL_SVC	 TMNL_TYPE Ϊ׼ 
update BT_CAR_PRDN_INFO@IMS_LINK A set TMNL_TYPE='P' where VIN = 'KMHGC41C1EU266337' 
	
	/*    CT   V-K-20210312-15  MDN:15340063576  ESN: 80C7F00B  -- ��ʽ  ������ʢ��*/
	select ESN,MDN from BT_TMNL_SVC  where meid ='D91010F64F5E24';

	--����ͨ��Ҫɾ����������  ʵ����֤��������ṩ�����䲻һ��  ���Գ�Ҳ��ִ��
	select * FROM bt_svc_opn_mst@iss_link WHERE VIN = 'LBECNAFD6LZ044810';
DELETE FROM bt_svc_opn_mst@iss_link		WHERE VIN = 'LBECNAFD6LZ044810';
DELETE FROM BT_SVC_INVC@iss_link		WHERE vin = 'LBECNAFD6LZ044810';
DELETE FROM bt_svc_ent_rq@iss_link		WHERE VIN = 'LBECNAFD6LZ044810';

DELETE FROM bt_ccs_certification_data@ims_link	WHERE VIN = 'LBEDUAHDXLZ001916';
DELETE FROM bt_ccs_drivinglicense@ims_link		WHERE vin = 'LBEDUAHDXLZ001916';
DELETE FROM BT_PCS_PROFILE_INFO@iss_link		WHERE VIN = 'LBEDUAHDXLZ001916';
--  ���Գ���dlw��ȡ��ʧ���˾�ִ���±ߵ�
select * from BT_TEST_VIN  where VIN = 'LJD6AA246L0005378'
update BT_TEST_VIN set DLRSALE_YN=1 where VIN = 'LJD6AA246L0005378'

/** �ϴ���ʻ֤������һ����ʾSQL����  ����������  ��Ϊһ��ICCID��Ӧ������VIN*/
	select *from bt_car_mst where vin='LBECNAFD9MZ070271';     -- ��������
	select *from bt_car_mst where meid='89860920770042957205';  
	update bt_car_mst set meid='' where vin='LBECNAFD9MZ070027'; 
	commit;

/** ������ͨ���� **/

select OPN_DTM from  bt_svc_opn_mst where vin='LBECNAFDXLZ030392'   
	
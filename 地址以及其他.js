
需要用到的数据库
	10.124.253.135  tmsimswas   gtms45!@      CCS
	--加密和不加密开通，1是加密，0是不加密   
	select meid from bt_car_mst where vin='KMHR381C4MU236182';
	select FIN_SMS_PW_YN from bt_tmnl_svc where meid='89860920740009881078';
	update bt_tmnl_svc set FIN_SMS_PW_YN='' where meid='89860920740009881078';
	
	/**
	修改经销商账号日期的
	*/
	select * from bt_user@dlw_link where USER_ID='D0018503' and USER_DLFG='U' and USER_CO_CD='H'   // H 现代   K 起亚
	update bt_user@dlw_link  set USER_PW='689dc8243e3228633f9f4aa402a96a5b8d5e4dae50469f4cdeeca1ec658f1bc1',CNNC_DTM='2020/09/01 00:00:00',LAST_PW_CHNG_DT='20200911'
	where USER_ID='D0018503' and USER_DLFG='U' and USER_CO_CD='H'

	http://tool.chinaz.com/tools/hash.aspx  选中(SHA256)

	//  修改上面的sql后执行：  update bt_user@dlw_link  set fail_cnt='0' where user_id='HZ425000'   --  密码超过五次账号锁死使用此sql

	
第一步  查出工单信息
	http://10.124.74.3:8003/autoservice/   工单   不兼容
	http://10.124.74.3:8003/autoservice/login_tms.do   兼容
	daishixiao    shixiao12！
	
第二步
	http://10.124.253.149:17001/dlw/  (经销商称 TMS系统)
	https://hmc.hyundaibluelink.com.cn/dlw/com/loginB.do
	https://hmc.hyundaibluelink.com.cn/dlw/com/loginD.do
	账号 sadmin   密码是 gccs12345!
	select  CSMC_SCN from bt_user@dlw_link where user_id='D0035742';

第三步
	https://cc1.10646.cn/provision/ui/terminals/sims/sims.html  M2M 
		2503533    QWE123!@#
	策略(流量)
	
第四步(也可以是第二步)
	https://hmc.hyundaibluelink.com.cn/dlw/wzd/callcenter/selectCarInfo.do  查询服务开通
	https://hmc.hyundaibluelink.com.cn/dlw/ctWzdContPage.do?strUserId=JVCCAGENT&strUserPw=
	eaa6b185b4265cd07e3f1c92cb302371b251b4e946f515c4f7a0466b84c353fa&strNatCd=zh&strPgmCd=P0030&strRefrPgmCd=P0031?
	programcd=MN0307&registerfg=Y&modifyfg=Y&deletefg=Y

	
	浏览器不兼容是因为下拉列表中导致  disabled="disabled"
	onmouseover="stop()" 
	onmouseout="start()"
	
	http://10.109.133.134:8082/oms/    sadmin gccs1234!
	
/**-------------------------------------------*/
	实名认证链接
		https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=H
		现代的
		https://hmc.hyundaibluelink.com.cn/dlw/qropen/auth/one.do?cocd=K
		起亚的
/**
	
	终端无响应，请用户到店检测终端线路或者酌情更换终端处理
	核实该用户MDN无异常
	查询下发记录均显示终端无响应556错误
	终端故障，请用户到店检测终端线路或者酌情更换终端处理
	S-B-20201212-18这个一般这样回复，核实MDN没问题的话，看下下方日志是什么错误，556是终端没响应，是终端的问题
	
	新车开通失败
	
	回复：TMU问题 --> 
	TMU reset(不在线回复)   
		核实该车辆MDN无异常，短信可以正常下发
		终端无响应导致开通失败
		请用户reset重启下终端，测试信号能否恢复
		
	再发成功(在线回复)
		再发成功，服务已恢复，请再次确认后结单处理
		
		请用户在信号良好的地方，reset重启下终端，再次下发
		
		处理详情那里要写处理结果
		终端数据问题，已修改，请用户继续开通
		
		请用户到店检测SOS线路以及硬件
		
		服务器日志显示sos服务因为终端无响应504错误失败，请用户reset重启终端，再次测试
		
		请用户reset重启下终端，测试信号能否恢复
		
		核实该车辆MDN无异常，短信可以正常下发
		终端无响应导致开通失败	
		请用户reset重启下终端，测试信号能否恢复
		
		多次下发显示终端无响应下发失败，请用户reset重启下终端，测试信号能否恢复
		
		今日为用户进行多次下发均显示超时失败，
		4G信号如始终无法恢复，建议联系经销商检测终端天线线路或酌情更换终端处理
		
	1.	问题：客户表示服务开通失败，核实ICCID无误，原厂导航无后加装，终端在线，下发指令失败，导航有信号，请协助处理，
		处理详情：终端无响应，请用户reset重启终端，再次下发
		回复：为用户多次下发均显示因为终端无响应失败，
		请用户reset重启终端，再次下发
		
	2.	问题：客户表示服务开通失败，核实ICCID无误，原厂导航无后加装，终端在线，下发指令失败，导航有信号，请协助处理，
		处理详情：请用户reset重启下终端，测试信号能否恢复
		回复：核实该车辆MDN无异常，短信可以正常下发 
			  请用户reset重启下终端，测试信号能否恢复
		
	3.	问题：用户服务开通失败，ICCID一致，原厂导航无后加装，软件版本190123，终端离线，重启及reset，终端在线下发指令失败，无4G信号，请协助处理，谢谢！
		处理详情：车机SIM卡停用，已重新为用户开通，请用户reset重启下终端，再次下发开通
		回复：车机SIM卡停用，已重新为用户开通，请用户reset重启下终端，再次下发开通
		
	4.	问题：客户来电服务开通失败，核实iccid正确，原厂导航无后加装，终端不在线，重启和reset后终端在线，下发指令未成功，核实无4g信号，请协助处理，谢谢
		处理详情：终端离线，请用户reset重启下终端，测试信号能否恢复
		回复：终端离线，请用户reset重启下终端，测试信号能否恢复
			  待信号恢复后再次下发
		
	5.	问题：经销商要更换iccid号码，核实是购车经销商，登录TMS系统输入车架号查询提示没有相应数据，请协助处理，谢谢。
		处理详情：经销商账号密码重置
		回复：已重置，已测试可登录
		
	6.  问题：经销商咨询登录TMS系统三个月未登录已锁定，确定输入无误，请协助处理，谢谢。
		处理详情：经销商账号密码重置
		回复：已重置，已测试可登录
		
	7.	问题：用户服务开通失败，ICCID无误，原厂导航无后加装，终端在线，下发指令失败，有4G信号，请协助处理，谢谢！
		处理详情：终端无响应，请用户reset重启下终端，再次下发
		回复：终端无响应，请用户reset重启下终端，再次下发
		
	8.  问题：用户表示服务开通失败，核实ICCID一致，终端在线，原厂导航无后加装，多次下发指令失败，导航屏幕上没有4G信号，请协助处理，谢谢。
		处理详情：请用户在信号良好的地方，reset重启下终端，再次下发
		回复：MDN正常，CU短信正常下发
				尝试多次下发指令显示终端无响应失败
				请用户在信号良好的地方，reset重启下终端，再次下发
	
	9.  问题：用户QQ音乐一直提示认证中，重启RESET未恢复，表示重启了3次还是一样，其他功能都可以使用，SOS可以使用，有信号，核实ICCID一致，用户要求尽快处理，请协助处理，谢谢。
	    处理详情：流量添加失败导致，已重新添加，请用户reset重启终端，再次测试
		回复：流量添加失败导致，已重新添加，请用户reset重启终端，再次测试
		
	10. 问题：经销商来电表示无法开通服务，查询VIN错误，核实有SOS按键，请协助处理，谢谢。
		处理详情：客户数据问题，已恢复
		回复： 客户数据问题，已恢复
		
	11. 问题：用户来电表示12.10上传的证件，至今没有收到审核通过的短信，用户自行扫码提示审核通过开通中，请协助处理。谢谢。
				服务状态：未开通
				邮箱：471967063@qq.com
				密码：Gyq19930419.
				ICCID:89860920740013570790 
		处理详情：已修改服务，已开通//  已处理，请用户重启终端，下发开通即可
		恢复：已修改服务，已开通
	
	12. 问题：客户来电表示SOS提示通讯不畅，核实ICCID全部为零，请协助处理，谢谢。
		处理详情：ICCID为一串0，需要插拔TMU芯片，reset重启测试能否恢复，如无法恢复，建议更换终端处理 （TMU问题 --> TMU硬件问题）
		回复：ICCID为一串0，需要插拔TMU芯片，reset重启测试能否恢复，如无法恢复，建议更换终端处理
*/






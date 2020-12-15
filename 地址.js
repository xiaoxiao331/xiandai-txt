

1. 工单
	10.109.134.71  ibs / Hmgc123! hkmc1!
	/home/ibs/monitoring/tomcat/tomcat8_38001       
	http://ibsq.hyundaibluelink.com.cn:38001   sadmin accs1234！ daishixiao daishixiao1234！  

2. svn 账号
	tmsjx_dsx   / tmsjxdsx1!   
	https://10.124.253.26/svn/ccs_com/csm   tmsjx_dsx   /  tmsjxdsx1!   暂停使用
	https://10.124.253.26/svn/ccs_com/work_order_system  // 暂停使用
	https://10.124.253.26/svn/csm/csmapp

3. 邮箱
	https://mail.hmgc.com.cn/OWA/  
	daishixiao       daishixiao123！

4. 插件
	http://www.dmaku.com/  
	https://www.jq22.com/
	https://blog.csdn.net/zhangge3663/article/details/86678459  CSS转义字符对照表
	https://www.php.cn/xiazai/shouce    手册
	https://www.markerhub.com/  项目
	https://mvnrepository.com/ JAR包下载
	https://www.matools.com/api   JDK api

5. GCS --> oms
	以后密码到期的话，执行这个就行了
	update bt_user set last_pw_chng_dt = to_char(sysdate,'YYYYMMDD'),LAST_LOGIN_DT = sysdate where user_id = 'sadmin'
	http://10.107.253.40:17001/oms/   正式网址 sadmin/gccs1234!
	http://10.107.252.40:17001/oms/   测试网址
	
   GCS --> dlw 
	测试环境  10.107.252.33/34  tomcat 密码变更为 GCSasd123!@#
	GDLW  10.107.253.33/34  正式服务器  tomcat 密码变更为 GCSasd123!@#

	http://10.107.253.33:17001/dlw/com/loginG.do  sadmin gccs12345!
	http://10.107.253.34:17001/dlw/com/loginG.do
	
   GCS --> ims
	10.107.252.30
	10.107.253.30
	http://10.107.252.30:17001/gims/  测试网址 sadmin/gccs1234!
	http://10.107.253.30:17001/gims/  正式网址

6. M2M
	https://cc1.10646.cn/provision/jsp/login.jsp?login_error=1
	2503533
	QWE123!@#

7. Git 地址
	https://10.10.150.92:8001/users/sign_in
	账号:daishixiao   初始密码：h/kmc123
	新密码: shixiao12 

8. jenkins
	https://10.10.150.92:8001/users/sign_in         git 存放项目
	https://10.10.150.94:3000/auth/login         resouce   配置文件(数据库配置/tomcat配置)
	https://10.10.150.93:8080/         jenkins   配置项目
	https://10.109.131.37:3000/     applicationcatalog  服务启停    2503487@hmgc.com.cn  kaixin1314
	
	https://10.109.131.5:3000/dashboard/node_list  application catalog(STG)    测试环境

9. app
	daishixiao@hmgc.com.cn       D19921120!   pin  1234
	车辆信息   TESTG80C120200000   12674005334
	
10. 工单系统
	http://10.124.74.3:8003/autoservice/login_tms.do  账号：daishixiao   密码：daishixiao123！

	
//---------------------------------------------------------------------------------	
10.107.255.27服务器 密码更改为hkmc/Asd321#@!      // 还未清楚是做什么的
dlw  10.124.253.150/149   tomcat密码改为QAZdlw456$%^
ims  10.124.253.144/145  id/pw tomcat Asd123!@#

CCS --> DKC主要是负责车辆钥匙的
CCS --> DLW
CCS --> IMS  http://10.124.253.144:17001/ims/
CCS --> OMS
CCS --> ISS
CCS --> NTC
CCS --> CCSP
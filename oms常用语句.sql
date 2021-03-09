-- 每天执行统计

      MERGE INTO bt_svc_summary BSS
                    USING 
                          (
                            select 
                                to_char(start_time,'YYYYMMDD') as summaryDt,
                                NVL(SCENARIO,'none') AS SCENARIO,
                                count(*) as totalCnt,
                                sum(decode(tran_cd ,200,1,0) )  as successCnt,
                                sum(decode(tran_cd ,200,0,1) )   as failCnt
                            from BT_TRANSACTION a
                            where a.start_time   >  TRUNC(SYSDATE - 1)   
                            and a.start_time <   TRUNC(SYSDATE )
                            group by SCENARIO,to_char(start_time,'YYYYMMDD')
                       ) CNTT
                    ON (
                        BSS.SUMMARY_DT = CNTT.summaryDt
                        AND BSS.SCENARIO = CNTT.SCENARIO
                    )
                    WHEN MATCHED THEN
                      UPDATE
                         SET 
                             RGST_ID   = 'BATCH'
                            ,RGST_DTM      = SYSDATE
                            ,TOTAL_CNT       = CNTT.totalCnt
                            ,SUCCESS_CNT       = CNTT.successCnt
                             ,FAIL_CNT       = CNTT.failCnt

                    WHEN NOT MATCHED THEN
                      INSERT
                        (    
                             SUMMARY_DT
                            ,SCENARIO
                            ,TOTAL_CNT
                            ,SUCCESS_CNT
                            ,FAIL_CNT
                            ,RGST_ID
                            ,RGST_DTM
                        )
                      VALUES
                        (
                             CNTT.summaryDt
                            ,CNTT.SCENARIO
                            ,CNTT.totalCnt
                            ,CNTT.successCnt
                            ,CNTT.failCnt
                            ,'BATCH'
                            ,SYSDATE
                         )





-- 查询一个月的服务使用数 

select  'ACN',sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and scenario like  ('%G2ACN-A%')

union all

select  'SOS',sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and scenario like  ('%SOS-A%')

union all

select  'POI',sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario  in ('G2POI-A','POI-A','POI-C')


union all

select  'ARM',sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and scenario like '%ARM%'

union all

select 'RSC', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and  scenario  in ('G2RSC-B','G2RSC-D','G2RSC-C')

union all

select 'RDO', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario  like  ('%RDO%') 

union all

select 'RHL', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario  like  ('%RHL%') 

union all

select 'RFC', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario  like  ('%RFC%') 

union all

select 'RTO', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario  like  ('%RTO%') 


union all

select 'RVS', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario  like  ('%RVS%')   AND scenario <> 'G2RVS-V'

union all

select 'EVC', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario = 'EVC-A'

union all

select 'GIS', sum(total_cnt),ROUND(sum(success_cnt)/sum(total_cnt) ,2) * 100||'%' as failPercent 
from bt_svc_summary 
where SUMMARY_DT >=  '20210201' and  SUMMARY_DT < '20210301'
and    scenario  like  ('%GIS-A%')   


 
-- 查询 PCS 服务
select * from BT_TRANSACTION a,BT_SCEN_TRAN b
where a.tid = b.tid 
and a.start_time  BETWEEN TO_DATE('2020-08-27 08:50:00', 'YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2020-08-27 08:55:00', 'YYYY-MM-DD HH24:MI:SS')
and b.header like '%d1330bdd-0ec2-4f85-b12b-2b9561f453df%'
and a.SCENARIO = 'PCS-C'

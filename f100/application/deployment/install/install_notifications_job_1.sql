prompt --application/deployment/install/install_notifications_job
begin
--   Manifest
--     INSTALL: INSTALL-Notifications job
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(21255672822555264251)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'Notifications job'
,p_sequence=>910
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    sys.dbms_scheduler.create_job    ',
'     (job_name        => ''SP_NOTIF_SUBSCRIPTIONS'',',
'      job_type        => ''STORED_PROCEDURE'',',
'      job_action      => ''SP_STRATEGIC_PROJ_UTIL.SEND_NOTIF_SUBSCRIPTIONS'',',
'      start_date      => systimestamp,',
'      repeat_interval => ''FREQ=DAILY; BYDAY=MON,TUE,WED,THU,FRI; BYHOUR=8; BYMINUTE=0;'',',
'      enabled         => true,',
'      auto_drop       => false);',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/

prompt --application/deployment/install/install_app_log
begin
--   Manifest
--     INSTALL: INSTALL-app_log
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
 p_id=>wwv_flow_imp.id(15484196867504169975)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'app_log'
,p_sequence=>60
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_app_log (',
'    id                     number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                           constraint sp_app_log_pk primary key,',
'    --',
'    activity               varchar2(255 char)  not null,',
'    details                varchar2(4000 char),',
'    --',
'    created                date not null,',
'    created_trunc          date not null,',
'    created_by             varchar2(255 char) not null',
'   )',
'/',
'create index sp_app_log_i1',
'   on sp_app_log (created_trunc);',
'',
'create or replace trigger sp_app_log_bi',
'   before insert on sp_app_log',
'   for each row',
'begin',
'   :new.created       := sysdate;',
'   :new.created_trunc := trunc(sysdate);',
'   :new.created_by    := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end sp_app_log_bi;',
'/'))
);
wwv_flow_imp.component_end;
end;
/

prompt --application/deployment/install/install_default_tags_table
begin
--   Manifest
--     INSTALL: INSTALL-default tags table
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
 p_id=>wwv_flow_imp.id(12002436865997924453)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'default tags table'
,p_sequence=>80
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table SP_DEFAULT_TAGS (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint SP_DEFAULT_TAGS_pk primary key,',
'    display_sequence               number            not null,',
'    tag                            varchar2(30 char) not null,',
'    description                    varchar2(512 char),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create unique index SP_DEFAULT_TAGS_u1 on SP_DEFAULT_TAGS (tag);'))
);
wwv_flow_imp.component_end;
end;
/

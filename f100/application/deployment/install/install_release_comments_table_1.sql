prompt --application/deployment/install/install_release_comments_table
begin
--   Manifest
--     INSTALL: INSTALL-release comments table
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
 p_id=>wwv_flow_imp.id(18323070541835839835)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'release comments table'
,p_sequence=>280
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_release_comments (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_release_comments_id_pk primary key,',
'    row_version                    integer',
'                                   default 1,',
'    release_id                     number',
'                                   constraint sp_release_comm_proj_id_fk',
'                                   references SP_RELEASE_TRAINS on delete cascade,',
'    --',
'    body                           clob,',
'    body_html                      clob,',
'    author_id                      number,',
'    PRIVATE_YN                     varchar2(1 char),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create index sp_release_comments_i1 on sp_release_comments (release_id);',
'create index sp_release_comments_i2 on sp_release_comments (author_id);',
''))
);
wwv_flow_imp.component_end;
end;
/

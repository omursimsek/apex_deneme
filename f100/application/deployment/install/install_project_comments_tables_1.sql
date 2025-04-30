prompt --application/deployment/install/install_project_comments_tables
begin
--   Manifest
--     INSTALL: INSTALL-project comments tables
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
 p_id=>wwv_flow_imp.id(12003919529992085449)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'project comments tables'
,p_sequence=>270
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'---',
'--- Project Comments',
'---',
'',
'create table sp_project_comments (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_project_comments_id_pk primary key,',
'    row_version                    integer',
'                                   default 1,',
'    project_id                     number',
'                                   constraint sp_project_comm_proj_id_fk',
'                                   references sp_projects on delete cascade,',
'    component_id                   number,',
'    body                           clob,',
'    body_html                      clob,',
'    comment_on                     varchar2(50 char)',
'                                   constraint sp_project_comment_on_ck',
'                                   check (comment_on in (''PROJECT'',''TODO'',''DOCUMENT'')),',
'    publish_yn                     varchar2(1 char)',
'                                   default on null ''Y''',
'                                   constraint sp_project_comm_pub_ck',
'                                   check (publish_yn in (''Y'',''N'')),',
'    private_yn                     varchar2(1 char)',
'                                   default on null ''Y''',
'                                   constraint sp_project_comm_private_ck',
'                                   check (private_yn in (''Y'',''N'')),',
'    author_app_user                varchar2(255 char),',
'    author_id                      number,',
'    author                         varchar2(255 char),',
'    content_flag_status            varchar2(30 char),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create index sp_project_comments_i1 on sp_project_comments (project_id);',
'create index sp_project_comments_i2 on sp_project_comments (author_id);',
'create index sp_project_comments_i3 on sp_project_comments (updated);',
'',
'create table sp_project_comments_emails (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_proj_comment_em_id_pk primary key,',
'    comment_id                     number',
'                                   constraint sp_proj_comment_em_id_fk',
'                                   references sp_project_comments (id)',
'                                   on delete cascade,',
'    email                          varchar2(255 char)',
');',
'',
'create index sp_project_comm_emails_i1 on sp_project_comments_emails (comment_id);',
'create index sp_project_comm_emails_i2 on sp_project_comments_emails (email);'))
);
wwv_flow_imp.component_end;
end;
/

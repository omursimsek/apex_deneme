prompt --application/deployment/install/install_app_pages_table
begin
--   Manifest
--     INSTALL: INSTALL-app pages table
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
 p_id=>wwv_flow_imp.id(12003005709643344192)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'app pages table'
,p_sequence=>290
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_app_pages (',
'    PAGE_ID	                       number,',
'    PAGE_NAME	                   varchar2(255 char),',
'    PAGE_TITLE	                   varchar2(255 char),',
'    PAGE_ALIAS	                   varchar2(255 char),',
'    PAGE_REQUIRES_AUTHENTICATION   varchar2(255 char),',
'    BUILD_OPTION	               varchar2(255 char),',
'    AUTHORIZATION_SCHEME	       varchar2(255 char),',
'    TITLE_CUSTOMIZABLE	           varchar2(255 char),',
'    PAGE_GROUP	                   varchar2(255 char),',
'    PAGE_MODE	                   varchar2(255 char),',
'    PAGE_TEMPLATE	               varchar2(255 char),',
'    JAVASCRIPT	                   varchar2(255 char),',
'    CSS	                           varchar2(255 char),',
'    PAGE_ACCESS_PROTECTION         varchar2(255 char),',
'    PAGE_FUNCTION                  varchar2(255 char),',
'    created_on                     date,',
'    LAST_UPDATED_ON                date',
');',
''))
);
wwv_flow_imp.component_end;
end;
/

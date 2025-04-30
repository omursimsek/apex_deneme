prompt --application/deployment/install/install_seed_settings
begin
--   Manifest
--     INSTALL: INSTALL-seed settings
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
 p_id=>wwv_flow_imp.id(21255652552814259377)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'seed settings'
,p_sequence=>860
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    sp_strategic_proj_util.add_setting (  ',
'        p_static_id     => ''APP_ID'',   ',
'        p_description   => ''Application ID of the application.  Used by summary jobs.'', ',
'        p_setting_value => null, ',
'        p_is_numeric_yn => ''Y'', ',
'        p_is_yn         => ''N'' );',
'    sp_strategic_proj_util.add_setting (  ',
'        p_static_id     => ''APP_PREFIX_URL'',   ',
'        p_description   => ''Prefix URL of the application.  Used for link creation in summary jobs.'', ',
'        p_setting_value => null, ',
'        p_is_numeric_yn => ''N'', ',
'        p_is_yn         => ''N'' );',
'    sp_strategic_proj_util.add_setting (  ',
'        p_static_id     => ''APP_HOME_URL'',   ',
'        p_description   => ''Full URL to the home page of the application.  Used for home link in summary emails.'', ',
'        p_setting_value => null, ',
'        p_is_numeric_yn => ''N'', ',
'        p_is_yn         => ''N'' );',
'',
'    -- most recent install of Strategic Planner',
'    --',
'    for a in (',
'        select application_id',
'          from apex_applications',
'         where application_name = ''Strategic Planner''',
'         order by last_updated_on desc',
'    ) loop',
'        sp_strategic_proj_util.set_setting (p_static_id     => ''APP_ID'',   ',
'                                            p_setting_value => a.application_id); ',
'    end loop;',
'',
'    sp_strategic_proj_util.set_setting (p_static_id     => ''APP_PREFIX_URL'',   ',
'                                        p_setting_value => APEX_UTIL.HOST_URL); ',
'end;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/

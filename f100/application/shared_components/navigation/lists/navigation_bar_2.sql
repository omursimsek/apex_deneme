prompt --application/shared_components/navigation/lists/navigation_bar
begin
--   Manifest
--     LIST: Navigation Bar
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(149556926427158434395)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
,p_version_scn=>41590305656892
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(16346861534622385646)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Recent Projects'
,p_list_item_icon=>'fa-folder-clock'
,p_list_text_02=>'icon-only'
,p_list_item_current_type=>'TARGET_PAGE'
,p_sub_list_id=>wwv_flow_imp.id(16346692237858687786)
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14052328710378409438)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Alerts'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:::'
,p_list_item_icon=>'fa-bell'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_team_member_notifications',
' where team_member_id = :APP_USER_ID',
'   and dismissed_yn = ''N''',
'   and instr('':''||notification_pref||'':'','':APP:'') > 0'))
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14058536454113959055)
,p_list_item_display_sequence=>11
,p_list_item_link_text=>'Alerts'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:::'
,p_list_item_icon=>'fa-bell-o'
,p_list_item_disp_cond_type=>'NOT_EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_team_member_notifications',
' where team_member_id = :APP_USER_ID',
'   and dismissed_yn = ''N''',
'   and instr('':''||notification_pref||'':'','':APP:'') > 0',
'union all',
'select 1',
'  from dual',
' where :APP_USER_ID is null'))
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(149556992449722435118)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14674303493506325544)
,p_list_item_display_sequence=>12
,p_list_item_link_text=>'My Profile'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP:P5_ID:&APP_USER_ID.:'
,p_list_item_icon=>'fa-user'
,p_list_item_disp_cond_type=>'ITEM_IS_NOT_NULL'
,p_list_item_disp_condition=>'APP_USER_ID'
,p_parent_list_item_id=>wwv_flow_imp.id(149556992449722435118)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14322993616246848041)
,p_list_item_display_sequence=>12
,p_list_item_link_text=>'My Subscriptions'
,p_list_item_link_target=>'f?p=&APP_ID.:139:&SESSION.::&DEBUG.:139:::'
,p_list_item_icon=>'fa-sliders'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':APP_USER_ID is not null and',
'apex_util.get_build_option_status (',
'    p_application_id    => :APP_ID,',
'    p_build_option_name => ''Email Configured'') = ''INCLUDE'' and',
'apex_util.get_build_option_status (',
'    p_application_id    => :APP_ID,',
'    p_build_option_name => ''Subscriptions'') = ''INCLUDE'''))
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(149556992449722435118)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(12364663426470421800)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'About this App'
,p_list_item_link_target=>'f?p=&APP_ID.:10820:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-info'
,p_parent_list_item_id=>wwv_flow_imp.id(149556992449722435118)
,p_required_patch=>wwv_flow_imp.id(12364451874652416490)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13907181917427630627)
,p_list_item_display_sequence=>75
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:10000:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-users'
,p_parent_list_item_id=>wwv_flow_imp.id(149556992449722435118)
,p_security_scheme=>wwv_flow_imp.id(149556930433130434424)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(149556992983805435119)
,p_list_item_display_sequence=>78
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(149556992449722435118)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(149556993417859435119)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_imp.id(149556992449722435118)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18418249024874240312)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:12120:&SESSION.::&DEBUG.:12120:P12120_PAGE_ID:&APP_PAGE_ID.:'
,p_list_item_icon=>'fa-comment-o'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'apex_util.feedback_enabled'
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_02=>'icon-only'
,p_security_scheme=>wwv_flow_imp.id(149556930485430434424)
,p_required_patch=>wwv_flow_imp.id(18418211303568240240)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

prompt --application/shared_components/navigation/lists/admin_configuration
begin
--   Manifest
--     LIST: Admin - Configuration
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
 p_id=>wwv_flow_imp.id(149567939091609935730)
,p_name=>'Admin - Configuration'
,p_list_status=>'PUBLIC'
,p_version_scn=>41662437905472
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18200220318188841397)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Nomenclature'
,p_list_item_link_target=>'f?p=&APP_ID.:10400:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-external-link-square'
,p_list_text_01=>'Configure application name and labels of primary attribute names'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18630788091877537064)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Configure Application Features'
,p_list_item_link_target=>'f?p=&APP_ID.:12130:&SESSION.::&DEBUG.:RP,12130:::'
,p_list_item_icon=>'fa-sliders'
,p_list_text_01=>'Enable and disable application features'
,p_required_patch=>wwv_flow_imp.id(18464647985472733381)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21466708665721468715)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Application Settings'
,p_list_item_link_target=>'f?p=&APP_ID.:12150:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-forms'
,p_list_text_01=>'Provide value for application settings such as Application home url (used in emails)'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14693683442503546243)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Configure External Person Link'
,p_list_item_link_target=>'f?p=&APP_ID.:12140:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user-magnifying-glass'
,p_list_text_01=>'Setup link to provide more detail about the &NOMENCLATURE_USERS. defined in this application'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14707595706135975324)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'External &NOMENCLATURE_PROJECT. Links'
,p_list_item_link_target=>'f?p=&APP_ID.:10750:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-external-link'
,p_list_text_01=>'Define links to external systems based on &NOMENCLATURE_PROJECT. naming'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(12526232480019863522)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'About Page Text'
,p_list_item_link_target=>'f?p=&APP_ID.:14000:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-info'
,p_list_text_01=>'Contents displayed on the About this App page'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(25747165827770834344)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Delete Sample Data'
,p_list_item_link_target=>'f?p=&APP_ID.:14010:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-trash-o'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from SP_AREAS',
' where id in (1,2)',
'union all',
'select 1',
'  from SP_INITIATIVES',
' where id in (1,2,3)',
'union all',
'select 1',
'  from SP_PROJECTS',
' where id in (1,2,3,4,5,6)',
'union all',
'select 1',
'  from sp_activities',
' where id in (1,2,3)',
'union all',
'select 1',
'  from sp_release_trains',
' where id in (1,2)',
'union all',
'select 1',
'  from SP_TEAM_MEMBERS',
' where id in (1,2,3)'))
,p_list_text_01=>'Remove the sample data that installs with this application'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

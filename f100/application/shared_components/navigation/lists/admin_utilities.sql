prompt --application/shared_components/navigation/lists/admin_utilities
begin
--   Manifest
--     LIST: Admin - Utilities
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
 p_id=>wwv_flow_imp.id(21588736681956107525)
,p_name=>'Admin - Utilities'
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21856012581528320365)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Manage Archived Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:11300:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-gear'
,p_list_text_01=>'Only administrators can remove &NOMENCLATURE_PROJECTS., use this utility to permanently remove content.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(24318178570210432989)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Manage Duplicate Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:11320:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-gear'
,p_list_text_01=>'Only administrators can remove &NOMENCLATURE_PROJECTS., use this utility to permanently remove content.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

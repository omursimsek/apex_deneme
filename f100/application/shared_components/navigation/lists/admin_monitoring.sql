prompt --application/shared_components/navigation/lists/admin_monitoring
begin
--   Manifest
--     LIST: Admin - Monitoring
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
 p_id=>wwv_flow_imp.id(18391320775605969267)
,p_name=>'Admin - Monitoring'
,p_list_status=>'PUBLIC'
,p_version_scn=>44459007674006
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13767756088504384902)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_text_01=>'Application page view details'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13768197759809820491)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Page Performance'
,p_list_item_link_target=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_text_01=>'Application page view details'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13779506094069449950)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Page Views by User'
,p_list_item_link_target=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_text_01=>'Application page view details'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23671281266880832660)
,p_list_item_display_sequence=>35
,p_list_item_link_text=>'Interactions by User'
,p_list_item_link_target=>'f?p=&APP_ID.:610:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-edit'
,p_list_text_01=>'Log of user interactions'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18391320978495969272)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Application Pages'
,p_list_item_link_target=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_text_01=>'Information about the pages and functionality of this application'
,p_required_patch=>wwv_flow_imp.id(20198787690630337545)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(33981276822563446611)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Email Reporting'
,p_list_item_link_target=>'f?p=&APP_ID.:16020:&SESSION.::&DEBUG.:16020:::'
,p_list_item_icon=>'fa-envelope-chart'
,p_list_text_01=>'Report of all email queued to be sent and those already sent'
,p_required_patch=>wwv_flow_imp.id(27063355719221060172)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(33200977466742814816)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Job Reporting'
,p_list_item_link_target=>'f?p=&APP_ID.:16010:&SESSION.::&DEBUG.:16010:::'
,p_list_item_icon=>'fa-user-chart'
,p_list_text_01=>'View status and run details of jobs supporting this application'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(15700349380737697030)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Application Log'
,p_list_item_link_target=>'f?p=&APP_ID.:10050:&SESSION.::&DEBUG.:10050:::'
,p_list_item_icon=>'fa-table-wrench'
,p_list_text_01=>'Log of all changes to administrative data (users, settings, valid values)'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

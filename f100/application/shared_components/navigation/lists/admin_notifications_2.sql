prompt --application/shared_components/navigation/lists/admin_notifications
begin
--   Manifest
--     LIST: Admin - Notifications
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
 p_id=>wwv_flow_imp.id(14321046985501550591)
,p_name=>'Admin - Notifications'
,p_list_status=>'PUBLIC'
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14711077645551363305)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home Page Messages'
,p_list_item_link_target=>'f?p=&APP_ID.:10770:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-bell-o'
,p_list_text_01=>'Application home page messages'
,p_list_text_02=>'&P10000_SYSTEM_NOTIFICATIONS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14321047232064550593)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Notifications'
,p_list_item_link_target=>'f?p=&APP_ID.:10074:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bullhorn'
,p_list_text_01=>'Manage available notifications that team members can subscribe to'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14321047605583550594)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Subscriptions'
,p_list_item_link_target=>'f?p=&APP_ID.:16015:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-envelope-user'
,p_list_text_01=>'View and manage which team members are subscribed to a given notification'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

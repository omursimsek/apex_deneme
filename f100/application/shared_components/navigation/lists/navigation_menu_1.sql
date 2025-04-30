prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
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
 p_id=>wwv_flow_imp.id(149556631909807434110)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>44455902231531
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(149556936032791434470)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(122198226576539539013)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'&NOMENCLATURE_AREAS. [&P1_AREAS.]'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-folder-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'17,9'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(122201138739260899922)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'&NOMENCLATURE_INITIATIVES. [&P1_INITIATIVES.]'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-lightbulb-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'21,66,94,53,160,164,11,33,57,59,62,68'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(122201266924402636009)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'&NOMENCLATURE_PROJECTS. [&P1_PROJECTS.]'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-package'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3,23,300,113,64,29,30,502,507,505,160,60,116,121'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(17741114860566147531)
,p_list_item_display_sequence=>45
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Groups [&P1_PROJECT_GROUPS.]'
,p_list_item_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-package'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(24487684644716462223)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Activities [&P1_ACTIVITIES.]'
,p_list_item_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-badge-check'
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'96,102'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(42133626628670936212)
,p_list_item_display_sequence=>77
,p_list_item_link_text=>'Releases [&P1_RELEASES.]'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-ship'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'63,77,38,76,8,117,200,201,202,42,69'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(149576859334451127679)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'&NOMENCLATURE_USERS. [&P1_PEOPLE.]'
,p_list_item_link_target=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5,19,20,74,61'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19354625572745563498)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'&NOMENCLATURE_USERS. Groups [&P1_GROUPS.]'
,p_list_item_link_target=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'150,151,152,103'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20350044956735582502)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'41,14,46,31,78,7,55,45,51,86,26,500,79,4,80,81,89,15,91,111,122'
);
wwv_flow_imp.component_end;
end;
/

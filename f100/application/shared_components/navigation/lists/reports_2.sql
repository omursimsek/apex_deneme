prompt --application/shared_components/navigation/lists/reports
begin
--   Manifest
--     LIST: Reports
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
 p_id=>wwv_flow_imp.id(20498051973062230349)
,p_name=>'Reports'
,p_list_status=>'PUBLIC'
,p_version_scn=>44459007311274
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20498254603237230357)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Documents'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_text_01=>'Documents added to the system.  '
,p_list_text_08=>'documents, images'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'14'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(26910219624877848510)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Links'
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-link'
,p_list_text_01=>'Links added to the system.  '
,p_list_text_08=>'documents, images'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(29011337414998232584)
,p_list_item_display_sequence=>17
,p_list_item_link_text=>'Tasks'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard-list'
,p_list_text_01=>'Tasks across all unarchived projects.'
,p_list_text_08=>'documents, images'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(22243709516374539827)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Image Gallery'
,p_list_item_link_target=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-photo'
,p_list_text_01=>'Images over all &NOMENCLATURE_PROJECTS..'
,p_list_text_08=>'images, documents, attachments'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'14'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14157079751167776616)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Change History'
,p_list_item_link_target=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-clock-o'
,p_list_text_01=>'Change reporting across &NOMENCLATURE_INITIATIVES., &NOMENCLATURE_PROJECTS. and Releases.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23672847145632969490)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Comments'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_01=>'All comments added to this system.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23673055003218845808)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Archived &NOMENCLATURE_PROJECTS.'
,p_list_item_link_target=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-package'
,p_list_text_01=>'All &NOMENCLATURE_PROJECTS. that are archived.'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23673079447170849929)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Duplicate &NOMENCLATURE_PROJECTS.'
,p_list_item_link_target=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-copy'
,p_list_text_01=>'All &NOMENCLATURE_PROJECTS. that appear to be duplicates.'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18819892321072318529)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'&NOMENCLATURE_PROJECTS. Interactive Report'
,p_list_item_link_target=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table-arrow-down'
,p_list_text_01=>'Interactive report of &NOMENCLATURE_PROJECTS. that supports download.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11453645853257959958)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Contributors'
,p_list_item_link_target=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_text_01=>'Cross &NOMENCLATURE_PROJECT. Contributor report.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20056111934704359065)
,p_list_item_display_sequence=>191
,p_list_item_link_text=>'&NOMENCLATURE_USERS. Screen Names'
,p_list_item_link_target=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_text_01=>'Shows screen names and tags.  Useful to find and review screen names.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11673709115443434482)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Groups'
,p_list_item_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-package'
,p_list_text_01=>'This report lists all &NOMENCLATURE_PROJECT. Groups with links to drill down to &NOMENCLATURE_PROJECTS. within the Group.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(17027043142164541783)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'Favorited &NOMENCLATURE_PROJECTS. '
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table-heart'
,p_list_text_01=>'Faceted search of favorited &NOMENCLATURE_PROJECTS..'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(17196404280998709792)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Milestone Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar-month'
,p_list_text_01=>'All Project Milestones, filterable by &NOMENCLATURE_INITIATIVE. and if Release Dependent.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

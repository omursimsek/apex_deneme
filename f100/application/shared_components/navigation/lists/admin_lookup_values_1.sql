prompt --application/shared_components/navigation/lists/admin_lookup_values
begin
--   Manifest
--     LIST: Admin - Lookup Values
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
 p_id=>wwv_flow_imp.id(13918148499537538279)
,p_name=>'Admin - Lookup Values'
,p_list_status=>'PUBLIC'
,p_version_scn=>44282221738476
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13918149479787538286)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Activity Types'
,p_list_item_link_target=>'f?p=&APP_ID.:10700:&SESSION.::&DEBUG.:RP,10700:::'
,p_list_item_icon=>'fa-address-card-o'
,p_list_text_01=>'Used to further describe logged activities'
,p_list_text_02=>'&P10000_ACTIVITY_TYPES.'
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(21270046318717930946)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Default Competencies'
,p_list_item_link_target=>'f?p=&APP_ID.:154:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users-alt'
,p_list_text_01=>'Associated with people and displayed under their profile'
,p_list_text_02=>'&P10000_COMPETENCIES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13918149081833538286)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Contributor Roles'
,p_list_item_link_target=>'f?p=&APP_ID.:10600:&SESSION.::&DEBUG.:RP,10600:::'
,p_list_item_icon=>'fa-address-card-o'
,p_list_text_01=>'How a person can be associated with a &NOMENCLATURE_PROJECT.'
,p_list_text_02=>'&P10000_RESOURCE_TYPES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(28969249761806106552)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Team Member Default Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:10520:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tag'
,p_list_text_01=>'Configure default quick picks for tags'
,p_list_text_02=>'&P10000_TEAM_MBR_DEFAULT_TAGS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(35711898913531837850)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Countries'
,p_list_item_link_target=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-globe'
,p_list_text_01=>'Configure default quick picks for tags'
,p_list_text_02=>'&P10000_COUNTRIES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13918148706405538283)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Completeness Scales'
,p_list_item_link_target=>'f?p=&APP_ID.:10200:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-badge-check'
,p_list_text_01=>'Details of available completeness scales (from 0% to 100% in 10% increments) used for &NOMENCLATURE_PROJECTS.'
,p_list_text_02=>'&P10000_PROJECT_STATUS_SCALES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13918149859993538287)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Priorities'
,p_list_item_link_target=>'f?p=&APP_ID.:10800:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-arrows-v'
,p_list_text_01=>'Available &NOMENCLATURE_PROJECT. priorities'
,p_list_text_02=>'&P10000_PROJECT_PRIORITIES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13918151112513538288)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Sizes'
,p_list_item_link_target=>'f?p=&APP_ID.:10100:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users-alt'
,p_list_text_01=>'Sizes for &NOMENCLATURE_PROJECTS. with associated level of effort'
,p_list_text_02=>'&P10000_PROJECT_SIZES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(34908401473457589580)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'&NOMENCLATURE_PROJECT. Default Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:10500:&SESSION.::&DEBUG.:RP,10500:::'
,p_list_item_icon=>'fa-tag'
,p_list_text_01=>'Configure default quick picks for tags'
,p_list_text_02=>'&P10000_DEFAULT_TAGS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13656799127386805558)
,p_list_item_display_sequence=>115
,p_list_item_link_text=>'&NOMENCLATURE_INITIATIVE. Focus Areas'
,p_list_item_link_target=>'f?p=&APP_ID.:10150:&SESSION.::&DEBUG.:RP,10150:::'
,p_list_item_icon=>'fa-user-magnifying-glass'
,p_list_text_01=>'Focus Areas that can be associated with &NOMENCLATURE_PROJECTS. (selection is limited by &NOMENCLATURE_INITIATIVE.)'
,p_list_text_02=>'&P10000_FOCUS_AREAS.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(28570194633641006062)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Task Types'
,p_list_item_link_target=>'f?p=&APP_ID.:10064:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-clipboard-list'
,p_list_text_01=>'Available &NOMENCLATURE_PROJECT. task types'
,p_list_text_02=>'&P10000_TASK_TYPES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(28570483972872025687)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Task Statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:10061:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-wizard'
,p_list_text_01=>'Available status for tasks'
,p_list_text_02=>'&P10000_TASK_STATUSES.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(16421937141674835997)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Release Milestone Types'
,p_list_item_link_target=>'f?p=&APP_ID.:10090:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-clipboard-check-alt'
,p_list_text_01=>'Used to describe Release Milestones'
,p_list_text_02=>'&P10000_REL_MILESTONE_TYPES.'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

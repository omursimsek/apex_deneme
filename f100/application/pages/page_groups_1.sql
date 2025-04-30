prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18412433224561085883)
,p_group_name=>'About App'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(11645820339639305861)
,p_group_name=>'Activities'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(149556931645203434433)
,p_group_name=>'Administration'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(21590763575045163414)
,p_group_name=>'Administrative Utilities'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18401309457965233045)
,p_group_name=>'Areas'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18402417437047246494)
,p_group_name=>'Documents Cross-Project'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18418772693780676862)
,p_group_name=>'Feedback'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(20452810691500035245)
,p_group_name=>'Groups'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18401675290987813527)
,p_group_name=>'Home'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18401340157312233831)
,p_group_name=>'Initiatives'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18412886493613538983)
,p_group_name=>'Login'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18401344032431234424)
,p_group_name=>'Projects'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18408991141620412394)
,p_group_name=>'Releases'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(21103783134283959393)
,p_group_name=>'Reporting'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(18401355622061234923)
,p_group_name=>'Users'
);
wwv_flow_imp.component_end;
end;
/

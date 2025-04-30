prompt --application/shared_components/navigation/lists/feedback
begin
--   Manifest
--     LIST: Feedback
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
 p_id=>wwv_flow_imp.id(18418249319370240314)
,p_name=>'Feedback'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(18418211303568240240)
,p_version_scn=>1
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18418249731778240315)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'User Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:12123:&APP_SESSION.::&DEBUG.:12123::'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_01=>'Report of all feedback submitted by application users'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/

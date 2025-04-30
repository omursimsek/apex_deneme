prompt --application/shared_components/user_interface/lovs/email_alert_pref
begin
--   Manifest
--     EMAIL_ALERT_PREF
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(14308827217556491844)
,p_lov_name=>'EMAIL_ALERT_PREF'
,p_lov_query=>'.'||wwv_flow_imp.id(14308827217556491844)||'.'
,p_location=>'STATIC'
,p_version_scn=>42183413345495
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(14308827539583491847)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Within Application'
,p_lov_return_value=>'APP'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(14308827860784491848)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Email'
,p_lov_return_value=>'EMAIL'
,p_required_patch=>wwv_flow_imp.id(27063355719221060172)
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(14308828287112491849)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'None'
,p_lov_return_value=>'NONE'
);
wwv_flow_imp.component_end;
end;
/

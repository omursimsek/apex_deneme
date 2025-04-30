prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(14691364206704356126)
,p_name=>'EXTERNAL_PERSON_LINK'
,p_value=>'http://people.oracle.com/@#EMAIL#'
,p_is_required=>'N'
,p_comments=>'link with #EMAIL# substitution to provide a link to more details - only if the email domain matches that within EXTERNAL_PERSON_LINK_DOMAIN'
,p_version_scn=>41537612306125
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(14691385668457360811)
,p_name=>'EXTERNAL_PERSON_LINK_DOMAIN'
,p_value=>'oracle.com'
,p_is_required=>'N'
,p_comments=>'if the email of a "person" uses this domain, the EXTERNAL_PERSON_LINK will be used to show a link to more details'
,p_version_scn=>41537612306171
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(18418211596539240243)
,p_name=>'FEEDBACK_ATTACHMENTS_YN'
,p_value=>'Y'
,p_is_required=>'N'
,p_valid_values=>'Y, N'
,p_on_upgrade_keep_value=>true
,p_required_patch=>wwv_flow_imp.id(18418211303568240240)
,p_version_scn=>1
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(19670602087078040360)
,p_name=>'ACCESS_CONTROL_SCOPE'
,p_value=>'ACL_ONLY'
,p_is_required=>'N'
,p_valid_values=>'ACL_ONLY, ALL_USERS'
,p_on_upgrade_keep_value=>true
,p_required_patch=>wwv_flow_imp.id(149556928703600434420)
,p_comments=>'The default access level given to authenticated users who are not in the access control list'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/

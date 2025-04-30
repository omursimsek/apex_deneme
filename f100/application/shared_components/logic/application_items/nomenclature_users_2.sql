prompt --application/shared_components/logic/application_items/nomenclature_users
begin
--   Manifest
--     APPLICATION ITEM: NOMENCLATURE_USERS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(18459203068252956224)
,p_name=>'NOMENCLATURE_USERS'
,p_protection_level=>'I'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/

prompt --application/shared_components/logic/application_items/is_admin
begin
--   Manifest
--     APPLICATION ITEM: IS_ADMIN
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
 p_id=>wwv_flow_imp.id(28417929308645880081)
,p_name=>'IS_ADMIN'
,p_protection_level=>'I'
,p_version_scn=>42076101876867
);
wwv_flow_imp.component_end;
end;
/

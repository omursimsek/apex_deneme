prompt --application/shared_components/logic/application_items/complete_task_status_ids
begin
--   Manifest
--     APPLICATION ITEM: COMPLETE_TASK_STATUS_IDS
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
 p_id=>wwv_flow_imp.id(28712832638107352897)
,p_name=>'COMPLETE_TASK_STATUS_IDS'
,p_protection_level=>'I'
,p_version_scn=>41350754188738
);
wwv_flow_imp.component_end;
end;
/

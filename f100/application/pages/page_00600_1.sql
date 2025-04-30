prompt --application/pages/page_00600
begin
--   Manifest
--     PAGE: 00600
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_page.create_page(
 p_id=>600
,p_name=>'Project Interactions'
,p_alias=>'PROJECT-INTERACTIONS'
,p_page_mode=>'MODAL'
,p_step_title=>'&NOMENCLATURE_PROJECT. Interactions'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(22211880400636173009)
,p_name=>'&NOMENCLATURE_PROJECT. Interactions'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select app_user, ',
'       count(*) interactions, ',
'       min(page_rendered) first_interaction,',
'       max(page_rendered) last_interaction',
'from   sp_proj_interactions_log',
'where  project_id = :P600_PROJECT_ID',
'group  by app_user',
'order by 4 desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(22614101657102099314)
,p_query_column_id=>1
,p_column_alias=>'APP_USER'
,p_column_display_sequence=>30
,p_column_heading=>'User'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(22211880800766173013)
,p_query_column_id=>2
,p_column_alias=>'INTERACTIONS'
,p_column_display_sequence=>20
,p_column_heading=>'Interactions'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(22614101815822099315)
,p_query_column_id=>3
,p_column_alias=>'FIRST_INTERACTION'
,p_column_display_sequence=>40
,p_column_heading=>'First Interaction'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(22614101925672099316)
,p_query_column_id=>4
,p_column_alias=>'LAST_INTERACTION'
,p_column_display_sequence=>50
,p_column_heading=>'Last Interaction'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22211882556032173031)
,p_plug_name=>'button_bar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_required_role=>wwv_flow_imp.id(149556930433130434424)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22211882450888173030)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(22211882556032173031)
,p_button_name=>'view_details'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--noUI:t-Button--iconLeft:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Details'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:610:&SESSION.::&DEBUG.:RP,:P610_PROJECT_ID:&P600_PROJECT_ID.'
,p_icon_css_classes=>'fa-glasses'
,p_security_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22211880521645173010)
,p_name=>'P600_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22211880400636173009)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/

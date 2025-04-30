prompt --application/pages/page_10210
begin
--   Manifest
--     PAGE: 10210
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
 p_id=>10210
,p_name=>'Project Scale'
,p_alias=>'PROJECT-SCALE'
,p_page_mode=>'MODAL'
,p_step_title=>'Project Scale'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(149556931645203434433)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930433130434424)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(154961276227143747828)
,p_plug_name=>'Project Scale'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_PROJECT_SCALES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(154961293388879747838)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15624556653399267325)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(154961293388879747838)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15624557132548267326)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(154961293388879747838)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'P10210_SCALE_LETTER'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345212502868202)
,p_name=>'P10210_SCALE_LETTER'
,p_source_data_type=>'VARCHAR2'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'Scale Letter'
,p_source=>'SCALE_LETTER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345328418868203)
,p_name=>'P10210_SCALE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'Scale Name'
,p_source=>'SCALE_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345386440868204)
,p_name=>'P10210_IS_ACTIVE_YN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'Active'
,p_source=>'IS_ACTIVE_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345511747868205)
,p_name=>'P10210_PC0_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'0% Complete Label'
,p_source=>'PC0_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345584389868206)
,p_name=>'P10210_PC0_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'0% Complete Description'
,p_source=>'PC0_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345647579868207)
,p_name=>'P10210_PC10_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'10% Complete Label'
,p_source=>'PC10_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345744566868208)
,p_name=>'P10210_PC10_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'10% Complete Description'
,p_source=>'PC10_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345908667868209)
,p_name=>'P10210_PC20_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'20% Complete Label'
,p_source=>'PC20_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624345965954868210)
,p_name=>'P10210_PC20_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'20% Complete Description'
,p_source=>'PC20_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346078935868211)
,p_name=>'P10210_PC30_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'30% Complete Label'
,p_source=>'PC30_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346186282868212)
,p_name=>'P10210_PC30_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'30% Complete Description'
,p_source=>'PC30_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346257903868213)
,p_name=>'P10210_PC40_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'40% Complete Label'
,p_source=>'PC40_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346434013868214)
,p_name=>'P10210_PC40_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'40% Complete Description'
,p_source=>'PC40_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346448768868215)
,p_name=>'P10210_PC50_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'50% Complete Label'
,p_source=>'PC50_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346594267868216)
,p_name=>'P10210_PC50_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'50% Complete Description'
,p_source=>'PC50_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346673520868217)
,p_name=>'P10210_PC60_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'60% Complete Label'
,p_source=>'PC60_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346777741868218)
,p_name=>'P10210_PC60_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'60% Complete Description'
,p_source=>'PC60_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346889232868219)
,p_name=>'P10210_PC70_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'70% Complete Label'
,p_source=>'PC70_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624346995910868220)
,p_name=>'P10210_PC70_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'70% Complete Description'
,p_source=>'PC70_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624347123173868221)
,p_name=>'P10210_PC80_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'80% Complete Label'
,p_source=>'PC80_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624347200553868222)
,p_name=>'P10210_PC80_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'80% Complete Description'
,p_source=>'PC80_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624347275211868223)
,p_name=>'P10210_PC90_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'90% Complete Label'
,p_source=>'PC90_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624347422560868224)
,p_name=>'P10210_PC90_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'90% Complete Description'
,p_source=>'PC90_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624347444589868225)
,p_name=>'P10210_PC100_LABEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'100% Complete Label'
,p_source=>'PC100_LABEL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15624347632823868226)
,p_name=>'P10210_PC100_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_item_source_plug_id=>wwv_flow_imp.id(154961276227143747828)
,p_prompt=>'100% Complete Description'
,p_source=>'PC100_DESC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(15710429919340752017)
,p_validation_name=>'all pct complete labels provided'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P10210_PC0_LABEL is not null and',
':P10210_PC10_LABEL is not null and',
':P10210_PC20_LABEL is not null and',
':P10210_PC30_LABEL is not null and',
':P10210_PC40_LABEL is not null and',
':P10210_PC50_LABEL is not null and',
':P10210_PC60_LABEL is not null and',
':P10210_PC70_LABEL is not null and',
':P10210_PC80_LABEL is not null and',
':P10210_PC90_LABEL is not null and',
':P10210_PC100_LABEL is not null'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Scale cannot be active without all Percent Complete labels provided.'
,p_validation_condition=>'P10210_IS_ACTIVE_YN'
,p_validation_condition2=>'Y'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(15624557132548267326)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15624561633299267334)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(15624556653399267325)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15624562052177267335)
,p_event_id=>wwv_flow_imp.id(15624561633299267334)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15624555556167267324)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(154961276227143747828)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed'
,p_internal_uid=>5390501215020762924
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15624561146800267333)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>5390506805653762933
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15624555233105267323)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(154961276227143747828)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form'
,p_internal_uid=>5390500891958762923
);
wwv_flow_imp.component_end;
end;
/

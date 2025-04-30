prompt --application/pages/page_00024
begin
--   Manifest
--     PAGE: 00024
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
 p_id=>24
,p_name=>'Project'
,p_alias=>'PROJECT'
,p_page_mode=>'MODAL'
,p_step_title=>'&NOMENCLATURE_PROJECT.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930589415434424)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(149599478618462020692)
,p_plug_name=>'Project'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_PROJECTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13732076052854739629)
,p_plug_name=>'Advanced'
,p_parent_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(149599488706158020712)
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
 p_id=>wwv_flow_imp.id(11571029687440681732)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(149599488706158020712)
,p_button_name=>'Previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Previous'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P24_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149599489138120020712)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(149599488706158020712)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149599490912468020715)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(149599488706158020712)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P24_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149599491293547020715)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(149599488706158020712)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add &NOMENCLATURE_PROJECT.'
,p_button_position=>'NEXT'
,p_button_condition=>'P24_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10300343133514735336)
,p_name=>'P24_PROJECT_SIZE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_default=>'M'
,p_prompt=>'Size'
,p_source=>'PROJECT_SIZE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project_size d, project_size r ',
'from sp_project_sizes ps',
'where include_yn = ''Y''',
'order by EFFORT_DAYS'))
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>'&P24_SIZE_HELP_TEXT!RAW.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '8',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11137835282588223112)
,p_name=>'P24_PROJECT_GROUP_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(13732076052854739629)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'&NOMENCLATURE_PROJECT.  Group'
,p_source=>'PROJECT_GROUP_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select group_name, id ',
'from sp_project_groups',
'order by 1'))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11480129252707703221)
,p_name=>'P24_RECENT_INITIATIVE_NAME'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11480129395654703222)
,p_name=>'P24_RECENT_INITIATIVE_ID'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11587034823401630817)
,p_name=>'P24_DOC_IMPACT_YN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_default=>'N'
,p_prompt=>'Doc Impact'
,p_source=>'DOC_IMPACT_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_help_text=>'Indicates if a &NOMENCLATURE_PROJECT. impacts documentation.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11754074359858819408)
,p_name=>'P24_CLOSE_DIALOG'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13381498374825937036)
,p_name=>'P24_STATUS_SCALE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13732076052854739629)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Status Scale'
,p_source=>'STATUS_SCALE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select scale_name, scale_letter',
'from sp_project_scales',
'where is_active_yn = ''Y''',
'order by scale_letter'))
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '5',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13628144458913228408)
,p_name=>'P24_FOCUS_AREA_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Focus Area'
,p_source=>'FOCUS_AREA_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select focus_area, id',
'  from sp_initiative_focus_areas',
' where initiative_id = :P24_INITIATIVE_ID',
'   and (active_yn = ''Y'' or id = :P24_FOCUS_AREA_ID)',
' order by 1'))
,p_lov_cascade_parent_items=>'P24_INITIATIVE_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_initiative_focus_areas',
' where initiative_id = :P24_INITIATIVE_ID',
'   and (active_yn = ''Y'' or id = :P24_FOCUS_AREA_ID)'))
,p_display_when_type=>'EXISTS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14331411905911820634)
,p_name=>'P24_EXTERNAL_TICKET_IDENTIFIER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13732076052854739629)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_default=>'select regexp_substr(project,''(\d){4}+'') ticket_number from sp_projects where id = :P24_ID'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'External Identifier'
,p_source=>'EXTERNAL_TICKET_IDENTIFIER'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>128
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
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
 p_id=>wwv_flow_imp.id(14331412195445820637)
,p_name=>'P24_EXTERNAL_TICKET_SYSTEM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13732076052854739629)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'External System'
,p_source=>'EXTERNAL_TICKET_SYSTEM'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select external_system_name d, external_system_name r',
'from   SP_EXTERNAL_TICKETING_SYSTEMS',
'where is_active_yn = ''Y'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15995372380893820934)
,p_name=>'P24_SIZE_HELP_TEXT'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16496911511734286412)
,p_name=>'P24_DISPLAY_EXTERNAL_LINK_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13732076052854739629)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_default=>'Y'
,p_prompt=>'Display External Link'
,p_source=>'DISPLAY_EXTERNAL_LINK_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21062911322657426617)
,p_name=>'P24_LINK'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when=>'P24_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22349829530592897832)
,p_name=>'P24_REQUIRES_REVIEWS_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_default=>'Y'
,p_prompt=>'Requires Reviews'
,p_source=>'REQUIRES_REVIEWS_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
,p_help_text=>'Indicates if a &NOMENCLATURE_PROJECT. requires reviews.  If yes, the &NOMENCLATURE_PROJECT. will be flagged in exception reports if there are no reviewers assigned.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24929238976977914227)
,p_name=>'P24_LINK_NAME'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Link Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_display_when=>'P24_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39439414470925024023)
,p_name=>'P24_DEF_INITIATIVE_ID'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41547356610794037101)
,p_name=>'P24_DESCRIPTION'
,p_source_data_type=>'CLOB'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_display_when=>'P24_ID'
,p_display_when_type=>'ITEM_IS_NULL'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'Y',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(122188979299235142967)
,p_name=>'P24_RELEASE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Release'
,p_source=>'RELEASE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'RELEASES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       id,',
'       RELEASE_TRAIN||'' ''||release release,',
'       to_char(release_open_date,''YYYY.MM.DD'')||'' - ''||',
'       to_char(release_target_date,''YYYY.MM.DD'') window',
'from SP_RELEASE_TRAINS',
'order by release_target_date'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149564424190974487701)
,p_name=>'P24_INITIATIVE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'&NOMENCLATURE_INITIATIVE.'
,p_source=>'INITIATIVE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.initiative area_initiative,',
'       i.id initiative_id',
'from sp_initiatives i, sp_areas a',
'where i.area_id = a.id',
'order by 2, 1'))
,p_cSize=>30
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599478862585020693)
,p_name=>'P24_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599479248252020697)
,p_name=>'P24_PROJECT'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'&NOMENCLATURE_PROJECT.'
,p_source=>'PROJECT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599479673004020698)
,p_name=>'P24_OWNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Owner'
,p_source=>'OWNER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'SP_TEAM_MEMBERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name||'', ''||first_name||'' (''||lower(email)||'')'' d, id r',
'from SP_TEAM_MEMBERS',
'order by 1'))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599480043579020700)
,p_name=>'P24_TARGET_COMPLETE'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Target Complete'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'TARGET_COMPLETE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', '2',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599480443312020701)
,p_name=>'P24_PCT_COMPLETE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_default=>'10'
,p_prompt=>'Completeness'
,p_source=>'PCT_COMPLETE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pc0_label ||'' - 0%'' d,',
'       0 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc10_label ||'' - 10%'' d,',
'       10 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc20_label ||'' - 20%'' d,',
'       20 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc30_label ||'' - 30%'' d,',
'       30 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc40_label ||'' - 40%'' d,',
'       40 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc50_label ||'' - 50%'' d,',
'       50 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc60_label ||'' - 60%'' d,',
'       60 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc70_label ||'' - 70%'' d,',
'       70 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc80_label ||'' - 80%'' d,',
'       80 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc90_label ||'' - 90%'' d,',
'       90 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'union all',
'select pc100_label ||'' - 100%'' d,',
'       100 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P24_STATUS_SCALE,''A'')',
'order by r'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599480847230020702)
,p_name=>'P24_PRIORITY_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(id) r',
'from SP_PROJECT_PRIORITIES',
'where IS_DEFAULT_YN = ''Y'''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Priority'
,p_source=>'PRIORITY_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select description, id',
'from sp_project_priorities',
'order by priority'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599481654037020703)
,p_name=>'P24_RELEASE_DEPENDANT_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Release Dependent'
,p_source=>'RELEASE_DEPENDENT_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_item_comment=>'The difference between dependent and dependant is merely a matter of preferred spelling. "Dependent" is the dominant form in American English for both the noun and adjective, while in British English, "dependant" is more common for the noun.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149599482476705020705)
,p_name=>'P24_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_item_source_plug_id=>wwv_flow_imp.id(149599478618462020692)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_COMBOBOX'
,p_lov=>'select tag d from SP_DEFAULT_TAGS order by display_sequence, tag'
,p_cSize=>60
,p_cMaxlength=>4000
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'max_values_in_list', '20',
  'min_chars', '0',
  'multi_selection', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_item_comment=>'Enter comma separated tags.  Note any spaces will be replaced with a dash "-".'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11615377450790228310)
,p_computation_sequence=>20
,p_computation_item=>'P24_RELEASE_DEPENDANT_YN'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_compute_when=>'P24_RELEASE_DEPENDANT_YN'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(25160226663373885917)
,p_computation_sequence=>40
,p_computation_item=>'P24_REQUIRES_REVIEWS_YN'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_error_message=>'N'
,p_compute_when=>'P24_REQUIRES_REVIEWS_YN'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11587035239329630821)
,p_computation_sequence=>60
,p_computation_item=>'P24_RELEASE_ID'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_computation_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Remove By SH.  The Release ID is used to store the candidate release on the Planning Board.  This overwrites the hidden release ID to null.',
'Removed Condition......',
'  TYPE: Item = Value',
'  ITEM: P24_RELEASE_DEPENDENT_YN ',
'  VALUE: N'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(15995372449620820935)
,p_computation_sequence=>10
,p_computation_item=>'P24_SIZE_HELP_TEXT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  x varchar2(500) := null;',
'begin',
'  for c1 in (',
'     select PROJECT_SIZE, SIZE_DESCRIPTION, EFFORT_DAYS',
'     from   SP_PROJECT_SIZES ps',
'     where  include_yn = ''Y''',
'     order by 3) loop',
'     x := x||apex_escape.html(c1.project_size||'': ''||c1.SIZE_DESCRIPTION||'' ( ''||to_char(c1.EFFORT_DAYS,''FM999G999G990'')||'' days )'')||''<br>'';',
'  end loop;',
'  return x;',
'end;'))
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(24929239129331914228)
,p_validation_name=>'Link'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(:P24_LINK is not null and :P24_LINK_NAME is not null) or ',
'(:P24_LINK is null and :P24_LINK_NAME is null)'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'To add a link you must provide the link url and name.'
,p_when_button_pressed=>wwv_flow_imp.id(149599491293547020715)
,p_associated_item=>wwv_flow_imp.id(21062911322657426617)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(149599489202510020712)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(149599489138120020712)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(149599489947066020714)
,p_event_id=>wwv_flow_imp.id(149599489202510020712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41349812678326670147)
,p_name=>'show hide release'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_RELEASE_DEPENDANT_YN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41349812813974670148)
,p_event_id=>wwv_flow_imp.id(41349812678326670147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_RELEASE_ID'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P24_RELEASE_DEPENDANT_YN'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41349812852609670149)
,p_event_id=>wwv_flow_imp.id(41349812678326670147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_RELEASE_ID'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P24_RELEASE_DEPENDANT_YN'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42879260987992632949)
,p_event_id=>wwv_flow_imp.id(41349812678326670147)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_TARGET_COMPLETE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P24_RELEASE_DEPENDANT_YN'
,p_client_condition_expression=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42879261129204632950)
,p_event_id=>wwv_flow_imp.id(41349812678326670147)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_TARGET_COMPLETE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P24_RELEASE_DEPENDANT_YN'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11587035285878630822)
,p_name=>'when release dependent, clear target date'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_RELEASE_DEPENDANT_YN'
,p_condition_element=>'P24_RELEASE_DEPENDANT_YN'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11587035362455630823)
,p_event_id=>wwv_flow_imp.id(11587035285878630822)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P24_TARGET_COMPLETE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15710429380697752012)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'default scale_letter'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (',
'    select status_scale',
'      from sp_initiatives',
'     where id = :P24_INITIATIVE_ID',
') loop',
'    :P24_STATUS_SCALE := c1.status_scale;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>':P24_INITIATIVE_ID is not null and :P24_ID is null'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_internal_uid=>5476375039551247612
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(149599492079483020717)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(149599478618462020692)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Project'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed'
,p_internal_uid=>139365437738336516317
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13628148382562228447)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'send notification'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_project_link  varchar2(4000);',
'begin',
'',
'for c1 in (',
'    select project, friendly_identifier fi,',
'           target_complete, project_size, tags,',
'           case when release_dependent_yn = ''Y''',
'                then (select release_train ||'' '' || release',
'                        from sp_release_trains',
'                       where id = p.release_id)',
'                end release,',
'           (select first_name',
'              from sp_team_members',
'             where id = :P24_OWNER_ID) first_name',
'      from sp_projects p',
'     where id = :P24_ID',
') loop',
'    l_project_link := sp_strategic_proj_util.get_setting(p_static_id => ''APP_PREFIX_URL'')||',
'                      apex_page.get_url (',
'                          p_application    => :APP_ID,',
'                          p_page           => ''project-details'',',
'                          p_session        => null,',
'                          p_items          => ''fi'',',
'                          p_values         => c1.fi,',
'                          p_plain_url      => TRUE );',
'',
'    sp_strategic_proj_util.assignment_notification (',
'        p_team_member_id => :P24_OWNER_ID,',
'        p_app_name       => :NOMENCLATURE_STRATEGIC_PLANNER,',
'        p_app_id         => :APP_ID,',
'        p_title          => ''You are now the owner of ''||c1.project,',
'        p_project_id     => :P24_ID,',
'        p_project_link   => l_project_link,',
'        p_email_contents => ''Hi ''||c1.first_name||''<br/><br/>''||',
'                            ''You have been set as the owner of the following ''||:NOMENCLATURE_PROJECT||'':<br/><br/>''||',
'                            :NOMENCLATURE_PROJECT||'': <a  style="font-weight:bold" href="''||l_project_link||''">''||c1.project||''</a><br/>''||',
'                            ''Assigned by: ''||lower(:APP_USER)||''<br/>''||',
'                            ''Assigned on: ''||to_char(sysdate,''DD-MON-YYYY'')||''<br/>''||',
'                            case when c1.release is not null ',
'                                 then ''Release: ''||c1.release||''<br/>''',
'                                 end ||',
'                            case when c1.target_complete is not null ',
'                                 then ''Target Complete: ''||to_char(c1.target_complete,''DD-MON-YYYY'')||''<br/>''',
'                                 end ||',
'                            case when c1.project_size is not null ',
'                                 then ''Size: ''||c1.project_size||''<br/>''',
'                                 end ||',
'                            case when c1.tags is not null ',
'                                 then ''Tags: ''||c1.tags',
'                                 end',
'                            );',
'end loop;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from dual',
' where (:P24_ID is null and :P24_OWNER_ID is not null and :P24_OWNER_ID != :APP_USER_ID) ',
'    or (:P24_OWNER_ID is not null and :P24_OWNER_ID != :APP_USER_ID and ',
'         exists (select 1 from sp_projects',
'                  where id = :P24_ID',
'                    and nvl(owner_id,-1) != :P24_OWNER_ID) )'))
,p_process_when_type=>'EXISTS'
,p_internal_uid=>3394094041415724047
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28512074418829784428)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'default tasks'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.default_project_tasks (',
'    p_project_id   => :P24_ID);',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(149599491293547020715)
,p_internal_uid=>18278020077683280028
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(21062911358092426618)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'add link'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P24_LINK is not null then',
'    sp_strategic_proj_util.add_project_link (',
'        p_project_id   => :P24_ID,',
'        p_link_url     => :P24_LINK,',
'        p_link_name    => :P24_LINK_NAME );',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(149599491293547020715)
,p_process_when=>'P24_LINK'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>10828857016945922218
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(149599492478568020717)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>139365438137421516317
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(149599491738406020716)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(149599478618462020692)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Project'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>139365437397259516316
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22211880974229173015)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'log'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_log.log_interaction(',
'    p_project_id => :P24_ID);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>11977826633082668615
);
wwv_flow_imp.component_end;
end;
/

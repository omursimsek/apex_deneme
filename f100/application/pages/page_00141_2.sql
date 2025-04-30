prompt --application/pages/page_00141
begin
--   Manifest
--     PAGE: 00141
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
 p_id=>141
,p_name=>'Documents'
,p_alias=>'DOCUMENTS1'
,p_page_mode=>'MODAL'
,p_step_title=>'Documents'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15646220883889900997)
,p_plug_name=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(120086881241598825463)
,p_plug_name=>'Documents'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.ID,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.project_id,',
'       apex_util.get_since(d.created) created,',
'       d.doc_description,',
'       d.tags,',
'       lower(d.created_by) author,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       created date_created,',
'       substr(DOCUMENT_FILENAME,instr(DOCUMENT_FILENAME,''.'',-1)+1,length(DOCUMENT_FILENAME)-instr(DOCUMENT_FILENAME,''.'',-1)) file_extension',
'  from SP_PROJECT_DOCUMENTS d',
' where project_id = :P141_ID',
'order by created desc'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_CONTENT_ROW'
,p_ajax_items_to_submit=>'P141_ID'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'DESCRIPTION', '&DOC_DESCRIPTION.',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'MISC', 'Size: &DOC_SIZE. <br>Created: &CREATED.',
  'OVERLINE', '&AUTHOR.',
  'TITLE', '&DOCUMENT_FILENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557854783083646931)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557854911198646932)
,p_name=>'DOCUMENT_FILENAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENT_FILENAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557855103995646934)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557855198516646935)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557855252469646936)
,p_name=>'DOC_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557855393299646937)
,p_name=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAGS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557855594882646939)
,p_name=>'DOC_SIZE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOC_SIZE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_format_mask=>'FILESIZE'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557855655865646940)
,p_name=>'DATE_CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_CREATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557855771617646941)
,p_name=>'FILE_EXTENSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FILE_EXTENSION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>110
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12557856531193646948)
,p_name=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26269779185161083424)
,p_name=>'AUTHOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUTHOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12596040835735139370)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(15646220883889900997)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12557856242660646946)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15646220883889900997)
,p_button_name=>'Add_document'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Add Document'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_PROJECT_ID:&P141_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12596040399034139369)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(15646220883889900997)
,p_button_name=>'View_Project'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Project'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID:&P141_ID.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12557856558775646949)
,p_name=>'P141_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15646220883889900997)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14126063149282513269)
,p_name=>'P141_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(120086881241598825463)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12596042800804139373)
,p_name=>'close dialog'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(12596040835735139370)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12596043323188139374)
,p_event_id=>wwv_flow_imp.id(12596042800804139373)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(12557855888113646942)
,p_region_id=>wwv_flow_imp.id(120086881241598825463)
,p_position_id=>wwv_flow_imp.id(18789316105217936671)
,p_display_sequence=>10
,p_template_id=>wwv_flow_imp.id(18789317966414971948)
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12557856024686646943)
,p_component_action_id=>wwv_flow_imp.id(12557855888113646942)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Document'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_ID:&ID.'
,p_icon_css_classes=>'fa-image'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12557856228394646945)
,p_component_action_id=>wwv_flow_imp.id(12557855888113646942)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp.component_end;
end;
/

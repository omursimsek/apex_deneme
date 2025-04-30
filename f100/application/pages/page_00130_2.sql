prompt --application/pages/page_00130
begin
--   Manifest
--     PAGE: 00130
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
 p_id=>130
,p_name=>'Activity Quick Look'
,p_alias=>'ACTIVITY-QUICK-LOOK'
,p_page_mode=>'MODAL'
,p_step_title=>'Activity Quick Look'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26719029416827677141)
,p_plug_name=>'Activity Content Row'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ap.id, ',
'       at.activity_type,',
'       ap.comments,',
'       ap.start_date,',
'       ap.end_date,',
'       to_char(ap.end_date,''Day DD-MON-YYYY'') end_date_formatted,',
'       to_char(ap.start_date,''Day DD-MON-YYYY'')||'' to ''||to_char(ap.end_date,''Day DD-MON-YYYY'') TIMELINE,',
'       ap.end_date - ap.start_date days,',
'       round(ap.end_date - sysdate) days_remaining,',
'       ap.url,',
'       tm.first_name||'' ''||tm.last_name name,',
'       --',
'       p.project,',
'       p.friendly_identifier,',
'       p.PROJECT_URL_NAME,',
'       apex_util.get_since(ap.updated) last_updated,',
'       --',
'       tm.first_name||'' ''||tm.last_name owner,',
'       --',
'       -- timeframe',
'       --',
'        decode(',
'           greatest(trunc(sysdate),trunc(ap.end_date)),',
'           trunc(sysdate),',
'           ''Past'',',
'           decode(',
'               greatest(trunc(sysdate),trunc(ap.start_date)),',
'               trunc(sysdate),',
'               ''Current'',',
'               ''Future'')',
'           ) timeframe,',
'       --',
'       -- pie chart icon in 10% chunks that show time percent complete',
'       --',
'       ''fa-pie-chart-''||sp_date_range_pct_comp(ap.start_date, ap.end_date) icon',
'from sp_activities ap,',
'     sp_projects p,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ap.project_id = p.id and',
'      p.id = :P130_PROJECT_ID and',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id and',
'      --',
'      --',
'      --',
'      (  ',
'         sysdate between ap.start_date and ap.end_date or ',
'         (nvl(:P130_INCLUDE_FUTURE,''N'') = ''Y'' and ap.start_date >= trunc(sysdate)) or',
'         (nvl(:P130_INCLUDE_PAST,''N'') = ''Y'' and ap.end_date < trunc(sysdate))',
'      )',
'',
''))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>30
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', '&ICON.',
  'AVATAR_SHAPE', 't-Avatar--noShape',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--lg',
  'BADGE_LABEL', '&NOMENCLATURE_PROJECTS.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_VALUE', 'TIMEFRAME',
  'DESCRIPTION', '&COMMENTS.',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', 'Updated &LAST_UPDATED.',
  'OVERLINE', '<strong>&ACTIVITY_TYPE.</strong>: &TIMELINE.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&OWNER.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14104547577633057770)
,p_name=>'TIMEFRAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIMEFRAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>340
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26719029592133677142)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26719030984752677156)
,p_name=>'DAYS_REMAINING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DAYS_REMAINING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26719031136491677158)
,p_name=>'ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26719033080851677177)
,p_name=>'ACTIVITY_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVITY_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26719033196128677178)
,p_name=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26719033296939677179)
,p_name=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26719033388679677180)
,p_name=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'END_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266080711228631)
,p_name=>'DAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>230
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266117947228632)
,p_name=>'URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>240
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266271766228633)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266394296228634)
,p_name=>'PROJECT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266443021228635)
,p_name=>'FRIENDLY_IDENTIFIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FRIENDLY_IDENTIFIER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266504834228636)
,p_name=>'TIMELINE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIMELINE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>280
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266652195228637)
,p_name=>'PROJECT_URL_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_URL_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>290
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740266782100228638)
,p_name=>'LAST_UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>300
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26740267555095228646)
,p_name=>'END_DATE_FORMATTED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'END_DATE_FORMATTED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>310
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26768687230819128301)
,p_name=>'OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>330
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12342029386944717611)
,p_name=>'P130_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(26719029416827677141)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12342029475357717612)
,p_name=>'P130_INCLUDE_FUTURE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(26719029416827677141)
,p_prompt=>'Include Future'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12342029544644717613)
,p_name=>'P130_INCLUDE_PAST'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(26719029416827677141)
,p_prompt=>'Include Past'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12342030385166717621)
,p_name=>'P130_PROJECT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(26719029416827677141)
,p_prompt=>'&NOMENCLATURE_PROJECT.'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(12342030491910717622)
,p_computation_sequence=>10
,p_computation_item=>'P130_PROJECT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select project from sp_projects where id = :P130_PROJECT_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12342029760909717615)
,p_name=>'set state and refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_INCLUDE_FUTURE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12342029940927717616)
,p_event_id=>wwv_flow_imp.id(12342029760909717615)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P130_INCLUDE_FUTURE,P130_INCLUDE_PAST'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12342029969362717617)
,p_event_id=>wwv_flow_imp.id(12342029760909717615)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(26719029416827677141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12342030050968717618)
,p_name=>'refresh on show past'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_INCLUDE_PAST'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12342030190802717619)
,p_event_id=>wwv_flow_imp.id(12342030050968717618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P130_INCLUDE_FUTURE,P130_INCLUDE_PAST'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12342030332241717620)
,p_event_id=>wwv_flow_imp.id(12342030050968717618)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(26719029416827677141)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(26719031575269677162)
,p_region_id=>wwv_flow_imp.id(26719029416827677141)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(13553919547696152774)
,p_component_action_id=>wwv_flow_imp.id(26719031575269677162)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Activity Detail'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,140:P140_ID:&ID.'
,p_icon_css_classes=>'fa-glasses'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(26719031637754677163)
,p_component_action_id=>wwv_flow_imp.id(26719031575269677162)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit Activity'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp.component_end;
end;
/

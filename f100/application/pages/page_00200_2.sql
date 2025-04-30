prompt --application/pages/page_00200
begin
--   Manifest
--     PAGE: 00200
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
 p_id=>200
,p_name=>'Release History'
,p_alias=>'RELEASE-HISTORY'
,p_step_title=>'Release History'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32939087089371101377)
,p_plug_name=>'History'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.project                           project,',
'       ''P''||to_char(p.priority_id)         priority,',
'       p.PROJECT_SIZE                      project_size,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = p.OWNER_ID)         owner,',
'       decode(p.ACTIVE_YN,''Y'',''Yes'',''No'')  active,',
'       p.FRIENDLY_IDENTIFIER               FI,',
'       p.PROJECT_URL_NAME                  PN,                   ',
'       --',
'       pc.PROJECT_ID                       project_id,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       --',
'       :NOMENCLATURE_PROJECT||'' ''||initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       case pc.change_type when ''CREATE'' then ''Added''',
'                           when ''UPDATE'' then ''Updated''',
'                           when ''DELETE'' then ''Deleted''',
'                           else pc.change_type',
'            end change_type,',
'       decode(old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.change_type,''DELETE'',decode(old_value,''Y'',''Yes'',''N'',''No'',old_value),decode(new_value,''Y'',''Yes'',''N'',''No'',new_value)) NEW_VALUE,',
'       changed_by',
'  from SP_PROJECT_HISTORY pc,',
'       sp_projects p',
'where  p.release_id = :P200_RELEASE_ID ',
'       and p.id = pc.project_id',
'       and p.ARCHIVED_YN = ''N''',
'union all',
'select null         project,',
'       null         priority,',
'       null         project_size,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = r.RELEASE_OWNER_ID)         owner,',
'       null      active,',
'       null      FI,',
'       null      PN,                   ',
'       --',
'       null       project_id,',
'       h.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(h.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       --',
'       initcap(replace(h.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       case h.change_type when ''CREATE'' then ''Added''',
'                           when ''UPDATE'' then ''Updated''',
'                           when ''DELETE'' then ''Deleted''',
'                           else h.change_type',
'            end change_type,',
'       decode(old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(h.change_type,''DELETE'',decode(old_value,''Y'',''Yes'',''N'',''No'',old_value),decode(new_value,''Y'',''Yes'',''N'',''No'',new_value)) NEW_VALUE,',
'       changed_by',
'  from sp_release_history h,',
'       sp_release_trains r',
' where r.id = :P200_RELEASE_ID ',
'   and r.id = h.release_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P200_RELEASE_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'History'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(32939088504624101392)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>22705034163477596992
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32939088665371101393)
,p_db_column_name=>'PROJECT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FI#,#PN#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32939088726768101394)
,p_db_column_name=>'PRIORITY'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32939088884202101395)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299010236103853446)
,p_db_column_name=>'OWNER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299010464035853448)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38125570316969878724)
,p_db_column_name=>'CHANGE_TYPE'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>'Change'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299010520377853449)
,p_db_column_name=>'ATTRIBUTE_CHANGE_DATE'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'When'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299010686619853450)
,p_db_column_name=>'ATTRIBUTE_CHANGE_MONTH'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Month'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299010729740853451)
,p_db_column_name=>'ATTRIBUTE_COLUMN'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Attribute'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299010794812853452)
,p_db_column_name=>'OLD_VALUE'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Old Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299010986059853453)
,p_db_column_name=>'NEW_VALUE'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299011084426853454)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299012576912853469)
,p_db_column_name=>'ACTIVE'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299012600814853470)
,p_db_column_name=>'FI'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Fi'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33299012776902853471)
,p_db_column_name=>'PN'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Pn'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(33298836236880491714)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'39046340'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ATTRIBUTE_CHANGE_DATE:ATTRIBUTE_COLUMN:CHANGE_TYPE:CHANGED_BY:PROJECT:NEW_VALUE'
,p_sort_column_1=>'ATTRIBUTE_CHANGE_DATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'NEW_VALUE'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41682569381944659070)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45756723017573871004)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(41682569381944659070)
,p_region_sub_css_classes=>'header-actions'
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>'select 1 as actions from dual'
,p_template_component_type=>'PARTIAL'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', 'fa-user',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--md',
  'BADGE_LABEL_DISPLAY', 'N',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'REMOVE_PADDING', 'N')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(45756724251079871016)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(61931514179895698434)
,p_name=>'Release'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody:t-Region-orderBy--end:margin-left-md'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.ID,',
'       r.RELEASE_TRAIN||'' ''||r.RELEASE release,',
'       decode(r.RELEASE_TARGET_DATE,null,    ''No Date'',to_char(r.RELEASE_TARGET_DATE,   ''DD-MON-YY'')) RELEASE_TARGET_DATE,',
'       decode(r.RELEASE_OPEN_DATE,null,      ''No Date'',to_char(r.RELEASE_OPEN_DATE,     ''DD-MON-YY'')) RELEASE_OPEN_DATE,',
'       greatest(round(r.RELEASE_TARGET_DATE - sysdate),0) days_remaining,',
'       --',
'       -- projects',
'       --',
'       (select count(*) ',
'       from sp_projects p ',
'       where p.release_id = r.id and ',
'             p.ARCHIVED_YN = ''N'' and ',
'             p.RELEASE_DEPENDENT_YN = ''Y'' and ',
'             p.DUPLICATE_OF_PROJECT_ID is null) projects,',
'       --',
'       --',
'       --',
'       round(r.RELEASE_TARGET_DATE - r.RELEASE_OPEN_DATE) release_length,',
'       --',
'       -- owner',
'       --',
'       t.first_name||'' ''||t.last_name owner,',
'       --',
'       -- release open and close',
'       --',
'       decode(r.RELEASE_OPEN_COMPLETED,''Y'',''Yes'',''N'',''No'',''Unknown'') release_opened,',
'       decode(r.RELEASE_COMPLETED,''Y'',''Yes'',''N'',''No'',''Unknown'') release_completed',
'  from SP_RELEASE_TRAINS r,',
'       SP_TEAM_MEMBERS t',
' where r.id = :P200_RELEASE_ID and ',
'       r.RELEASE_OWNER_ID = t.id(+)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694624086346140453)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694624466984140453)
,p_query_column_id=>2
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694621694416140450)
,p_query_column_id=>3
,p_column_alias=>'RELEASE_TARGET_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Target Complete'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694622510643140451)
,p_query_column_id=>4
,p_column_alias=>'RELEASE_OPEN_DATE'
,p_column_display_sequence=>60
,p_column_heading=>'Open'
,p_column_format=>'DD-MON-YY'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694624894093140453)
,p_query_column_id=>5
,p_column_alias=>'DAYS_REMAINING'
,p_column_display_sequence=>90
,p_column_heading=>'Remaining'
,p_column_format=>'99999'
,p_column_html_expression=>'#DAYS_REMAINING# days'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694622876736140451)
,p_query_column_id=>6
,p_column_alias=>'PROJECTS'
,p_column_display_sequence=>100
,p_column_heading=>'&NOMENCLATURE_PROJECTS.'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694623265971140452)
,p_query_column_id=>7
,p_column_alias=>'RELEASE_LENGTH'
,p_column_display_sequence=>80
,p_column_heading=>'Length'
,p_column_html_expression=>'#RELEASE_LENGTH# days'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694625319823140454)
,p_query_column_id=>8
,p_column_alias=>'OWNER'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694626059403140455)
,p_query_column_id=>9
,p_column_alias=>'RELEASE_OPENED'
,p_column_display_sequence=>150
,p_column_heading=>'Release Opened'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24694620904561140449)
,p_query_column_id=>10
,p_column_alias=>'RELEASE_COMPLETED'
,p_column_display_sequence=>140
,p_column_heading=>'Release Completed'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24694808821104006570)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(41682569381944659070)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(23716706280587903131)
,p_name=>'P200_RELEASE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(61931514179895698434)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24695590243783041788)
,p_name=>'P200_RELEASE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(61931514179895698434)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24695641141292050175)
,p_computation_sequence=>30
,p_computation_item=>'P200_RELEASE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select release_train||'' ''||release d from sp_release_trains where id = :P200_RELEASE_ID'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(45756723318152871007)
,p_region_id=>wwv_flow_imp.id(45756723017573871004)
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
 p_id=>wwv_flow_imp.id(23716706813205903136)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release Calendar'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:RP,203:P203_RELEASE_ID:&P200_RELEASE_ID.'
,p_icon_css_classes=>'fa-calendar-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23716706865141903137)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release Dashboard'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:RP,202:P202_RELEASE_ID:&P200_RELEASE_ID.'
,p_icon_css_classes=>'fa-area-chart'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23716708053255903149)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release Home'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,:P117_RELEASE_ID:&P200_RELEASE_ID.'
,p_icon_css_classes=>'fa-ship'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23716708143734903150)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>70
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(31774929140119935157)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP,300:P300_RELEASE_ID:&P200_RELEASE_ID.'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(45756723397812871008)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(45756724024059871014)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RR,200:P200_RELEASE_ID:&P200_RELEASE_ID.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(45756724168078871015)
,p_component_action_id=>wwv_flow_imp.id(45756723318152871007)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>20
);
wwv_flow_imp.component_end;
end;
/

prompt --application/pages/page_00021
begin
--   Manifest
--     PAGE: 00021
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
 p_id=>21
,p_name=>'Initiatives'
,p_alias=>'INITIATIVES'
,p_step_title=>'&NOMENCLATURE_INITIATIVES.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401340157312233831)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-actions {',
'  --a-cv-actions-padding-x: .5rem;',
'  --a-cv-actions-padding-y: .5rem;',
'  --a-cv-actions-background-color: transparent;',
'}',
'',
'.no-item-ui {',
'  --a-field-input-border-width: 0px;',
'  --a-field-input-background-color: transparent;',
'}',
'',
'.a-CardView-iconWrap {',
'  align-self: flex-start;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15037240060965310740)
,p_plug_name=>'&NOMENCLATURE_INITIATIVES.'
,p_region_css_classes=>'clear-avatar-icons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.ID,',
'       --',
'       i.AREA_ID,',
'       i.INITIATIVE,',
'       --',
'       --shortened objective',
'       --',
'       decode(i.OBJECTIVE,null,''No description provided'',substr(i.OBJECTIVE,1,80)||decode(greatest(length(i.objective),80),80,null,''...'')) OBJECTIVE,',
'       --',
'       -- owner',
'       --',
'       tm.id owner_id,',
'       case when tm.id is null then ''(No Owner)'' else tm.first_name||'' ''||tm.last_name end SPONSOR,',
'       --',
'       -- updated and created dates',
'       --',
'       i.CREATED,',
'       i.CREATED_BY,',
'       greatest(i.updated,nvl((',
'           select max(updated) ',
'           from sp_projects p ',
'           where p.initiative_id = i.id and',
'                 p.DUPLICATE_OF_PROJECT_ID is null and',
'                 ARCHIVED_YN = ''N''),',
'                 i.updated)) updated,',
'       i.UPDATED_BY,',
'       to_char(i.created,''YYYY.MM'') created_month,',
'       to_char(i.updated,''YYYY.MM'') updated_month,',
'       --',
'       -- project counts',
'       --',
'       (select count(*) ',
'       from sp_projects p ',
'       where p.initiative_id = i.id and ',
'             p.DUPLICATE_OF_PROJECT_ID is null and',
'             ARCHIVED_YN = ''N'') projects,',
'       --',
'       (select count(*) ',
'       from sp_projects p ',
'       where p.initiative_id = i.id and ',
'             p.DUPLICATE_OF_PROJECT_ID is null and',
'             p.pct_complete != 0 and ',
'             p.pct_complete != 100 and',
'             ARCHIVED_YN = ''N'') open_projects,',
'       --',
'       (select count(*) ',
'       from sp_projects p ',
'       where p.initiative_id = i.id and ',
'             p.DUPLICATE_OF_PROJECT_ID is null and',
'             p.pct_complete = 100 and',
'             ARCHIVED_YN = ''N'') projects_100,',
'       --',
'       -- last project update',
'       --',
'       nvl((select max(p.updated) ',
'        from sp_projects p ',
'        where p.initiative_id = i.id and ',
'              p.ARCHIVED_YN = ''N'' and ',
'              p.DUPLICATE_OF_PROJECT_ID is null ),i.updated) last_project_update,',
'       --',
'       -- image',
'       --',
'       case when i.image is not null then i.image else f.image end image,',
'       case when i.image is not null then i.image_mimetype else f.image_mimetype end image_mimetype,',
'       case when i.image is not null then i.image_name else f.image_name end image_name, ',
'       case when i.image is not null then i.image_last_updated else f.image_last_updated end image_last_updated,  ',
'       --',
'       -- other',
'       --',
'       f.AREA focus_area,',
'       i.tags,',
'       decode(i.hidden_by_default_yn,''Y'',''Hidden'',''N'',''Visible'',''Visible'') hidden_by_default',
'  from SP_INITIATIVES i, ',
'       sp_areas f,',
'       sp_team_members tm',
'  where i.area_id = f.id and',
'        i.SPONSOR_ID = tm.id(+)'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"INITIATIVE","expr":"initiative"},{"key":"UPDATED","expr":"updated desc"},{"key":"PROJECTS","expr":"projects desc"},{"key":"OPEN_PROJECTS","expr":"open_projects desc"},{"key":"LAST_PROJECT_UPDATE","expr":"last_project_update desc '
||'nulls last"}],"itemName":"P21_ORDER_BY"}'
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_DESCRIPTION', '&NOMENCLATURE_INITIATIVES. Icon',
  'AVATAR_IMAGE', '{"source":"BLOB_COLUMN","blobColumn":"IMAGE","filenameColumn":"IMAGE_NAME","mimeTypeColumn":"IMAGE_MIMETYPE","lastUpdatedColumn":"IMAGE_LAST_UPDATED"}',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_TYPE', 'image',
  'DESCRIPTION', wwv_flow_string.join(wwv_flow_t_varchar2(
    '&NOMENCLATURE_AREA!HTML.: <strong>&FOCUS_AREA!HTML.</strong><br>',
    '&NOMENCLATURE_PROJECTS!HTML.: <strong>&PROJECTS.</strong>, with &OPEN_PROJECTS. open, and &PROJECTS_100. resolved<br>',
    '&OBJECTIVE!HTML.',
    '')),
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'MISC', wwv_flow_string.join(wwv_flow_t_varchar2(
    '&SPONSOR!HTML.<br>',
    '&LAST_PROJECT_UPDATE.')),
  'REMOVE_PADDING', 'N',
  'TITLE', '&INITIATIVE!HTML.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11587037672046630846)
,p_name=>'AREA_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>300
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15037240712013310746)
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
 p_id=>wwv_flow_imp.id(15037240979732310749)
,p_name=>'INITIATIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITIATIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611864320408904001)
,p_name=>'OBJECTIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OBJECTIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611864430582904002)
,p_name=>'SPONSOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SPONSOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611864499231904003)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>80
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611864608297904004)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611864712727904005)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611864858976904007)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611865035491904008)
,p_name=>'PROJECTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECTS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611865130663904009)
,p_name=>'FOCUS_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOCUS_AREA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>140
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611865224672904010)
,p_name=>'CREATED_MONTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_MONTH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611865328484904011)
,p_name=>'UPDATED_MONTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_MONTH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>160
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611865387742904012)
,p_name=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAGS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15611865505132904013)
,p_name=>'HIDDEN_BY_DEFAULT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HIDDEN_BY_DEFAULT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>180
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15710431637977752034)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'BLOB'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15710431692945752035)
,p_name=>'IMAGE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE_MIMETYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15710431781100752036)
,p_name=>'IMAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15710431842550752037)
,p_name=>'IMAGE_LAST_UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE_LAST_UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>280
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15710431948654752038)
,p_name=>'OWNER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OWNER_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>290
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15832358199823183315)
,p_name=>'OPEN_PROJECTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPEN_PROJECTS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15832358278389183316)
,p_name=>'PROJECTS_100'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECTS_100'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19575128717479374248)
,p_name=>'LAST_PROJECT_UPDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_PROJECT_UPDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>310
,p_format_mask=>'SINCE'
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17652441047814510173)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18516784402847524991)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(17652441047814510173)
,p_region_sub_css_classes=>'header-actions'
,p_plug_display_sequence=>10
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
 p_id=>wwv_flow_imp.id(18516785636353525003)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41547358509893037120)
,p_plug_name=>'Faceted Search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(15037240060965310740)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(122143894632786626970)
,p_plug_name=>'items'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI:margin-bottom-none'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source=>'<div id="active_facets"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11636460285836836168)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17652441047814510173)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11808459442882331008)
,p_name=>'P21_CREATED_MONTH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(41547358509893037120)
,p_prompt=>'Created Month'
,p_source=>'CREATED_MONTH'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11808459633189331009)
,p_name=>'P21_UPDATED_MONTH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(41547358509893037120)
,p_prompt=>'Updated Month'
,p_source=>'UPDATED_MONTH'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15037237710229310716)
,p_name=>'P21_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(41547358509893037120)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_multi_value_trim_space=>true
,p_fc_filter_combination=>'OR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15037237888535310718)
,p_name=>'P21_HIDDEN_BY_DEFAULT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(41547358509893037120)
,p_prompt=>'Default Display'
,p_source=>'HIDDEN_BY_DEFAULT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20050767408332703103)
,p_name=>'P21_DEFAULT_AREA_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15037240060965310740)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41547358625715037121)
,p_name=>'P21_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(41547358509893037120)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41547358754833037123)
,p_name=>'P21_SPONSOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(41547358509893037120)
,p_prompt=>'Owner'
,p_source=>'SPONSOR'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42440572917882479640)
,p_name=>'P21_FOCUS_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(41547358509893037120)
,p_prompt=>'&NOMENCLATURE_AREA.'
,p_source=>'FOCUS_AREA'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(122512039197379136974)
,p_name=>'P21_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(122143894632786626970)
,p_item_display_point=>'NEXT'
,p_item_default=>'LAST_PROJECT_UPDATE'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:&NOMENCLATURE_INITIATIVE.;INITIATIVE,&NOMENCLATURE_INITIATIVE. Updated;UPDATED,&NOMENCLATURE_PROJECTS.;PROJECTS,Open &NOMENCLATURE_PROJECTS.;OPEN_PROJECTS,Last &NOMENCLATURE_PROJECT. Updated;LAST_PROJECT_UPDATE'
,p_cHeight=>1
,p_tag_css_classes=>'w240 no-item-ui'
,p_field_template=>2040785906935475274
,p_item_css_classes=>'u-pullRight'
,p_item_icon_css_classes=>'fa-sort-amount-desc'
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(12326322476451394423)
,p_computation_sequence=>10
,p_computation_item=>'LAST_PROJ_JUMP_PG'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'21'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(122188980507439142979)
,p_name=>'dialog close'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(122143894632786626970)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11652229822618405928)
,p_name=>'refresh on dialog close'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(17652441047814510173)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11652230027123405930)
,p_event_id=>wwv_flow_imp.id(11652229822618405928)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41547358509893037120)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11855786094148318636)
,p_name=>'refresh bc'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(18516784402847524991)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11855786338040318638)
,p_event_id=>wwv_flow_imp.id(11855786094148318636)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41547358509893037120)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15710428888478752007)
,p_event_id=>wwv_flow_imp.id(11855786094148318636)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15037240060965310740)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15615973648385975107)
,p_name=>'refresh on DC'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(15037240060965310740)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15615973745785975108)
,p_event_id=>wwv_flow_imp.id(15615973648385975107)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15037240060965310740)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15615973933445975109)
,p_event_id=>wwv_flow_imp.id(15615973648385975107)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41547358509893037120)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(11855786035996318635)
,p_region_id=>wwv_flow_imp.id(18516784402847524991)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Add &NOMENCLATURE_INITIATIVE.'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22:P22_FOCUS_AREA_ID:&P21_DEFAULT_AREA_ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-plus'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(15611865543416904014)
,p_region_id=>wwv_flow_imp.id(15037240060965310740)
,p_position_id=>348722977165395441
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,94:P94_INITIATIVE_ID:&ID.'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(15611865678898904015)
,p_region_id=>wwv_flow_imp.id(15037240060965310740)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(18516784703426524994)
,p_region_id=>wwv_flow_imp.id(18516784402847524991)
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
 p_id=>wwv_flow_imp.id(11368121162669827064)
,p_component_action_id=>wwv_flow_imp.id(15611865678898904015)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Kanban'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.::P160_INITIATIVE_ID:&ID.'
,p_icon_css_classes=>'fa-columns'
,p_build_option_id=>wwv_flow_imp.id(21855158598441364965)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12973436626479013511)
,p_component_action_id=>wwv_flow_imp.id(18516784703426524994)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About &NOMENCLATURE_INITIATIVES.'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14374679722638565059)
,p_component_action_id=>wwv_flow_imp.id(18516784703426524994)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,21::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14374679891255565060)
,p_component_action_id=>wwv_flow_imp.id(18516784703426524994)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>40
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15611865754272904016)
,p_component_action_id=>wwv_flow_imp.id(15611865678898904015)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit &NOMENCLATURE_INITIATIVE.'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22:P22_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15611865894714904017)
,p_component_action_id=>wwv_flow_imp.id(15611865678898904015)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Add Project'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_INITIATIVE_ID,P24_DEF_INITIATIVE_ID:&ID.,&ID.'
,p_icon_css_classes=>'fa-plus'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15611865974874904018)
,p_component_action_id=>wwv_flow_imp.id(15611865678898904015)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_INITIATIVE. Details'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,94:P94_INITIATIVE_ID:&ID.'
,p_icon_css_classes=>'fa-lightbulb-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15615977047459975141)
,p_component_action_id=>wwv_flow_imp.id(15611865678898904015)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECTS.'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,:P23_INITIATIVE,P23_FOCUS_AREA:&INITIATIVE.,&FOCUS_AREA.'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(18516785409333525001)
,p_component_action_id=>wwv_flow_imp.id(18516784703426524994)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp.component_end;
end;
/

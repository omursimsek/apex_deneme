prompt --application/pages/page_00078
begin
--   Manifest
--     PAGE: 00078
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
 p_id=>78
,p_name=>'Change History'
,p_alias=>'CHANGE-HISTORY-REPORT'
,p_step_title=>'Change History'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(21103783134283959393)
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14138866379246510542)
,p_plug_name=>'facets'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(21791718952604195023)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21791718952604195023)
,p_name=>'Change History'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select change_to,',
'       parent_type,',
'       object,',
'       owner,',
'       view_link,                   ',
'       favorite,',
'       ATTRIBUTE_CHANGE_DATE,',
'       ATTRIBUTE_CHANGE_Month,',
'       change_type,',
'       ATTRIBUTE_COLUMN,',
'       OLD_VALUE,',
'       NEW_VALUE,',
'       changed_by,',
'       release',
'  from (',
'select :NOMENCLATURE_PROJECT               change_to,',
'       :NOMENCLATURE_PROJECT               parent_type,',
'       p.project                           object,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = p.OWNER_ID)         owner,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':3:''||:APP_SESSION||''::NO:3:FI,PN:''||p.FRIENDLY_IDENTIFIER||'',''||p.PROJECT_URL_NAME) view_link,',
'       --',
'       case when f.project_id is not null then ''Yes'' else ''No'' end favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       case pc.change_type when ''CREATE'' then ''Addition''',
'                           when ''UPDATE'' then ''Update''',
'                           when ''DELETE'' then ''Delete''',
'                           else pc.change_type',
'            end change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       decode(p.RELEASE_DEPENDENT_YN,',
'              ''Y'',(select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),null)  release',
'  from SP_PROJECT_HISTORY pc,',
'       sp_projects p,',
'       sp_favorites f',
' where p.id = pc.project_id',
'   and p.ARCHIVED_YN = ''N''',
'   and p.id = f.project_id (+)',
'union all',
'select :NOMENCLATURE_PROJECT ||'' ''|| tt.task_type ||',
'       case when t.task_sub_type_id is not null',
'            then (select '': ''||task_type from sp_task_types where t.task_sub_type_id = id)',
'            end change_to,',
'       :NOMENCLATURE_PROJECT ||'' ''|| case when tt.task_type in (''Review'',''Milestone'') then tt.task_type',
'                                          else ''Task'' end parent_type,',
'       p.project                           object,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = p.OWNER_ID)         owner,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':3:''||:APP_SESSION||''::NO:3:FI,PN:''||p.FRIENDLY_IDENTIFIER||'',''||p.PROJECT_URL_NAME) view_link,',
'       --',
'       case when f.project_id is not null then ''Yes'' else ''No'' end favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       case pc.change_type when ''CREATE'' then ''Addition''',
'                           when ''UPDATE'' then ''Update''',
'                           when ''DELETE'' then ''Delete''',
'                           else pc.change_type',
'            end change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       decode(p.RELEASE_DEPENDENT_YN,',
'                   ''Y'',(select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),null)  release',
'  from sp_task_history pc,',
'       sp_tasks t,',
'       sp_task_types tt,',
'       sp_projects p,',
'       sp_favorites f',
' where pc.task_id = t.id',
'   and t.task_type_id = tt.id',
'   and t.project_id = p.id',
'   and p.ARCHIVED_YN = ''N''',
'   and p.id = f.project_id (+)',
'union all',
'select ''Release''               change_to,',
'       ''Release''               parent_type,',
'       p.release_train||'' ''||p.release object,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = p.RELEASE_OWNER_ID) owner,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':117:''||:APP_SESSION||''::NO:117:P117_RELEASE_ID:''||p.id) view_link,                    ',
'       --',
'       null favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       case pc.change_type when ''CREATE'' then ''Addition''',
'                           when ''UPDATE'' then ''Update''',
'                           when ''DELETE'' then ''Delete''',
'                           else pc.change_type',
'            end change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       p.release_train||'' ''||p.release release',
'  from SP_RELEASE_HISTORY pc,',
'       sp_release_trains p',
' where p.id = pc.release_id',
'union all',
'select :NOMENCLATURE_INITIATIVE  change_to,',
'       :NOMENCLATURE_INITIATIVE  parent_type,',
'       p.initiative              object,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = p.sponsor_id) owner,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':94:''||:APP_SESSION||''::NO:94:P94_INITIATIVE_ID:''||p.id) view_link,                  ',
'       --',
'       null favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       case pc.change_type when ''CREATE'' then ''Addition''',
'                           when ''UPDATE'' then ''Update''',
'                           when ''DELETE'' then ''Delete''',
'                           else pc.change_type',
'            end change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       null release',
'  from SP_INITIATIVE_HISTORY pc,',
'       sp_initiatives p',
' where p.id = pc.initiative_id',
'union all',
'select :NOMENCLATURE_INITIATIVE  change_to,',
'       :NOMENCLATURE_INITIATIVE||'' Focus Area''  parent_type,',
'       p.initiative||'' - ''||a.focus_area  object,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = a.development_owner_id) owner,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':33:''||:APP_SESSION||''::NO:33:P33_INIT_FOCUS_AREA_ID:''||a.id) view_link,                    ',
'       --',
'       null favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       case pc.change_type when ''CREATE'' then ''Addition''',
'                           when ''UPDATE'' then ''Update''',
'                           when ''DELETE'' then ''Delete''',
'                           else pc.change_type',
'            end change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       null release',
'  from SP_INIT_FOCUS_AREA_HISTORY pc,',
'       sp_initiative_focus_areas a,',
'       sp_initiatives p',
' where pc.init_focus_area_id = a.id',
'   and p.id = a.initiative_id',
'union all',
'select :NOMENCLATURE_PROJECT       change_to,',
'       :NOMENCLATURE_PROJECT       parent_type,',
'       old_value                   object,',
'       null owner,',
'       ''#'' view_link,                  ',
'       --',
'       null favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       ''Delete'' change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       null release',
'  from SP_PROJECT_HISTORY pc',
' where change_type = ''DELETE''',
'   and attribute_column = ''PROJECT''',
'union all',
'select :NOMENCLATURE_INITIATIVE  change_to,',
'       :NOMENCLATURE_INITIATIVE  parent_type,',
'       old_value                 object,',
'       null owner,',
'       ''#'' view_link,                  ',
'       --',
'       null favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       ''Delete'' change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       null release',
'  from SP_INITIATIVE_HISTORY pc',
' where change_type = ''DELETE''',
'   and attribute_column = ''INITIATIVE''',
'union all',
'select ''Release''               change_to,',
'       ''Release''               parent_type,',
'       old_value                 object,',
'       null owner,',
'       ''#'' view_link,                  ',
'       --',
'       null favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       to_char(pc.changed_on,''YYYY.MM'') ATTRIBUTE_CHANGE_Month,',
'       ''Delete'' change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- release',
'       --',
'       null release',
'  from SP_RELEASE_HISTORY pc',
' where change_type = ''DELETE''',
'   and attribute_column = ''RELEASE''',
')'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"ATTRIBUTE_CHANGE_DATE","expr":"attribute_change_date desc"},{"key":"ATTRIBUTE_CHANGE_DATE1","expr":"attribute_change_date asc"},{"key":"OBJECT","expr":"object"}],"itemName":"P78_ORDER_BY"}'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17407957628707141410)
,p_query_column_id=>1
,p_column_alias=>'CHANGE_TO'
,p_column_display_sequence=>40
,p_column_heading=>'Change To'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17407957699269141411)
,p_query_column_id=>2
,p_column_alias=>'PARENT_TYPE'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28418375353664926006)
,p_query_column_id=>3
,p_column_alias=>'OBJECT'
,p_column_display_sequence=>50
,p_column_heading=>'Object'
,p_column_link=>'#VIEW_LINK#'
,p_column_linktext=>'#OBJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138865160940510530)
,p_query_column_id=>4
,p_column_alias=>'OWNER'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28418375478516926007)
,p_query_column_id=>5
,p_column_alias=>'VIEW_LINK'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17407957790323141412)
,p_query_column_id=>6
,p_column_alias=>'FAVORITE'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138865829782510536)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_CHANGE_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'When'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138865842371510537)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_CHANGE_MONTH'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23664884451385389242)
,p_query_column_id=>9
,p_column_alias=>'CHANGE_TYPE'
,p_column_display_sequence=>120
,p_column_heading=>'Change'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138866025331510538)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_COLUMN'
,p_column_display_sequence=>110
,p_column_heading=>'Attribute'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138866064482510539)
,p_query_column_id=>11
,p_column_alias=>'OLD_VALUE'
,p_column_display_sequence=>130
,p_column_heading=>'Old Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138866175519510540)
,p_query_column_id=>12
,p_column_alias=>'NEW_VALUE'
,p_column_display_sequence=>140
,p_column_heading=>'New Value'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138866331400510541)
,p_query_column_id=>13
,p_column_alias=>'CHANGED_BY'
,p_column_display_sequence=>150
,p_column_heading=>'Changed By'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14138867085580510549)
,p_query_column_id=>14
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22150398807627188957)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26947239876825541175)
,p_plug_name=>'Items'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14323878884680698391)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22150398807627188957)
,p_button_name=>'refresh'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RR,78::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17407960350853141438)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(22150398807627188957)
,p_button_name=>'Interactive_Report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Interactive Report'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:RR,::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14323872381805698361)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(22150398807627188957)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14138866511725510543)
,p_name=>'P78_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
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
 p_id=>wwv_flow_imp.id(14138866600555510544)
,p_name=>'P78_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Owner'
,p_source=>'OWNER'
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
 p_id=>wwv_flow_imp.id(14138866877272510547)
,p_name=>'P78_CHANGED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Changed By'
,p_source=>'CHANGED_BY'
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
 p_id=>wwv_flow_imp.id(14325032395896784401)
,p_name=>'P78_RELEASE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Release'
,p_source=>'RELEASE'
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
 p_id=>wwv_flow_imp.id(14325032763158784405)
,p_name=>'P78_ATTRIBUTE_COLUMN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Attribute'
,p_source=>'ATTRIBUTE_COLUMN'
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
 p_id=>wwv_flow_imp.id(17407957902350141413)
,p_name=>'P78_FAVORITE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Your Favorite'
,p_source=>'FAVORITE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Yes;Yes'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'D'
,p_fc_show_more_count=>2
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17407957978844141414)
,p_name=>'P78_CHANGE_MONTH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Change Month'
,p_source=>'ATTRIBUTE_CHANGE_MONTH'
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
 p_id=>wwv_flow_imp.id(23664884605081389243)
,p_name=>'P78_CHANGE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Change'
,p_source=>'CHANGE_TYPE'
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
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26947238378620541159)
,p_name=>'P78_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(26947239876825541175)
,p_item_display_point=>'NEXT'
,p_item_default=>'ATTRIBUTE_CHANGE_DATE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Change - Most Recent First;ATTRIBUTE_CHANGE_DATE,Change - Oldest First;ATTRIBUTE_CHANGE_DATE1,Object;OBJECT'
,p_cHeight=>1
,p_tag_css_classes=>'w300 no-item-ui'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-sort-amount-asc'
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28418375308375926005)
,p_name=>'P78_CHANGE_TO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14138866379246510542)
,p_prompt=>'Change to'
,p_source=>'PARENT_TYPE'
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
wwv_flow_imp.component_end;
end;
/

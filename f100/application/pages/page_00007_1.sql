prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Comments'
,p_alias=>'COMMENTS'
,p_step_title=>'Comments'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401355622061234923)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.no-item-ui {',
'  --a-field-input-border-width: 0px;',
'  --a-field-input-background-color: transparent;',
'}',
'',
'.overline {',
'  color: var(--ut-region-text-color, var(--ut-component-text-default-color));',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15472039310014787806)
,p_name=>'&NOMENCLATURE_PROJECT. Comments'
,p_template=>2100526641005906379
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat:t-Comments--iconsRounded'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'       initials user_icon,',
'       created comment_date,',
'       author user_name,',
'       '''' attribute_1,',
'       '''' attribute_2,',
'       '''' attribute_3,',
'       '''' attribute_4,',
'       --',
'       body_html comment_text,',
'       decode(private_yn,''Yes'','' Private Comment'',null) private_comment_label,',
'       action actions,',
'       comment_type,',
'       area,',
'       initiative,',
'       release,',
'       author,',
'       private_yn,',
'       created_yyyyMM,',
'       context,',
'       body',
'from (',
'select :NOMENCLATURE_PROJECT comment_type,',
'       ''project'' internal_type,',
'       a.area,',
'       i.id initiative_id,',
'       i.initiative,',
'       null release_id,',
'       '''' Release,',
'       c.PROJECT_ID,',
'       p.project,',
'       null task_id,',
'       p.project context,',
'       c.body,',
'       c.body_html,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       (select initials from sp_team_members tm where tm.id = c.author_id) initials,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn,',
'       :NOMENCLATURE_PROJECT||'': ''||',
'           ''<a href="''||apex_util.prepare_URL(',
'                            p_url => ''f?p=''||:APP_ID||'':3:''||:APP_SESSION||''::NO:3:P3_PROJECT_ID:''||p.id,',
'                            p_checksum_type => ''3'')||''">''||p.project||''</a>'' action',
'  from SP_PROJECT_COMMENTS c,',
'       sp_projects p,',
'       sp_initiatives i,',
'       sp_areas a ',
' where c.author_id is not null and',
'       p.id = c.project_id and',
'       p.initiative_id = i.id and',
'       i.area_id = a.id and',
'       p.DUPLICATE_OF_PROJECT_ID is null and',
'       p.ARCHIVED_YN = ''N'' and ',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )',
' union all',
'select :NOMENCLATURE_INITIATIVE comment_type,',
'       ''initiative'' internal_type,',
'       a.area,',
'       i.id initiative_id,',
'       i.initiative,',
'       null release_id,',
'       '''' Release,',
'       null PROJECT_ID,',
'       '''' project,',
'       null task_id,',
'       i.initiative context,',
'       c.body,',
'       c.body_html,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       (select initials from sp_team_members tm where tm.id = c.author_id) initials,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn,',
'       :NOMENCLATURE_INITIATIVE||'': ''||',
'           ''<a href="''||apex_util.prepare_URL(',
'                            p_url => ''f?p=''||:APP_ID||'':94:''||:APP_SESSION||''::NO:94:P94_INITIATIVE_ID:''||i.id,',
'                            p_checksum_type => ''3'')||''">''||i.initiative||''</a>'' action',
'from SP_INITIATIVE_COMMENTS c,',
'     sp_initiatives i,',
'     sp_areas a ',
' where c.author_id is not null and',
'       c.initiative_id = i.id and',
'       i.area_id = a.id and',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )',
'union all',
'select ''Release'' comment_type,',
'       ''release'' internal_type,',
'       '''' area,',
'       null initiative_id,',
'       '''' initiative,',
'       r.id release_id,',
'       r.release_train||'' ''||release release,',
'       null PROJECT_ID,',
'       '''' project,',
'       null task_id,',
'       r.release_train||'' ''||release context,',
'       c.body,',
'       c.body_html,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       (select initials from sp_team_members tm where tm.id = c.author_id) initials,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn,',
'       ''Release: ''||',
'           ''<a href="''||apex_util.prepare_URL(',
'                            p_url => ''f?p=''||:APP_ID||'':117:''||:APP_SESSION||''::NO:117:P117_RELEASE_ID:''||r.id,',
'                            p_checksum_type => ''3'')||''">''||r.release_train||'' ''||release||''</a>'' action',
'from SP_RELEASE_COMMENTS c,',
'     sp_release_trains r',
' where c.release_id = r.id and',
'       c.author_id is not null and',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )',
'union all',
'select ''Task'' comment_type,',
'       ''task'' internal_type,',
'       a.area,',
'       i.id initiative_id,',
'       i.initiative,',
'       null release_id,',
'       '''' Release,',
'       t.PROJECT_ID,',
'       p.project,',
'       t.id task_id,',
'       (select task_type from sp_task_types rt where rt.id = t.task_type_id)||',
'           case when t.task_sub_type_id is not null then '': '' end ||',
'           (select task_type from sp_task_types rt where rt.id = t.task_sub_type_id) ||',
'           case when t.task is not null then '' - ''||t.task end context,',
'       c.body,',
'       c.body_html,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       (select initials from sp_team_members tm where tm.id = c.author_id) initials,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn,',
'       ''<a href="''||apex_util.prepare_URL(',
'                            p_url => ''f?p=''||:APP_ID||'':502:''||:APP_SESSION||''::NO:502:P502_PREV_PAGE,P502_PROJECT_ID,P502_TASK_ID:3,''||p.id||'',''||t.id,',
'                            p_checksum_type => ''3'')||''">''||',
'           (select task_type from sp_task_types rt where rt.id = t.task_type_id)||',
'           case when t.task_sub_type_id is not null then '': '' end ||',
'           (select task_type from sp_task_types rt where rt.id = t.task_sub_type_id) ||',
'           case when t.task is not null then '' - ''||t.task end ||''</a>'' action',
'  from SP_TASK_COMMENTS c,',
'       sp_tasks t,',
'       sp_projects p,',
'       sp_initiatives i,',
'       sp_areas a ',
' where c.author_id is not null and',
'       t.id = c.task_id and',
'       t.project_id = p.id and',
'       p.initiative_id = i.id and',
'       i.area_id = a.id and',
'       p.DUPLICATE_OF_PROJECT_ID is null and',
'       p.ARCHIVED_YN = ''N'' and ',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )',
'',
') order by comment_date desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2613168815517880001
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Comments'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472040952117787823)
,p_query_column_id=>1
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>10
,p_column_heading=>'User Icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041099924787824)
,p_query_column_id=>2
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>20
,p_column_heading=>'Comment Date'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041163372787825)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041249566787826)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>40
,p_column_heading=>'Attribute 1'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041612161787829)
,p_query_column_id=>5
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>70
,p_column_heading=>'Attribute 2'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041696834787830)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>80
,p_column_heading=>'Attribute 3'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041774954787831)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>90
,p_column_heading=>'Attribute 4'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041408303787827)
,p_query_column_id=>8
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Comment Text'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if PRIVATE_COMMENT_LABEL/}<strong class="u-danger-text">#PRIVATE_COMMENT_LABEL#</strong><br />{endif/}',
'#COMMENT_TEXT#'))
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042719749787840)
,p_query_column_id=>9
,p_column_alias=>'PRIVATE_COMMENT_LABEL'
,p_column_display_sequence=>180
,p_column_heading=>'Private Comment Label'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041448303787828)
,p_query_column_id=>10
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>60
,p_column_heading=>'Actions'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042527221787838)
,p_query_column_id=>11
,p_column_alias=>'COMMENT_TYPE'
,p_column_display_sequence=>160
,p_column_heading=>'Comment Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041890332787832)
,p_query_column_id=>12
,p_column_alias=>'AREA'
,p_column_display_sequence=>100
,p_column_heading=>'Area'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472041947384787833)
,p_query_column_id=>13
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>110
,p_column_heading=>'Initiative'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042099674787834)
,p_query_column_id=>14
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>120
,p_column_heading=>'Release'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042194130787835)
,p_query_column_id=>15
,p_column_alias=>'AUTHOR'
,p_column_display_sequence=>130
,p_column_heading=>'Author'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042257217787836)
,p_query_column_id=>16
,p_column_alias=>'PRIVATE_YN'
,p_column_display_sequence=>140
,p_column_heading=>'Private Yn'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042638303787839)
,p_query_column_id=>17
,p_column_alias=>'CREATED_YYYYMM'
,p_column_display_sequence=>170
,p_column_heading=>'Created Yyyymm'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042793556787841)
,p_query_column_id=>18
,p_column_alias=>'CONTEXT'
,p_column_display_sequence=>190
,p_column_heading=>'Context'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472042897152787842)
,p_query_column_id=>19
,p_column_alias=>'BODY'
,p_column_display_sequence=>200
,p_column_heading=>'Body'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20054902311851377302)
,p_plug_name=>'Facets'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>810
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(15472039310014787806)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(26015866334451708453)
,p_name=>'&NOMENCLATURE_PROJECT. Comments'
,p_template=>2100526641005906379
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :NOMENCLATURE_PROJECT comment_type,',
'       a.area,',
'       i.id initiative_id,',
'       i.initiative,',
'       null release_id,',
'       '''' Release,',
'       c.PROJECT_ID,',
'       p.project,',
'       null task_id,',
'       '''' task,',
'       dbms_lob.substr(c.body,255,1) the_comment,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn',
'  from SP_PROJECT_COMMENTS c,',
'       sp_projects p,',
'       sp_initiatives i,',
'       sp_areas a ',
' where c.author_id is not null and',
'       p.id = c.project_id and',
'       p.initiative_id = i.id and',
'       i.area_id = a.id and',
'       p.DUPLICATE_OF_PROJECT_ID is null and',
'       p.ARCHIVED_YN = ''N'' and ',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )',
' union all',
'',
'select :NOMENCLATURE_INITIATIVE comment_type,',
'       a.area,',
'       i.id initiative_id,',
'       i.initiative,',
'       null release_id,',
'       '''' Release,',
'       null PROJECT_ID,',
'       '''' project,',
'       null task_id,',
'       '''' task,',
'       dbms_lob.substr(c.body,255,1) the_comment,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn',
'from SP_INITIATIVE_COMMENTS c,',
'     sp_initiatives i,',
'     sp_areas a ',
' where c.author_id is not null and',
'       c.initiative_id = i.id and',
'       i.area_id = a.id and',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )',
'',
'union all',
'',
'select ''Release'' comment_type,',
'       '''' area,',
'       null initiative_id,',
'       '''' initiative,',
'       r.id release_id,',
'       r.release_train||'' ''||release release,',
'       null PROJECT_ID,',
'       '''' project,',
'       null task_id,',
'       '''' task,',
'       dbms_lob.substr(c.body,255,1) the_comment,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn',
'from SP_RELEASE_COMMENTS c,',
'     sp_release_trains r',
' where c.release_id = r.id and',
'       c.author_id is not null and',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )',
'union all',
'',
'select ''Task'' comment_type,',
'       a.area,',
'       i.id initiative_id,',
'       i.initiative,',
'       null release_id,',
'       '''' Release,',
'       t.PROJECT_ID,',
'       p.project,',
'       t.id task_id,',
'       (select task_type from sp_task_types rt where rt.id = t.task_type_id)||',
'           case when t.task_sub_type_id is not null then '': '' end ||',
'           (select task_type from sp_task_types rt where rt.id = t.task_sub_type_id) ||',
'           case when t.task is not null then '' - ''||t.task end task,',
'       dbms_lob.substr(c.body,255,1) the_comment,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = c.author_id) author,',
'       c.AUTHOR_ID,',
'       c.CREATED,',
'       to_char(c.created,''YYYY.MM'') created_yyyyMM,',
'       decode(nvl(c.private_yn,''N''),''N'',''No'',''Y'',''Yes'',''Unknown'') private_yn',
'  from SP_TASK_COMMENTS c,',
'       sp_tasks t,',
'       sp_projects p,',
'       sp_initiatives i,',
'       sp_areas a ',
' where c.author_id is not null and',
'       t.id = c.task_id and',
'       t.project_id = p.id and',
'       p.initiative_id = i.id and',
'       i.area_id = a.id and',
'       p.DUPLICATE_OF_PROJECT_ID is null and',
'       p.ARCHIVED_YN = ''N'' and ',
'       (nvl(c.private_yn,''N'') = ''N'' or lower(c.created_by) = lower(:app_user) )'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15722318756073383850)
,p_query_column_id=>1
,p_column_alias=>'COMMENT_TYPE'
,p_column_display_sequence=>20
,p_column_heading=>'Comment Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443696662990318738)
,p_query_column_id=>2
,p_column_alias=>'AREA'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472038922501787802)
,p_query_column_id=>3
,p_column_alias=>'INITIATIVE_ID'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443696747384318739)
,p_query_column_id=>4
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>50
,p_column_heading=>'Initiative'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:94:P94_INITIATIVE_ID:#INITIATIVE_ID#'
,p_column_linktext=>'#INITIATIVE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472039060402787804)
,p_query_column_id=>5
,p_column_alias=>'RELEASE_ID'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15832356896320183302)
,p_query_column_id=>6
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>60
,p_column_heading=>'Release'
,p_column_link=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:117:P117_RELEASE_ID:#RELEASE_ID#'
,p_column_linktext=>'#RELEASE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443696980256318741)
,p_query_column_id=>7
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443697105040318742)
,p_query_column_id=>8
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>30
,p_column_heading=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:p3_project_id:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472038996210787803)
,p_query_column_id=>9
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15472038823478787801)
,p_query_column_id=>10
,p_column_alias=>'TASK'
,p_column_display_sequence=>40
,p_column_heading=>'Task'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.::P502_PROJECT_ID,P502_TASK_ID,P502_PREV_PAGE:#PROJECT_ID#,#TASK_ID#,3'
,p_column_linktext=>'#TASK#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443697232400318743)
,p_query_column_id=>11
,p_column_alias=>'THE_COMMENT'
,p_column_display_sequence=>70
,p_column_heading=>'Comment'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20054902817618377307)
,p_query_column_id=>12
,p_column_alias=>'AUTHOR'
,p_column_display_sequence=>10
,p_column_heading=>'Author'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:p5_id:#AUTHOR_ID#'
,p_column_linktext=>'#AUTHOR#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443697500147318746)
,p_query_column_id=>13
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443697667455318748)
,p_query_column_id=>14
,p_column_alias=>'CREATED'
,p_column_display_sequence=>80
,p_column_heading=>'Added'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20054903011983377309)
,p_query_column_id=>15
,p_column_alias=>'CREATED_YYYYMM'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13732078235114739650)
,p_query_column_id=>16
,p_column_alias=>'PRIVATE_YN'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(135109718197896793784)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20054599852983366690)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(135109718197896793784)
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
 p_id=>wwv_flow_imp.id(14241837257605515201)
,p_name=>'P7_PRIVATE_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(20054902311851377302)
,p_prompt=>'My Private'
,p_source=>'PRIVATE_YN'
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
 p_id=>wwv_flow_imp.id(15832356786358183301)
,p_name=>'P7_COMMENT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(20054902311851377302)
,p_prompt=>'Comment Type'
,p_source=>'COMMENT_TYPE'
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
 p_id=>wwv_flow_imp.id(20054902361699377303)
,p_name=>'P7_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20054902311851377302)
,p_prompt=>'Search'
,p_source=>'CONTEXT,BODY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20054902484484377304)
,p_name=>'P7_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(20054902311851377302)
,p_prompt=>'&NOMENCLATURE_AREA.'
,p_source=>'AREA'
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
 p_id=>wwv_flow_imp.id(20054902588358377305)
,p_name=>'P7_INITIATIVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(20054902311851377302)
,p_prompt=>'&NOMENCLATURE_INITIATIVE.'
,p_source=>'INITIATIVE'
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
 p_id=>wwv_flow_imp.id(20054902935338377308)
,p_name=>'P7_AUTHOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(20054902311851377302)
,p_prompt=>'Author'
,p_source=>'AUTHOR'
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
 p_id=>wwv_flow_imp.id(20054903130967377310)
,p_name=>'P7_CREATED_YYYYMM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(20054902311851377302)
,p_prompt=>'Month'
,p_source=>'CREATED_YYYYMM'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'DESC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20054642433840366755)
,p_name=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(135109718197896793784)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp.component_end;
end;
/

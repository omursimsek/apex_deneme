prompt --application/pages/page_00202
begin
--   Manifest
--     PAGE: 00202
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
 p_id=>202
,p_name=>'Release Dashboard'
,p_alias=>'RELEASE-DASHBOARD'
,p_step_title=>'Release Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.sp-tag {',
'    padding: 2px 4px;',
'    display: inline-block;',
'    vertical-align: text-bottom;',
'    border-radius: 3px;',
'    background-color: rgba(0,0,0,.1);',
'    text-overflow: ellipsis;',
'    white-space: nowrap;',
'}',
'.sp-tags-container {',
'    display: flex;',
'    align-items: center;',
'    flex-wrap: wrap;',
'    gap: 4px;',
'    justify-content: flex-start;',
'}',
'',
'.resize-region {',
'  resize: vertical;',
'  overflow: auto;',
'}',
'',
'.a-CardView-iconWrap,',
'.a-CardView-badge { align-self: flex-start; }',
'',
'.project-rds-region {',
'    background-color: rgb(219 204 175 / 20%);',
'}',
'.t-Body-title {',
'    --ut-palette-warning-shade: rgba(var(--oj-palette-neutral-rgb-160));',
'    --ut-component-background-color: rgba(var(--oj-palette-neutral-rgb-170)); ',
'    --ut-alert-horizontal-border-radius: 0;',
'}',
'',
'/* Percent Chart Styles */',
':root {',
'  --a-percent-chart-border-radius: 0.125rem;',
'  --a-percent-chart-bar-border-radius: 0.125rem;',
'  --a-percent-chart-bar-background-color: var(--rw-palette-slate-100);',
'  --ut-report-cell-hover-background-color: rgba(0, 0, 0, 0.025);',
'}',
'',
'/* Report Overrides */',
'.a-IRR-header {',
'  box-shadow: inset 0 -1px 0 var(--a-gv-header-cell-border-color);',
'}',
'',
'.t-Report {',
'  background-color: var(--rw-palette-neutral-0);',
'}',
'',
'.t-Report th {',
'  font-size: .6875rem;',
'}',
'',
'.t-Report th,',
'.t-Report td {',
'  border-inline-width: 0;',
'  transition: none;',
'}',
'',
'/* Group borders */',
'th#PCT_10,',
'td[headers="PCT_10"],',
'th#EFFORT_DAYS,',
'td[headers="EFFORT_DAYS"],',
'th#MOST_RECENT_COMMENT,',
'td[headers="MOST_RECENT_COMMENT"],',
'th#SPECS_COMPLETED,',
'td[headers="SPECS_COMPLETED"],',
'th#P1,',
'td[headers="P1"] {',
'  border-inline-start-width: 0.25rem;',
'}',
'',
'th#P1,',
'th#P2,',
'th#P3,',
'th#P4,',
'th#P5,',
'[headers="P1"],',
'[headers="P2"],',
'[headers="P3"],',
'[headers="P4"],',
'[headers="P5"] {',
'  background-color: var(--rw-palette-red-10);',
'}',
'',
'tr:hover th#P1,',
'tr:hover th#P2,',
'tr:hover th#P3,',
'tr:hover th#P4,',
'tr:hover th#P5,',
'tr:hover [headers="P1"],',
'tr:hover [headers="P2"],',
'tr:hover [headers="P3"],',
'tr:hover [headers="P4"],',
'tr:hover [headers="P5"] {',
'  background-color: var(--rw-palette-red-20);',
'}',
'',
'th#PCT_0,',
'th#PCT_10,',
'th#PCT_20,',
'th#PCT_30,',
'th#PCT_40,',
'th#PCT_50,',
'th#PCT_60,',
'th#PCT_70,',
'th#PCT_80,',
'th#PCT_90,',
'th#PCT_100,',
'th#PCT_COMPLETE,',
'[headers="PCT_0"],',
'[headers="PCT_10"],',
'[headers="PCT_20"],',
'[headers="PCT_30"],',
'[headers="PCT_40"],',
'[headers="PCT_50"],',
'[headers="PCT_60"],',
'[headers="PCT_70"],',
'[headers="PCT_80"],',
'[headers="PCT_90"],',
'[headers="PCT_100"],',
'[headers="PCT_COMPLETE"] {',
'  background-color: var(--rw-palette-green-10);',
'}',
'',
'tr:hover th#PCT_0,',
'tr:hover th#PCT_10,',
'tr:hover th#PCT_20,',
'tr:hover th#PCT_30,',
'tr:hover th#PCT_40,',
'tr:hover th#PCT_50,',
'tr:hover th#PCT_60,',
'tr:hover th#PCT_70,',
'tr:hover th#PCT_80,',
'tr:hover th#PCT_90,',
'tr:hover th#PCT_100,',
'tr:hover th#PCT_COMPLETE,',
'tr:hover [headers="PCT_0"],',
'tr:hover [headers="PCT_10"],',
'tr:hover [headers="PCT_20"],',
'tr:hover [headers="PCT_30"],',
'tr:hover [headers="PCT_40"],',
'tr:hover [headers="PCT_50"],',
'tr:hover [headers="PCT_60"],',
'tr:hover [headers="PCT_70"],',
'tr:hover [headers="PCT_80"],',
'tr:hover [headers="PCT_90"],',
'tr:hover [headers="PCT_100"],',
'tr:hover [headers="PCT_COMPLETE"] {',
'  background-color: var(--rw-palette-green-20);',
'}',
'',
'th#EFFORT_DAYS,',
'th#DAYS_COMPLETED,',
'th#DAYS_OUTSTANDING,',
'[headers="EFFORT_DAYS"],',
'[headers="DAYS_COMPLETED"],',
'[headers="DAYS_OUTSTANDING"] {',
'  background-color: var(--rw-palette-blue-10);',
'}',
'',
'tr:hover th#EFFORT_DAYS,',
'tr:hover th#DAYS_COMPLETED,',
'tr:hover th#DAYS_OUTSTANDING,',
'tr:hover [headers="EFFORT_DAYS"],',
'tr:hover [headers="DAYS_COMPLETED"],',
'tr:hover [headers="DAYS_OUTSTANDING"] {',
'  background-color: var(--rw-palette-blue-20);',
'}',
'',
'th#MOST_RECENT_COMMENT,',
'th#CURRENTLY_ACTIVE_PROJECTS,',
'[headers="MOST_RECENT_COMMENT"],',
'[headers="CURRENTLY_ACTIVE_PROJECTS"] {',
'  background-color: var(--rw-palette-plum-10);',
'}',
'',
'tr:hover th#MOST_RECENT_COMMENT,',
'tr:hover th#CURRENTLY_ACTIVE_PROJECTS,',
'tr:hover [headers="MOST_RECENT_COMMENT"],',
'tr:hover [headers="CURRENTLY_ACTIVE_PROJECTS"] {',
'  background-color: var(--rw-palette-plum-20);',
'}',
'',
'h3:first-of-type { margin-top: 0; }'))
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29395532348175743238)
,p_plug_name=>'Dashboard'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31812026081754291065)
,p_name=>'&NOMENCLATURE_PROJECTS. by Priority'
,p_parent_plug_id=>wwv_flow_imp.id(29395532348175743238)
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    ''P''||PRIORITY_ID priority,',
'    project_count,',
'    project_count project_count_chart,',
'    effort_days,',
'    round(sum_pct_complete / project_count) * EFFORT_DAYS * .01 days_completed,',
'    effort_days - round(sum_pct_complete / project_count) * EFFORT_DAYS * .01 as days_outstanding,',
'    round(sum_pct_complete / project_count) pct_complete,',
'    100 - round(sum_pct_complete / project_count) pct_outstanding,',
'    --',
'    -- count of projects with current activity',
'    --',
'    (select count(*) ',
'        from  sp_projects p, SP_ACTIVITIES a',
'        where p.ARCHIVED_YN = ''N'' and ',
'              p.RELEASE_DEPENDENT_YN = ''Y'' and ',
'              p.DUPLICATE_OF_PROJECT_ID is null and ',
'              p.release_id = :P202_RELEASE_ID and',
'              p.id = a.project_id and',
'              sysdate > a.START_DATE and',
'              trunc(sysdate) <= a.END_DATE and',
'              p.priority_id = x.PRIORITY_ID ',
'              ) currently_active_projects,',
'    --',
'    -- most recent comment',
'    --',
'    (select max(c.created) ',
'    from SP_PROJECT_COMMENTS c, sp_projects p ',
'    where c.project_id = p.id and ',
'          p.ARCHIVED_YN = ''N'' and ',
'          p.RELEASE_DEPENDENT_YN = ''Y'' and ',
'          p.DUPLICATE_OF_PROJECT_ID is null and ',
'          p.release_id = :P202_RELEASE_ID and',
'              p.priority_id = x.PRIORITY_ID',
'    ) most_recent_comment,',
'    pct_0, pct_10, pct_20, pct_30, pct_40, pct_50, pct_60, pct_70, pct_80, pct_90, pct_100',
'--',
'--',
'--',
'from (',
'select p.PRIORITY_ID,',
'       count(*) project_count,',
'       sum(s.effort_days) effort_days,',
'       sum(p.pct_complete) sum_pct_complete,',
'       sum(decode(p.pct_complete,0,1,0)) pct_0,',
'       sum(decode(p.pct_complete,10,1,0)) pct_10,',
'       sum(decode(p.pct_complete,20,1,0)) pct_20,',
'       sum(decode(p.pct_complete,30,1,0)) pct_30,',
'       sum(decode(p.pct_complete,40,1,0)) pct_40,',
'       sum(decode(p.pct_complete,50,1,0)) pct_50,',
'       sum(decode(p.pct_complete,60,1,0)) pct_60,',
'       sum(decode(p.pct_complete,70,1,0)) pct_70,',
'       sum(decode(p.pct_complete,80,1,0)) pct_80,',
'       sum(decode(p.pct_complete,90,1,0)) pct_90,',
'       sum(decode(p.pct_complete,100,1,0)) pct_100',
'     from sp_projects p, ',
'          SP_PROJECT_SIZES s,',
'          SP_RELEASE_TRAINS r',
'     where p.release_id = r.id and ',
'           p.PROJECT_SIZE = s.PROJECT_SIZE and',
'           r.id = :P202_RELEASE_ID and',
'           p.ARCHIVED_YN = ''N'' and',
'           p.DUPLICATE_OF_PROJECT_ID is null and',
'           p.RELEASE_DEPENDENT_YN = ''Y''',
'group by ',
'    p.PRIORITY_ID) x',
'order by 1'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P202_RELEASE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_report_total_text_format=>'&nbsp;'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697742288613331215)
,p_query_column_id=>1
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>10
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697749453308331223)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_COUNT'
,p_column_display_sequence=>30
,p_column_heading=>'Project Count'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697747871722331221)
,p_query_column_id=>3
,p_column_alias=>'PROJECT_COUNT_CHART'
,p_column_display_sequence=>40
,p_column_heading=>'Count Graph'
,p_column_format=>'PCT_GRAPH:::'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697748727362331222)
,p_query_column_id=>4
,p_column_alias=>'EFFORT_DAYS'
,p_column_display_sequence=>180
,p_column_heading=>'Budgeted Days of Effort'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697749850219331223)
,p_query_column_id=>5
,p_column_alias=>'DAYS_COMPLETED'
,p_column_display_sequence=>190
,p_column_heading=>'Days Completed'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697743120382331216)
,p_query_column_id=>6
,p_column_alias=>'DAYS_OUTSTANDING'
,p_column_display_sequence=>200
,p_column_heading=>'Days Outstanding'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697750266492331224)
,p_query_column_id=>7
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>160
,p_column_heading=>'Complete'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697748327701331222)
,p_query_column_id=>8
,p_column_alias=>'PCT_OUTSTANDING'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697743459724331216)
,p_query_column_id=>9
,p_column_alias=>'CURRENTLY_ACTIVE_PROJECTS'
,p_column_display_sequence=>220
,p_column_heading=>'Currently Active &NOMENCLATURE_PROJECT. Count'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697749082704331223)
,p_query_column_id=>10
,p_column_alias=>'MOST_RECENT_COMMENT'
,p_column_display_sequence=>210
,p_column_heading=>'Last Comment'
,p_column_format=>'SINCE_SHORT'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697747502496331221)
,p_query_column_id=>11
,p_column_alias=>'PCT_0'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697743857019331217)
,p_query_column_id=>12
,p_column_alias=>'PCT_10'
,p_column_display_sequence=>60
,p_column_heading=>'10%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697744271134331217)
,p_query_column_id=>13
,p_column_alias=>'PCT_20'
,p_column_display_sequence=>70
,p_column_heading=>'20%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697744671804331218)
,p_query_column_id=>14
,p_column_alias=>'PCT_30'
,p_column_display_sequence=>80
,p_column_heading=>'30%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697742669008331216)
,p_query_column_id=>15
,p_column_alias=>'PCT_40'
,p_column_display_sequence=>90
,p_column_heading=>'40%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697745059392331218)
,p_query_column_id=>16
,p_column_alias=>'PCT_50'
,p_column_display_sequence=>100
,p_column_heading=>'50%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697745515220331219)
,p_query_column_id=>17
,p_column_alias=>'PCT_60'
,p_column_display_sequence=>110
,p_column_heading=>'60%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697745912148331219)
,p_query_column_id=>18
,p_column_alias=>'PCT_70'
,p_column_display_sequence=>120
,p_column_heading=>'70%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697746338400331219)
,p_query_column_id=>19
,p_column_alias=>'PCT_80'
,p_column_display_sequence=>130
,p_column_heading=>'80%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697746731311331220)
,p_query_column_id=>20
,p_column_alias=>'PCT_90'
,p_column_display_sequence=>140
,p_column_heading=>'90%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697747059591331220)
,p_query_column_id=>21
,p_column_alias=>'PCT_100'
,p_column_display_sequence=>150
,p_column_heading=>'100%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31812266691609312512)
,p_name=>'&NOMENCLATURE_PROJECTS. by Size'
,p_parent_plug_id=>wwv_flow_imp.id(29395532348175743238)
,p_template=>4072358936313175081
,p_display_sequence=>80
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    PROJECT_SIZE,',
'    EFFORT_DAYS,   -- budgeted days of effort',
'    SIZE_DESCRIPTION,',
'    effort_days_per_proj,',
'    project_count,',
'    project_count project_count_pct_graph,',
'    round(sum_pct_complete / project_count) pct_complete,',
'    100 - round(sum_pct_complete / project_count) pct_outstanding,',
'    --',
'    round(((sum_pct_complete / project_count) * EFFORT_DAYS) * .01) days_completed,',
'    EFFORT_DAYS - round(((sum_pct_complete / project_count) * EFFORT_DAYS) * .01) days_outstanding,',
'    --',
'    -- currently active projects',
'    --',
'    (select count(*) ',
'        from  sp_projects p, SP_ACTIVITIES a',
'        where p.ARCHIVED_YN = ''N'' and ',
'              p.RELEASE_DEPENDENT_YN = ''Y'' and ',
'              p.DUPLICATE_OF_PROJECT_ID is null and ',
'              p.release_id = :P202_RELEASE_ID and',
'              p.id = a.project_id and',
'              sysdate > a.START_DATE and',
'              trunc(sysdate) <= a.END_DATE and',
'              p.PROJECT_SIZE = x.PROJECT_SIZE',
'              ) currently_active_projects,',
'    --',
'    -- most recent comment',
'    --',
'    (select max(c.created) ',
'    from SP_PROJECT_COMMENTS c, sp_projects p ',
'    where c.project_id = p.id and ',
'          p.ARCHIVED_YN = ''N'' and ',
'          p.RELEASE_DEPENDENT_YN = ''Y'' and ',
'          p.DUPLICATE_OF_PROJECT_ID is null and ',
'          p.release_id = :P202_RELEASE_ID and',
'          x.project_size = p.project_size',
'    ) most_recent_comment,',
'    --',
'    -- project distribution by percent complete',
'    --',
'    pct_0, pct_10, pct_20, pct_30, pct_40, pct_50, pct_60, pct_70, pct_80, pct_90, pct_100,',
'    --',
'    -- project priorities',
'    --',
'    p1, p2, p3, p4, p5',
'--',
'--',
'--',
'from (',
'select s.PROJECT_SIZE,',
'       sum(s.EFFORT_DAYS) effort_days,',
'       s.SIZE_DESCRIPTION,',
'       s.effort_days effort_days_per_proj,',
'       count(*) project_count,',
'       sum(p.pct_complete * EFFORT_DAYS * .01) days_completed,',
'       sum(p.pct_complete) sum_pct_complete,',
'       --',
'       -- percent complete distribution',
'       --',
'       sum(decode(p.pct_complete,0,1,0)) pct_0,',
'       sum(decode(p.pct_complete,10,1,0)) pct_10,',
'       sum(decode(p.pct_complete,20,1,0)) pct_20,',
'       sum(decode(p.pct_complete,30,1,0)) pct_30,',
'       sum(decode(p.pct_complete,40,1,0)) pct_40,',
'       sum(decode(p.pct_complete,50,1,0)) pct_50,',
'       sum(decode(p.pct_complete,60,1,0)) pct_60,',
'       sum(decode(p.pct_complete,70,1,0)) pct_70,',
'       sum(decode(p.pct_complete,80,1,0)) pct_80,',
'       sum(decode(p.pct_complete,90,1,0)) pct_90,',
'       sum(decode(p.pct_complete,100,1,0)) pct_100,',
'       --',
'       -- priority distribution',
'       --',
'       sum(decode(pp.PRIORITY,1,1,0)) p1,',
'       sum(decode(pp.PRIORITY,2,1,0)) p2,',
'       sum(decode(pp.PRIORITY,3,1,0)) p3,',
'       sum(decode(pp.PRIORITY,4,1,0)) p4,',
'       sum(decode(pp.PRIORITY,5,1,0)) p5',
'     from sp_projects p, ',
'          SP_PROJECT_PRIORITIES pp,',
'          SP_PROJECT_SIZES s,',
'          SP_RELEASE_TRAINS r',
'     where p.release_id = r.id and ',
'           p.PRIORITY_ID = pp.id and',
'           p.PROJECT_SIZE = s.PROJECT_SIZE and',
'           r.id = :P202_RELEASE_ID and',
'           p.ARCHIVED_YN = ''N'' and',
'           p.DUPLICATE_OF_PROJECT_ID is null and',
'           p.RELEASE_DEPENDENT_YN = ''Y''',
'group by ',
'    s.PROJECT_SIZE,',
'    s.SIZE_DESCRIPTION,',
'    s.effort_days) x',
'order by 5 desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P202_RELEASE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_report_total_text_format=>'&nbsp;'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697760961510331235)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>10
,p_column_heading=>'Size'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697761422629331236)
,p_query_column_id=>2
,p_column_alias=>'EFFORT_DAYS'
,p_column_display_sequence=>260
,p_column_heading=>'Budgeted Days of Effort'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697761815027331236)
,p_query_column_id=>3
,p_column_alias=>'SIZE_DESCRIPTION'
,p_column_display_sequence=>30
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697763367170331238)
,p_query_column_id=>4
,p_column_alias=>'EFFORT_DAYS_PER_PROJ'
,p_column_display_sequence=>40
,p_column_heading=>'Days per &NOMENCLATURE_PROJECT.'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697762225779331236)
,p_query_column_id=>5
,p_column_alias=>'PROJECT_COUNT'
,p_column_display_sequence=>60
,p_column_heading=>'&NOMENCLATURE_PROJECT. Count'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697758627526331233)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_COUNT_PCT_GRAPH'
,p_column_display_sequence=>70
,p_column_heading=>'Count Graph'
,p_column_format=>'PCT_GRAPH:::'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697758200028331232)
,p_query_column_id=>7
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>240
,p_column_heading=>'Complete'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697762633581331237)
,p_query_column_id=>8
,p_column_alias=>'PCT_OUTSTANDING'
,p_column_display_sequence=>250
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697752953544331227)
,p_query_column_id=>9
,p_column_alias=>'DAYS_COMPLETED'
,p_column_display_sequence=>270
,p_column_heading=>'Days Completed'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697763009271331237)
,p_query_column_id=>10
,p_column_alias=>'DAYS_OUTSTANDING'
,p_column_display_sequence=>280
,p_column_heading=>'Days Outstanding'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697757786619331232)
,p_query_column_id=>11
,p_column_alias=>'CURRENTLY_ACTIVE_PROJECTS'
,p_column_display_sequence=>300
,p_column_heading=>'Currently Active'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697752610589331227)
,p_query_column_id=>12
,p_column_alias=>'MOST_RECENT_COMMENT'
,p_column_display_sequence=>290
,p_column_heading=>'Last Comment'
,p_column_format=>'SINCE_SHORT'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697753423084331228)
,p_query_column_id=>13
,p_column_alias=>'PCT_0'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697753800157331228)
,p_query_column_id=>14
,p_column_alias=>'PCT_10'
,p_column_display_sequence=>140
,p_column_heading=>'10%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697754196639331228)
,p_query_column_id=>15
,p_column_alias=>'PCT_20'
,p_column_display_sequence=>150
,p_column_heading=>'20%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697754638019331229)
,p_query_column_id=>16
,p_column_alias=>'PCT_30'
,p_column_display_sequence=>160
,p_column_heading=>'30%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697755011376331229)
,p_query_column_id=>17
,p_column_alias=>'PCT_40'
,p_column_display_sequence=>170
,p_column_heading=>'40%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697755400390331230)
,p_query_column_id=>18
,p_column_alias=>'PCT_50'
,p_column_display_sequence=>180
,p_column_heading=>'50%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697755801788331230)
,p_query_column_id=>19
,p_column_alias=>'PCT_60'
,p_column_display_sequence=>190
,p_column_heading=>'60%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697756159014331230)
,p_query_column_id=>20
,p_column_alias=>'PCT_70'
,p_column_display_sequence=>200
,p_column_heading=>'70%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697756562152331231)
,p_query_column_id=>21
,p_column_alias=>'PCT_80'
,p_column_display_sequence=>210
,p_column_heading=>'80%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697757038110331231)
,p_query_column_id=>22
,p_column_alias=>'PCT_90'
,p_column_display_sequence=>220
,p_column_heading=>'90%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697757368995331231)
,p_query_column_id=>23
,p_column_alias=>'PCT_100'
,p_column_display_sequence=>230
,p_column_heading=>'100%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697758991508331233)
,p_query_column_id=>24
,p_column_alias=>'P1'
,p_column_display_sequence=>80
,p_column_heading=>'P1'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697759371432331233)
,p_query_column_id=>25
,p_column_alias=>'P2'
,p_column_display_sequence=>90
,p_column_heading=>'P2'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697759754742331234)
,p_query_column_id=>26
,p_column_alias=>'P3'
,p_column_display_sequence=>100
,p_column_heading=>'P3'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697760169191331234)
,p_query_column_id=>27
,p_column_alias=>'P4'
,p_column_display_sequence=>110
,p_column_heading=>'P4'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697760579356331235)
,p_query_column_id=>28
,p_column_alias=>'P5'
,p_column_display_sequence=>120
,p_column_heading=>'P5'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31813017217791723471)
,p_name=>'&NOMENCLATURE_PROJECTS. by Owner'
,p_parent_plug_id=>wwv_flow_imp.id(29395532348175743238)
,p_template=>4072358936313175081
,p_display_sequence=>90
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    decode(owner_id,0,''Unknown'',(select first_Name||'' ''||last_name from sp_team_members tm where tm.id = x.owner_id)) project_owner,',
'    nvl((select id from sp_team_members tm where tm.id = x.owner_id),0) team_member_id,',
'    project_count project_count_graph,',
'    project_count,',
'    effort_days,',
'    days_completed,',
'    effort_days - days_completed as days_outstanding,',
'    round(sum_pct_complete / project_count) pct_complete,',
'    100 - round(sum_pct_complete / project_count) pct_outstanding,',
'    --',
'    -- currently active projects',
'    --',
'    (select count(*) ',
'        from  sp_projects p, SP_ACTIVITIES a',
'        where p.ARCHIVED_YN = ''N'' and ',
'              p.RELEASE_DEPENDENT_YN = ''Y'' and ',
'              p.DUPLICATE_OF_PROJECT_ID is null and ',
'              p.release_id = :P202_RELEASE_ID and',
'              p.id = a.project_id and',
'              sysdate > a.START_DATE and',
'              trunc(sysdate) <= a.END_DATE and',
'              p.owner_id = x.owner_id',
'              ) currently_active_projects,',
'    --',
'    -- most recent comment',
'    --',
'    (select max(c.created) ',
'    from SP_PROJECT_COMMENTS c, sp_projects p ',
'    where c.project_id = p.id and ',
'          p.ARCHIVED_YN = ''N'' and ',
'          p.RELEASE_DEPENDENT_YN = ''Y'' and ',
'          p.DUPLICATE_OF_PROJECT_ID is null and ',
'          p.release_id = :P202_RELEASE_ID and',
'          x.owner_id = p.owner_id',
'    ) most_recent_comment,',
'    --',
'    -- project distribution by pct complete',
'    --',
'    pct_0, pct_10, pct_20, pct_30, pct_40, pct_50, pct_60, pct_70, pct_80, pct_90, pct_100,',
'    --',
'    -- Priorities',
'    --',
'    p1, p2, p3, p4, p5',
'from (',
'select nvl(p.owner_id,0) owner_id,',
'       count(*) project_count,',
'       sum(effort_days) effort_days,',
'       sum(p.pct_complete * EFFORT_DAYS * .01) days_completed,',
'       sum(p.pct_complete) sum_pct_complete,',
'       --',
'       --',
'       --',
'       sum(decode(p.pct_complete,0,1,0)) pct_0,',
'       sum(decode(p.pct_complete,10,1,0)) pct_10,',
'       sum(decode(p.pct_complete,20,1,0)) pct_20,',
'       sum(decode(p.pct_complete,30,1,0)) pct_30,',
'       sum(decode(p.pct_complete,40,1,0)) pct_40,',
'       sum(decode(p.pct_complete,50,1,0)) pct_50,',
'       sum(decode(p.pct_complete,60,1,0)) pct_60,',
'       sum(decode(p.pct_complete,70,1,0)) pct_70,',
'       sum(decode(p.pct_complete,80,1,0)) pct_80,',
'       sum(decode(p.pct_complete,90,1,0)) pct_90,',
'       sum(decode(p.pct_complete,100,1,0)) pct_100,',
'       --',
'       -- priority distribution',
'       --',
'       sum(decode(pp.PRIORITY,1,1,0)) p1,',
'       sum(decode(pp.PRIORITY,2,1,0)) p2,',
'       sum(decode(pp.PRIORITY,3,1,0)) p3,',
'       sum(decode(pp.PRIORITY,4,1,0)) p4,',
'       sum(decode(pp.PRIORITY,5,1,0)) p5',
'     from sp_projects p, ',
'          SP_PROJECT_SIZES s,',
'          SP_RELEASE_TRAINS r,',
'          SP_PROJECT_PRIORITIES pp',
'     where p.release_id = r.id and ',
'           p.PROJECT_SIZE = s.PROJECT_SIZE and',
'           r.id = :P202_RELEASE_ID and',
'           p.ARCHIVED_YN = ''N'' and',
'           p.DUPLICATE_OF_PROJECT_ID is null and',
'           p.RELEASE_DEPENDENT_YN = ''Y'' and',
'           p.priority_id = pp.id',
'group by  ',
'    nvl(p.owner_id,0)) x',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P202_RELEASE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'&nbsp;'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697775302945331252)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_OWNER'
,p_column_display_sequence=>10
,p_column_heading=>'Owner'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:#TEAM_MEMBER_ID#'
,p_column_linktext=>'#PROJECT_OWNER#'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697774464944331251)
,p_query_column_id=>2
,p_column_alias=>'TEAM_MEMBER_ID'
,p_column_display_sequence=>330
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697777695844331254)
,p_query_column_id=>3
,p_column_alias=>'PROJECT_COUNT_GRAPH'
,p_column_display_sequence=>40
,p_column_heading=>'Count Graph'
,p_column_format=>'PCT_GRAPH:::'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697775686343331252)
,p_query_column_id=>4
,p_column_alias=>'PROJECT_COUNT'
,p_column_display_sequence=>30
,p_column_heading=>'&NOMENCLATURE_PROJECT. Count'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697774889651331252)
,p_query_column_id=>5
,p_column_alias=>'EFFORT_DAYS'
,p_column_display_sequence=>220
,p_column_heading=>'Budgeted Days of Effort'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697776086771331253)
,p_query_column_id=>6
,p_column_alias=>'DAYS_COMPLETED'
,p_column_display_sequence=>230
,p_column_heading=>'Days Completed'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697776500315331253)
,p_query_column_id=>7
,p_column_alias=>'DAYS_OUTSTANDING'
,p_column_display_sequence=>240
,p_column_heading=>'Days Outstanding'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697776893540331254)
,p_query_column_id=>8
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>210
,p_column_heading=>'Complete'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697777243223331254)
,p_query_column_id=>9
,p_column_alias=>'PCT_OUTSTANDING'
,p_column_display_sequence=>250
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697767311246331244)
,p_query_column_id=>10
,p_column_alias=>'CURRENTLY_ACTIVE_PROJECTS'
,p_column_display_sequence=>270
,p_column_heading=>'Currently Active &NOMENCLATURE_PROJECT. Count'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697767665232331244)
,p_query_column_id=>11
,p_column_alias=>'MOST_RECENT_COMMENT'
,p_column_display_sequence=>260
,p_column_heading=>'Last Comment'
,p_column_format=>'SINCE_SHORT'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697768138635331245)
,p_query_column_id=>12
,p_column_alias=>'PCT_0'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697768451106331245)
,p_query_column_id=>13
,p_column_alias=>'PCT_10'
,p_column_display_sequence=>110
,p_column_heading=>'10%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697768898796331245)
,p_query_column_id=>14
,p_column_alias=>'PCT_20'
,p_column_display_sequence=>120
,p_column_heading=>'20%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697769296397331246)
,p_query_column_id=>15
,p_column_alias=>'PCT_30'
,p_column_display_sequence=>130
,p_column_heading=>'30%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697769672420331246)
,p_query_column_id=>16
,p_column_alias=>'PCT_40'
,p_column_display_sequence=>140
,p_column_heading=>'40%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697770138541331247)
,p_query_column_id=>17
,p_column_alias=>'PCT_50'
,p_column_display_sequence=>150
,p_column_heading=>'50%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697770459562331247)
,p_query_column_id=>18
,p_column_alias=>'PCT_60'
,p_column_display_sequence=>160
,p_column_heading=>'60%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697770868087331248)
,p_query_column_id=>19
,p_column_alias=>'PCT_70'
,p_column_display_sequence=>170
,p_column_heading=>'70%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697771304003331248)
,p_query_column_id=>20
,p_column_alias=>'PCT_80'
,p_column_display_sequence=>180
,p_column_heading=>'80%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697771658676331249)
,p_query_column_id=>21
,p_column_alias=>'PCT_90'
,p_column_display_sequence=>190
,p_column_heading=>'90%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697772041427331249)
,p_query_column_id=>22
,p_column_alias=>'PCT_100'
,p_column_display_sequence=>200
,p_column_heading=>'100%'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697772495513331249)
,p_query_column_id=>23
,p_column_alias=>'P1'
,p_column_display_sequence=>50
,p_column_heading=>'P1'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697772858780331250)
,p_query_column_id=>24
,p_column_alias=>'P2'
,p_column_display_sequence=>60
,p_column_heading=>'P2'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697773251840331250)
,p_query_column_id=>25
,p_column_alias=>'P3'
,p_column_display_sequence=>70
,p_column_heading=>'P3'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697773684150331250)
,p_query_column_id=>26
,p_column_alias=>'P4'
,p_column_display_sequence=>80
,p_column_heading=>'P4'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697774069820331251)
,p_query_column_id=>27
,p_column_alias=>'P5'
,p_column_display_sequence=>90
,p_column_heading=>'P5'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(56145530726301338799)
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
 p_id=>wwv_flow_imp.id(60219684361930550733)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(56145530726301338799)
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
 p_id=>wwv_flow_imp.id(60219685595436550745)
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
 p_id=>wwv_flow_imp.id(76394505535333384522)
,p_name=>'Release'
,p_template=>4072358936313175081
,p_display_sequence=>40
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
' where r.id = :P202_RELEASE_ID and ',
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
 p_id=>wwv_flow_imp.id(24697049227344190501)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697049606431190501)
,p_query_column_id=>2
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697046828647190497)
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
 p_id=>wwv_flow_imp.id(24697047607397190498)
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
 p_id=>wwv_flow_imp.id(24697050034812190502)
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
 p_id=>wwv_flow_imp.id(24697047972394190499)
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
 p_id=>wwv_flow_imp.id(24697048352720190499)
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
 p_id=>wwv_flow_imp.id(24697050355643190502)
,p_query_column_id=>8
,p_column_alias=>'OWNER'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697051233311190504)
,p_query_column_id=>9
,p_column_alias=>'RELEASE_OPENED'
,p_column_display_sequence=>180
,p_column_heading=>'Release Opened'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24697045983619190495)
,p_query_column_id=>10
,p_column_alias=>'RELEASE_COMPLETED'
,p_column_display_sequence=>170
,p_column_heading=>'Release Completed'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24697016141039184132)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(56145530726301338799)
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
 p_id=>wwv_flow_imp.id(38179703577173589235)
,p_name=>'P202_RELEASE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(76394505535333384522)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39158587540368727892)
,p_name=>'P202_RELEASE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(76394505535333384522)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24699569557970356354)
,p_computation_sequence=>30
,p_computation_item=>'P202_RELEASE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select release_train||'' ''||release d from sp_release_trains where id = :P202_RELEASE_ID'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(60219684662509550736)
,p_region_id=>wwv_flow_imp.id(60219684361930550733)
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
 p_id=>wwv_flow_imp.id(23716707022513903138)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release Calendar'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:RP,203:P203_RELEASE_ID:&P202_RELEASE_ID.'
,p_icon_css_classes=>'fa-calendar-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23716707130528903139)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release History'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_RELEASE_ID:&P202_RELEASE_ID.'
,p_icon_css_classes=>'fa-clock-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23716707230768903140)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release Home'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,:P117_RELEASE_ID:&P202_RELEASE_ID.'
,p_icon_css_classes=>'fa-ship'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23716707955804903148)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>70
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(46237890484476614886)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Release &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP,300:P300_RELEASE_ID:&P202_RELEASE_ID.'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(60219684742169550737)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(60219685368416550743)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.:RR,202:P202_RELEASE_ID:&P202_RELEASE_ID.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(60219685512435550744)
,p_component_action_id=>wwv_flow_imp.id(60219684662509550736)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>20
);
wwv_flow_imp.component_end;
end;
/

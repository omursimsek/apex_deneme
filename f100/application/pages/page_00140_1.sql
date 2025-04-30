prompt --application/pages/page_00140
begin
--   Manifest
--     PAGE: 00140
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
 p_id=>140
,p_name=>'Activity Quick Look'
,p_alias=>'ACTIVITY-QUICK-LOOK1'
,p_page_mode=>'MODAL'
,p_step_title=>'Activity Quick Look'
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
'}'))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(14305292795833472671)
,p_name=>'Activity'
,p_template=>4501440665235496320
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ap.ID,',
'       ap.ACTIVITY_TYPE_ID,',
'       (select activity_type from SP_ACTIVITY_TYPES at where at.id = ap.ACTIVITY_TYPE_ID) activity_type,',
'       ap.PROJECT_ID,',
'       nvl((select project from sp_projects p where p.id = ap.project_id),''Non Specified'') project,',
'       ap.TEAM_MEMBER_ID,',
'       decode(tm.first_name,null,tm.email,tm.first_Name||'' ''||tm.last_name||'' (''||tm.email||'')'') name,',
'       trunc(ap.END_DATE) - trunc(ap.START_DATE) activity_length,',
'       to_char(ap.START_DATE,''FMDay DD-MON-YYYY'')|| '' - ''||to_char(ap.END_DATE,''FMDay DD-MON-YYYY'') dates,',
'       decode(',
'           greatest(trunc(sysdate),trunc(ap.end_date)),',
'           trunc(sysdate),',
'           ''Past'',',
'           decode(',
'               greatest(trunc(sysdate),trunc(ap.start_date)),',
'               trunc(sysdate),',
'               ''Current'',',
'               ''Future'')',
'           ) timeframe,',
'       ap.COMMENTS,',
'       apex_util.get_since(ap.CREATED) created,',
'       lower(ap.CREATED_BY) CREATED_BY,',
'       apex_util.get_since(ap.UPDATED) updated,',
'       lower(ap.UPDATED_BY) UPDATED_BY,',
'       sp_date_range_pct_comp(ap.start_date, ap.end_date)||''%'' time_elapesed,',
'       ap.URL',
'  from sp_activities ap, ',
'       sp_team_Members tm',
' where ap.id = :P140_ID and',
'       ap.team_member_id = tm.id(+)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_ID'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179430754262531492)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>0
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_hidden_column=>'Y'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179431175332531492)
,p_query_column_id=>2
,p_column_alias=>'ACTIVITY_TYPE_ID'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179430029682531491)
,p_query_column_id=>3
,p_column_alias=>'ACTIVITY_TYPE'
,p_column_display_sequence=>32
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179431619420531493)
,p_query_column_id=>4
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>82
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179434354008531496)
,p_query_column_id=>5
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>102
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179431985199531493)
,p_query_column_id=>6
,p_column_alias=>'TEAM_MEMBER_ID'
,p_column_display_sequence=>92
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179430354997531491)
,p_query_column_id=>7
,p_column_alias=>'NAME'
,p_column_display_sequence=>22
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179435195697531496)
,p_query_column_id=>8
,p_column_alias=>'ACTIVITY_LENGTH'
,p_column_display_sequence=>62
,p_column_heading=>'Activity Length'
,p_column_html_expression=>'#ACTIVITY_LENGTH# Days, #TIME_ELAPESED# elapsed'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179435636560531497)
,p_query_column_id=>9
,p_column_alias=>'DATES'
,p_column_display_sequence=>42
,p_column_heading=>'Dates'
,p_column_html_expression=>'<strong>#TIMEFRAME#</strong>: #DATES#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155076719173924709)
,p_query_column_id=>10
,p_column_alias=>'TIMEFRAME'
,p_column_display_sequence=>52
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179432389345531493)
,p_query_column_id=>11
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>12
,p_column_heading=>'Activity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179432836856531494)
,p_query_column_id=>12
,p_column_alias=>'CREATED'
,p_column_display_sequence=>132
,p_column_heading=>'Created'
,p_column_html_expression=>'#CREATED# by #CREATED_BY#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179433143481531494)
,p_query_column_id=>13
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>142
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179433633042531495)
,p_query_column_id=>14
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>152
,p_column_heading=>'Updated'
,p_column_html_expression=>'#UPDATED# by #UPDATED_BY#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179433962364531495)
,p_query_column_id=>15
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>162
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179434825789531496)
,p_query_column_id=>16
,p_column_alias=>'TIME_ELAPESED'
,p_column_display_sequence=>72
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155077617420924718)
,p_query_column_id=>17
,p_column_alias=>'URL'
,p_column_display_sequence=>122
,p_column_heading=>'URL'
,p_column_link=>'#URL#'
,p_column_linktext=>'#URL#'
,p_column_link_attr=>'target="_blank" title="open link in new browser tab"'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from SP_ACTIVITIES',
'where id = :P140_ID and URL is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15702846076319490508)
,p_name=>'Associated &NOMENCLATURE_INITIATIVE.'
,p_template=>2664334895415463485
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.ID initiative_id,',
'       f.area,',
'       i.initiative initiative,',
'       nvl((select t.first_name||'' ''||t.last_name from sp_team_members t where t.id = i.SPONSOR_ID),''No Owner'') initiative_owner,',
'       i.OBJECTIVE description',
'from ',
'       SP_INITIATIVES i,',
'       SP_AREAS f,',
'       sp_activities a',
'where ',
'      a.id = :P140_ID and',
'      i.area_id = f.id and',
'      i.id = a.initiative_id and ',
'      a.initiative_id is not null'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from SP_ACTIVITIES a',
'where a.id = :P140_ID and a.initiative_id is not null'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_ID'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No &NOMENCLATURE_PROJECT. found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702848646418490534)
,p_query_column_id=>1
,p_column_alias=>'INITIATIVE_ID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702846358607490511)
,p_query_column_id=>2
,p_column_alias=>'AREA'
,p_column_display_sequence=>20
,p_column_heading=>'&NOMENCLATURE_INITIATIVE. &NOMENCLATURE_AREA.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702846467986490512)
,p_query_column_id=>3
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>10
,p_column_heading=>'&NOMENCLATURE_INITIATIVE.'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,94:P94_INITIATIVE_ID:#INITIATIVE_ID#'
,p_column_linktext=>'#INITIATIVE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702848837274490535)
,p_query_column_id=>4
,p_column_alias=>'INITIATIVE_OWNER'
,p_column_display_sequence=>50
,p_column_heading=>' &NOMENCLATURE_INITIATIVE. Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702848854249490536)
,p_query_column_id=>5
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>60
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20030240208445199849)
,p_name=>'Associated &NOMENCLATURE_PROJECT.'
,p_template=>2664334895415463485
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.ID,',
'       f.area,',
'       i.initiative initiative,',
'       nvl((select t.first_name||'' ''||t.last_name from sp_team_members t where t.id = p.OWNER_ID),''No Owner'') the_owner,',
'       p.owner_id,',
'       p.TARGET_COMPLETE,',
'       p.project,',
'       --',
'       nvl((select ''<span class="fa fa-heart u-danger-text" aria-hidden="true"></span>'' ',
'            from sp_favorites fav',
'            where fav.project_id = p.id and ',
'                  fav.team_member_id = :APP_USER_ID),',
'            ''<span class="fa fa-heart-o" aria-hidden="true"></span>'') favorite_icon,',
'       --',
'       p.PCT_COMPLETE||''%'' PCT_COMPLETE,',
'       nvl((select ''P''||priority from sp_project_priorities pp where pp.id = p.priority_id),''Not Prioritized'') priority,',
'       null attributes,',
'       --',
'       -- optional release association',
'       --',
'       (select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id and p.RELEASE_DEPENDENT_YN = ''Y'') release,',
'       decode(p.RELEASE_DEPENDENT_YN,''Y'',p.release_id,null) release_id,',
'       --',
'       -- optional project targeted date',
'       --',
'       decode(p.RELEASE_DEPENDENT_YN,''N'',',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''DD-MON-YYYY'')',
'               )) targeted_date,',
'       --',
'       --',
'       --',
'       lower(p.TAGS) tags,',
'       lower(p.CREATED_BY)||'' ''||apex_util.get_since(p.CREATED) created,',
'       lower(p.UPDATED_BY)||'' ''||apex_util.get_since(p.updated) updated,',
'       --',
'       p.PROJECT_SIZE,',
'       p.project_url_name,',
'       p.friendly_identifier friendly_identifier1',
'  from SP_PROJECTS p, ',
'       SP_INITIATIVES i,',
'       SP_AREAS f,',
'       SP_PROJECT_SIZES s',
'where ',
'      p.archived_yn = ''N'' and',
'      p.initiative_id = i.id and',
'      i.area_id = f.id and',
'      p.PROJECT_SIZE = s.project_size and',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.id = (select project_id from sp_activities ap where ap.id = :P140_ID)'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from SP_ACTIVITIES a',
'where a.id = :P140_ID and a.project_id is not null'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P140_ID'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No &NOMENCLATURE_PROJECT. found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179251989758191290)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15615977949820975150)
,p_query_column_id=>2
,p_column_alias=>'AREA'
,p_column_display_sequence=>50
,p_column_heading=>'&NOMENCLATURE_AREA.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702845356098490501)
,p_query_column_id=>3
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>60
,p_column_heading=>'&NOMENCLATURE_INITIATIVE.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179252397884191291)
,p_query_column_id=>4
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>70
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179252756394191292)
,p_query_column_id=>5
,p_column_alias=>'OWNER_ID'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179253240905191293)
,p_query_column_id=>6
,p_column_alias=>'TARGET_COMPLETE'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'NOT_EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sp_projects',
'where id = :P140_ID and ',
'      RELEASE_DEPENDENT_YN = ''Y'' and',
'      RELEASE_ID is not null',
'      '))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179259619666191307)
,p_query_column_id=>7
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>40
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:FI,PN:#FRIENDLY_IDENTIFIER1#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_column_link_attr=>'title="navigate to detail view"'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179259181347191306)
,p_query_column_id=>8
,p_column_alias=>'FAVORITE_ICON'
,p_column_display_sequence=>270
,p_column_heading=>'My Favorite'
,p_column_link=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:RP,128:P128_PROJECT_ID:#ID#'
,p_column_linktext=>'#FAVORITE_ICON#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179260025844191308)
,p_query_column_id=>9
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>260
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179254414706191297)
,p_query_column_id=>10
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179251631566191289)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTES'
,p_column_display_sequence=>110
,p_column_heading=>'Attributes'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sp-tags-container">',
'    <span class="sp-tag">#PRIORITY#</span>',
'    <span class="sp-tag">#PROJECT_SIZE#</span>',
'    <span class="sp-tag">#PCT_COMPLETE#</span>',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179254767167191298)
,p_query_column_id=>12
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>160
,p_column_heading=>'Release'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sp_projects P  ',
'where p.RELEASE_DEPENDENT_YN = ''Y'' ',
'  and p.release_id is not null ',
'  and p.id = (select project_id from SP_ACTIVITIES a where a.id = :P140_ID)',
''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15615977912389975149)
,p_query_column_id=>13
,p_column_alias=>'RELEASE_ID'
,p_column_display_sequence=>280
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702845533594490502)
,p_query_column_id=>14
,p_column_alias=>'TARGETED_DATE'
,p_column_display_sequence=>170
,p_column_heading=>'Target Completion'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sp_projects P  ',
'where p.RELEASE_DEPENDENT_YN = ''N'' ',
'  and p.TARGET_COMPLETE is not null ',
'  and p.id = (select project_id from SP_ACTIVITIES a where a.id = :P140_ID)'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15615977831298975148)
,p_query_column_id=>15
,p_column_alias=>'TAGS'
,p_column_display_sequence=>230
,p_column_heading=>'Tags'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179255186876191298)
,p_query_column_id=>16
,p_column_alias=>'CREATED'
,p_column_display_sequence=>240
,p_column_heading=>'Created'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179255595901191299)
,p_query_column_id=>17
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>250
,p_column_heading=>'Updated'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179256036261191300)
,p_query_column_id=>18
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>190
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179256427596191300)
,p_query_column_id=>19
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13179256762792191301)
,p_query_column_id=>20
,p_column_alias=>'FRIENDLY_IDENTIFIER1'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14241706072804564735)
,p_name=>'P140_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14305292795833472671)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/

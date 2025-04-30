prompt --application/pages/page_00113
begin
--   Manifest
--     PAGE: 00113
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
 p_id=>113
,p_name=>'My Projects'
,p_alias=>'MY-PROJECTS'
,p_step_title=>'My &NOMENCLATURE_PROJECTS.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(() => { ',
'    apex.actions.add({',
'        name: ''favoriteProject'',',
'        action: function(event, focusElement, args) {',
'            $(event.currentTarget).addClass(''js-project-to-favorite'');',
'            apex.item(''P113_PROJECT_TO_FAVORITE'').setValue(args.id);',
'            return true;',
'            }',
'    });',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.no-item-ui {',
'  --a-field-input-border-width: 0px;',
'  --a-field-input-background-color: transparent;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11640037816791298224)
,p_plug_name=>'Filter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(11993470745869942919)
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
 p_id=>wwv_flow_imp.id(11855783090405318606)
,p_plug_name=>'User'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11993470745869942919)
,p_plug_name=>'Content Row'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id, initiative_id, focus_area, focus_area_id, initiative, icon, project, the_owner, owner_id, target_complete, status, priority,',
'       release, favorite, favorite_icon, tags, created, updated_since, updated, project_size, ',
'       project_url_name, friendly_identifier1, user_association, active_activity, active_activity_icon,',
'       case when (is_owner = ''Yes'' and PCT_COMPLETE NOT IN (0,100)) or active_activity = ''Yes'' or open_tasks > 0',
'            then ''Open Actions''',
'            else ''Completed''',
'            end activity_status',
'  from (',
'select p.ID,',
'       p.INITIATIVE_ID,',
'       f.area focus_area,',
'       f.id focus_area_id,',
'       i.initiative,',
'       ''fa-pie-chart-''||p.PCT_COMPLETE as icon,',
'       --',
'       p.PROJECT project,',
'       case when p.owner_id = t.id then ''Yes'' else ''No'' end is_owner,',
'       nvl((select t.first_name||'' ''||t.last_name from sp_team_members t where t.id = p.OWNER_ID),''No Owner'') the_owner,',
'       p.owner_id,',
'       p.TARGET_COMPLETE,',
'       --',
'       p.PCT_COMPLETE,',
'       p.PCT_COMPLETE||''%''  status,',
'       --',
'       --',
'       nvl((select ''P''||priority from sp_project_priorities pp where pp.id = p.priority_id),''Not Prioritized'') priority,',
'       --',
'       -- Release',
'       --',
'       nvl(decode(',
'           p.RELEASE_DEPENDENT_YN,',
'           ''Y'',',
'           (select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''MON-YYYY'')',
'               )),''Not Targeted'')  release,',
'       --',
'       -- Project favorites',
'       --',
'       nvl((select ''Yes'' from sp_favorites f where f.project_id = p.id and f.team_member_id = :P113_USER),''No'') favorite,',
'       nvl((select ''fa-heart u-danger-text'' from sp_favorites f where f.project_id = p.id and f.team_member_id = :P113_USER),''fa-heart-o'') favorite_icon,',
'       --',
'       lower(p.TAGS) tags,',
'       p.CREATED,',
'       --',
'       apex_util.get_since(p.UPDATED) updated_since,',
'       p.updated,',
'       --',
'       --',
'       p.PROJECT_SIZE,',
'       p.project_url_name,',
'       p.friendly_identifier friendly_identifier1,',
'       --',
'       -- current users association with project',
'       --',
'       rtrim(',
'       decode(p.owner_id,t.id,''Owner, '',null) ||',
'       decode((select count(*) c from SP_TASKS a, sp_task_types tt ',
'                where a.project_id = p.id',
'                  and t.id = a.owner_id',
'                  and nvl(a.task_sub_type_id,a.task_type_id) = tt.id',
'                  and tt.static_id like ''MILESTONE%''),0,null,''Milestone Owner, '')||',
'       decode((select count(*) c from SP_TASKS a, sp_task_types tt ',
'                where a.project_id = p.id',
'                  and t.id = a.owner_id',
'                  and nvl(a.task_sub_type_id,a.task_type_id) = tt.id',
'                  and tt.static_id like ''REVIEW%''),0,null,''Reviewer, '')||',
'       decode((select count(*) c from SP_TASKS a, sp_task_types tt ',
'                where a.project_id = p.id',
'                  and t.id = a.owner_id',
'                  and nvl(a.task_sub_type_id,a.task_type_id) = tt.id',
'                  and tt.static_id not like ''REVIEW%''',
'                  and tt.static_id not like ''MILESTONE%''),0,null,''Other Task Owner, '')||',
'       decode((select count(*) c',
'                   from   SP_ACTIVITIES ap ',
'                   where  ap.PROJECT_ID = p.id and ',
'                          t.id = ap.TEAM_MEMBER_ID and',
'                          trunc(sysdate) >= trunc(ap.START_DATE) and',
'                          trunc(sysdate) <= trunc(ap.END_DATE) and',
'                          p.archived_yn = ''N'' and',
'                          p.DUPLICATE_OF_PROJECT_ID is null),0,null,''Activity, ''),',
'       '', '')',
'       user_association,',
'       --',
'       nvl((select ''Yes'' from dual where exists (',
'           select 1 ',
'           from SP_ACTIVITIES ap ',
'           where ap.project_id = p.id and ',
'                 t.id = ap.TEAM_MEMBER_ID and',
'                 trunc(sysdate) between trunc(ap.start_date) and trunc(ap.end_date))),''No'') active_activity,',
'       --',
'       (select ''<span class="fa fa-badge-check" aria-hidden="true" title="Active Activity"></span> '' from dual where exists (',
'           select 1 ',
'           from SP_ACTIVITIES ap ',
'           where ap.project_id = p.id  and ',
'                 t.id = ap.TEAM_MEMBER_ID and ',
'                 trunc(sysdate) between trunc(ap.start_date) and trunc(ap.end_date))) active_activity_icon,',
'       (select sum(case when s.indicates_complete_yn = ''Y'' then 0 else 1 end)',
'          from SP_TASKS a, sp_task_types tt, sp_task_statuses s',
'         where a.project_id = p.id ',
'           and t.id = a.owner_id',
'           and nvl(a.task_sub_type_id,a.task_type_id) = tt.id',
'           and a.status_id = s.id (+)) open_tasks',
'  from SP_PROJECTS p, ',
'       SP_INITIATIVES i,',
'       SP_AREAS f,',
'       sp_team_members t',
'where ',
'      p.archived_yn = ''N'' and',
'      p.initiative_id = i.id and',
'      i.area_id = f.id and',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      t.id = :P113_USER and',
'      --',
'      -- conditions to constrain list of project to current user',
'      --',
'      (',
'          -- app user is owner of project',
'          p.owner_id = t.id or',
'          -- app user is listed as a contributor to project',
'          t.id in (select a.owner_id from SP_TASKS a where a.project_id = p.id) or',
'          -- app user has current open activity',
'          t.id in (select ap.TEAM_MEMBER_ID ',
'                   from   SP_ACTIVITIES ap ',
'                   where  ap.PROJECT_ID = p.id and ',
'                          trunc(sysdate) >= trunc(ap.START_DATE) and',
'                          trunc(sysdate) <= trunc(ap.END_DATE) and',
'                          ap.ACTIVITY_STATUS = ''OPEN'') and',
'                          p.archived_yn = ''N'' and',
'                          p.DUPLICATE_OF_PROJECT_ID is null',
'      )',
'  )'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"UPDATED","expr":"updated desc"},{"key":"CREATED","expr":"created desc"},{"key":"PROJECT","expr":"project"}],"itemName":"P113_ORDER_BY"}'
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'P113_USER'
,p_plug_query_num_rows=>30
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'N',
  'AVATAR_DESCRIPTION', '&STATUS. Complete',
  'AVATAR_ICON', '&ICON.',
  'AVATAR_SHAPE', 't-Avatar--noShape',
  'AVATAR_SIZE', 't-Avatar--sm',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--md',
  'BADGE_LABEL', 'Release',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_VALUE', 'RELEASE',
  'DESCRIPTION', wwv_flow_string.join(wwv_flow_t_varchar2(
    '&THE_OWNER!HTML. - &PRIORITY. - &STATUS!HTML. - &PROJECT_SIZE. ... &TAGS!HTML.<br>',
    '<strong>&USER_ASSOCIATION.</strong>')),
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', '&UPDATED_SINCE.',
  'OVERLINE', '&INITIATIVE!HTML. / &FOCUS_AREA!HTML.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&ACTIVE_ACTIVITY_ICON!RAW. &PROJECT!HTML.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11640038468139298231)
,p_name=>'USER_ASSOCIATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_ASSOCIATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>330
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11993470868721942920)
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
 p_id=>wwv_flow_imp.id(11993470912145942921)
,p_name=>'INITIATIVE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITIATIVE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11993471024862942922)
,p_name=>'FOCUS_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOCUS_AREA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11993471167739942923)
,p_name=>'FOCUS_AREA_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOCUS_AREA_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11993471178275942924)
,p_name=>'INITIATIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITIATIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12138910181490253212)
,p_name=>'FAVORITE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAVORITE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>340
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12138910283498253213)
,p_name=>'FAVORITE_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAVORITE_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>350
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12140333095588875345)
,p_name=>'ACTIVE_ACTIVITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVE_ACTIVITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>360
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245400601158865277)
,p_name=>'THE_OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'THE_OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>80
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245400745099865278)
,p_name=>'OWNER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OWNER_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>90
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245400859653865279)
,p_name=>'TARGET_COMPLETE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TARGET_COMPLETE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>100
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245401067742865281)
,p_name=>'STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>120
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245401333524865284)
,p_name=>'PRIORITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRIORITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245401553299865286)
,p_name=>'RELEASE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RELEASE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245401621035865287)
,p_name=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAGS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>180
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245401679464865288)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245401915993865290)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245402262485865293)
,p_name=>'PROJECT_SIZE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_SIZE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>240
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245402405432865295)
,p_name=>'PROJECT_URL_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_URL_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245402556893865296)
,p_name=>'FRIENDLY_IDENTIFIER1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FRIENDLY_IDENTIFIER1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12245403542408865306)
,p_name=>'UPDATED_SINCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_SINCE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>310
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12326320330895394401)
,p_name=>'ACTIVE_ACTIVITY_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVE_ACTIVITY_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>370
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14582382844727397703)
,p_name=>'ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>320
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17407956791248141402)
,p_name=>'ACTIVITY_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVITY_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>380
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17407956990679141404)
,p_name=>'PROJECT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>390
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12138912818499253238)
,p_plug_name=>'Sort'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>'<div id="active_facets"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16262191399491637229)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17126534754524652047)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(16262191399491637229)
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
 p_id=>wwv_flow_imp.id(17126535988030652059)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11647457217365514809)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16262191399491637229)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11640037906958298225)
,p_name=>'P113_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
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
 p_id=>wwv_flow_imp.id(11640038079157298227)
,p_name=>'P113_FOCUS_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
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
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11640038234518298228)
,p_name=>'P113_INITIATIVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
,p_prompt=>'Initiative'
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
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11640038332666298229)
,p_name=>'P113_RELEASE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
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
 p_id=>wwv_flow_imp.id(11640038342251298230)
,p_name=>'P113_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
,p_prompt=>'Status'
,p_source=>'STATUS'
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
 p_id=>wwv_flow_imp.id(11640038593506298232)
,p_name=>'P113_USER_ASSOCIATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
,p_prompt=>'Association'
,p_source=>'USER_ASSOCIATION'
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
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_multi_value_trim_space=>true
,p_fc_filter_combination=>'OR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11640038690029298233)
,p_name=>'P113_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
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
,p_fc_show_more_count=>7
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
 p_id=>wwv_flow_imp.id(11855782926001318604)
,p_name=>'P113_USER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11855783090405318606)
,p_prompt=>'User'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select first_name||'' ''||last_name d,',
'       id',
'from sp_team_members',
'order by last_name, last_name'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12138910393743253214)
,p_name=>'P113_FAVORITE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
,p_prompt=>'My Favorite'
,p_source=>'FAVORITE'
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
 p_id=>wwv_flow_imp.id(12138912899683253239)
,p_name=>'P113_ORDER_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12138912818499253238)
,p_item_display_point=>'NEXT'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Updated;UPDATED,Created;CREATED,Project;PROJECT'
,p_cHeight=>1
,p_tag_css_classes=>'w200 no-item-ui'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-sort-amount-asc'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12140333195153875346)
,p_name=>'P113_ACTIVE_ACTIVITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
,p_prompt=>'Current Activity'
,p_source=>'ACTIVE_ACTIVITY'
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
 p_id=>wwv_flow_imp.id(12326320370327394402)
,p_name=>'P113_PROJECT_TO_FAVORITE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11993470745869942919)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17407956867598141403)
,p_name=>'P113_ACTIVITY_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11640037816791298224)
,p_prompt=>'Activity Status'
,p_source=>'ACTIVITY_STATUS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Open Actions;Open Actions,Completed;Completed'
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
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11640040299137298249)
,p_computation_sequence=>10
,p_computation_item=>'LAST_PROJECT_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'113'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11958141717265354332)
,p_computation_sequence=>20
,p_computation_item=>'P113_USER'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select id from sp_team_members where email = lower(:APP_USER)'
,p_compute_when=>'P113_USER'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11640039665154298243)
,p_name=>'refresh on dialog closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11993470745869942919)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11640039837758298244)
,p_event_id=>wwv_flow_imp.id(11640039665154298243)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11993470745869942919)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11640039889538298245)
,p_event_id=>wwv_flow_imp.id(11640039665154298243)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11640037816791298224)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11640039991260298246)
,p_name=>'refresh on dc'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(16262191399491637229)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11640040109659298247)
,p_event_id=>wwv_flow_imp.id(11640039991260298246)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11993470745869942919)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11640040200633298248)
,p_event_id=>wwv_flow_imp.id(11640039991260298246)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11640037816791298224)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11855783422197318609)
,p_name=>'Refresh content'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P113_USER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11855783658323318612)
,p_event_id=>wwv_flow_imp.id(11855783422197318609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'set state'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P113_USER'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11855783464527318610)
,p_event_id=>wwv_flow_imp.id(11855783422197318609)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11993470745869942919)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11855783606178318611)
,p_event_id=>wwv_flow_imp.id(11855783422197318609)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11640037816791298224)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12326320504287394403)
,p_name=>'toggle favorite'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P113_PROJECT_TO_FAVORITE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12326320541444394404)
,p_event_id=>wwv_flow_imp.id(12326320504287394403)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  sp_favorite_toggle(',
'    p_project_id => :P113_PROJECT_TO_FAVORITE, ',
'    p_app_user_id => :APP_USER_ID',
'    );'))
,p_attribute_02=>'P113_PROJECT_TO_FAVORITE,APP_USER_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12326320688997394405)
,p_event_id=>wwv_flow_imp.id(12326320504287394403)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var favButton$ = $(".js-project-to-favorite");',
'var favButtonIcon$ = favButton$.find(".t-Icon");',
'',
'// we use the class to get the active element, can be cleared now',
'favButton$.removeClass("js-project-to-favorite"); ',
'',
'if ( favButtonIcon$.hasClass("fa-heart") ) {',
'    favButtonIcon$.removeClass("fa-heart u-danger-text").addClass("fa-heart-o");',
'    // hide success message, no API to do this so done with classes',
'    $( "#APEX_SUCCESS_MESSAGE" ).removeClass("u-visible").addClass("u-hidden"); ',
'} else if ( favButtonIcon$.hasClass("fa-heart-o") ) {',
'    favButtonIcon$.removeClass("fa-heart-o").addClass("fa-heart u-danger-text");',
'    apex.message.showPageSuccess(''Project favorited!'');',
'}',
'apex.items.P113_PROJECT_TO_FAVORITE.setValue('''',undefined,true); //third parameter used to suppress change event'))
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(12245402958852865300)
,p_region_id=>wwv_flow_imp.id(11993470745869942919)
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
 p_id=>wwv_flow_imp.id(12245403285782865304)
,p_region_id=>wwv_flow_imp.id(11993470745869942919)
,p_position_id=>348722977165395441
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:&FRIENDLY_IDENTIFIER1.,&PROJECT_URL_NAME.'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(12326320949455394408)
,p_region_id=>wwv_flow_imp.id(11993470745869942919)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Favorite'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$favoriteProject?id=&ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'&FAVORITE_ICON.'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(17126535055103652050)
,p_region_id=>wwv_flow_imp.id(17126534754524652047)
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
 p_id=>wwv_flow_imp.id(11640038868412298235)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My Activities'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP,102:P102_PERSON:&APP_USER_FIRST_LAST_NAME.'
,p_icon_css_classes=>'fa-badge-check'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11914014542183314339)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Active Releases'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,8:P8_WINDOW:Open'
,p_icon_css_classes=>'fa-ship'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11958140531404354320)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Change History'
,p_display_sequence=>100
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:124:&SESSION.::&DEBUG.:RP,124:P124_ID:&ID.'
,p_icon_css_classes=>'fa-clock-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12245403027610865301)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit '
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12245403110229865302)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Owner'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:&OWNER_ID.'
,p_icon_css_classes=>'fa-user'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12245403193662865303)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECT. Details'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:FI,PN:&FRIENDLY_IDENTIFIER1.,&PROJECT_URL_NAME.'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12326323939753394437)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My Favorite &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,:P23_FAVORITE:Yes'
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12326323973484394438)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>60
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12342028603970717603)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>110
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12342030557266717623)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Activity Quick Look'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP,130:P130_PROJECT_ID:&ID.'
,p_icon_css_classes=>'fa-badge-check'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12342031099555717628)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Add Activity'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_PROJECT_ID:&ID.'
,p_icon_css_classes=>'fa-plus'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12682104985787036107)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Comment'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.:65:P65_PROJECT_ID:&ID.'
,p_icon_css_classes=>'fa-comment-o'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12819003423155351784)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECT. Quick Look'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID:&ID.'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12819003546986351785)
,p_component_action_id=>wwv_flow_imp.id(12245402958852865300)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>30
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12984430074315692115)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>120
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:RP,113:P113_USER:&P113_USER.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12984430242932692116)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>90
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12984433683322692151)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>100
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(13053440170364308627)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'All &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14331408663815820602)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Add &NOMENCLATURE_PROJECT.'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:RP,104::'
,p_icon_css_classes=>'fa-plus'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(17126535761010652057)
,p_component_action_id=>wwv_flow_imp.id(17126535055103652050)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>130
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp.component_end;
end;
/

prompt --application/pages/page_00023
begin
--   Manifest
--     PAGE: 00023
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
 p_id=>23
,p_name=>'Projects'
,p_alias=>'PROJECTS'
,p_step_title=>'&NOMENCLATURE_PROJECTS.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(() => { ',
'    apex.actions.add({',
'        name: ''favoriteProject'',',
'        action: function(event, focusElement, args) {',
'            $(event.currentTarget).addClass(''js-project-to-favorite'');',
'            apex.item(''P23_PROJECT_TO_FAVORITE'').setValue(args.id);',
'            return true;',
'            }',
'    });',
'});'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.no-item-ui {',
'  --a-field-input-border-width: 0px;',
'  --a-field-input-background-color: transparent;',
'}',
'',
'.overline {',
'  color: var(--ut-region-text-color, var(--ut-component-text-default-color));',
'}',
'',
'.a-FS-facetsDashboard {',
'  --a-fs-chart-grid-gap: 0px;',
'  --a-fs-chart-border-width: 0px;',
'  --a-fs-chart-shadow: none;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10581545011201449045)
,p_plug_name=>'Content Row'
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.ID,',
'       p.INITIATIVE_ID,',
'       nvl(f.area,''Not Identified'') focus_area,',
'       i.initiative,',
'       ''fa-pie-chart-''||p.PCT_COMPLETE as icon,',
'       f.area||'' / ''||i.initiative area_initiative,',
'       p.PROJECT project,',
'       case when tm.id is null then ''(No Owner)'' else tm.first_name||'' ''||tm.last_name end the_owner,',
'       p.owner_id,',
'       p.TARGET_COMPLETE,',
'       p.PRIORITY_ID,',
'       nvl((select focus_area from sp_initiative_focus_areas where id = p.focus_area_id),''Not Identified'') Init_focus_area,',
'       case when p.requires_reviews_yn = ''Y'' then ''Yes'' else ''No'' end requires_reviews,',
'       --',
'       -- project group',
'       --',
'       decode (p.project_group_id, ',
'           null, ''Not Grouped'',',
'           (select group_name ',
'            from sp_project_groups pg ',
'            where p.project_group_id = pg.id)',
'           ) project_group,',
'       --',
'       -- status',
'       --',
'       p.pct_complete pct_complete_ob,',
'       p.PCT_COMPLETE||''%'' status,',
'       decode(p.pct_complete,',
'           0,''Abandoned - 0%'',',
'           90,''Substantially Complete - 90%'',',
'           100,''Completed - 100%'',',
'           10,''Contemplating 10%-20%'',',
'           20,''Contemplating 10%-20%'',',
'           ''Actioning 30%-80%'') completed,',
'       --',
'       nvl((select ''P''||priority from sp_project_priorities pp where pp.id = p.priority_id),''Not Prioritized'') priority,',
'       --',
'       decode(p.RELEASE_DEPENDENT_YN,''Y'',''Yes'',''N'',''No'',''No'') RELEASE_DEPENDENT_YN,',
'       --',
'       -- favorites',
'       --',
'       nvl((select ''Yes'' from sp_favorites f where f.project_id = p.id and f.team_member_id = :APP_USER_ID),''No'') favorite,',
'       nvl((select ''fa-heart u-danger-text'' from sp_favorites f where f.project_id = p.id and f.team_member_id = :APP_USER_ID),''fa-heart-o'') favorite_icon,',
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
'       lower(p.TAGS) tags,',
'       p.CREATED,',
'       p.CREATED_BY,',
'       apex_util.get_since(p.UPDATED) updated_since,',
'       p.updated,',
'       p.UPDATED_BY,',
'       to_char(p.updated,''YYYY.MM'') updated_month,',
'       p.PROJECT_SIZE,',
'       decode(p.PROJECT_SIZE,''S'',1,''M'',2,''L'',3,''XL'',4,''2XL'',5,''3XL'',6,''4XL'',7) size_sort,',
'       p.project_url_name,',
'       p.friendly_identifier friendly_identifier1,',
'       --',
'       --',
'       nvl((select ''Yes'' from dual where exists (',
'           select 1 ',
'           from SP_ACTIVITIES ap ',
'           where ap.project_id = p.id and trunc(sysdate) between trunc(ap.start_date) and trunc(ap.end_date))),',
'           ''No'') active_activity,',
'       --',
'       (select ''<span class="fa fa-badge-check" aria-hidden="true" title="Has Activity"></span> '' from dual where exists (',
'           select 1 ',
'           from SP_ACTIVITIES ap ',
'           where ap.project_id = p.id and trunc(sysdate) between trunc(ap.start_date) and trunc(ap.end_date))) active_activity_icon',
'  from SP_PROJECTS p, ',
'       SP_INITIATIVES i,',
'       SP_AREAS f,',
'       sp_team_members tm',
'where ',
'      p.archived_yn = ''N'' and',
'      p.initiative_id = i.id and',
'      i.area_id = f.id and',
'      p.OWNER_ID = tm.id (+) and',
'      p.DUPLICATE_OF_PROJECT_ID is null'))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"UPDATED","expr":"updated desc"},{"key":"FOCUS_AREA","expr":"focus_area, initiative, project"},{"key":"UPDATED1","expr":"updated asc, project"},{"key":"CREATED","expr":"created desc"},{"key":"PROJECT","expr":"project"},{"key":"INI'
||'TIATIVE","expr":"initiative, project"},{"key":"OWNER","expr":"the_owner, focus_area, initiative, project"},{"key":"PRIORITY15","expr":"priority, project"},{"key":"PRIORITY51","expr":"priority desc, project"},{"key":"PCT_COMPLETE_OB","expr":"pct_compl'
||'ete_ob, project"},{"key":"PCT_COMPLETE_OB1","expr":"pct_complete_ob  desc, project"}],"itemName":"P23_ORDER_BY"}'
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'APP_USER_ID'
,p_plug_query_num_rows=>20
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
    '&ACTIVE_ACTIVITY_ICON!RAW.',
    '&THE_OWNER!HTML. - &PRIORITY. - &STATUS!HTML. - &PROJECT_SIZE. ... &TAGS!HTML.',
    '<br>Focus Area: &INIT_FOCUS_AREA.')),
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', wwv_flow_string.join(wwv_flow_t_varchar2(
    '&UPDATED_SINCE.',
    '')),
  'OVERLINE', '&FOCUS_AREA!HTML. / &INITIATIVE!HTML.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&PROJECT!HTML.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10581545134053449046)
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
 p_id=>wwv_flow_imp.id(10581545177477449047)
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
 p_id=>wwv_flow_imp.id(10581545290194449048)
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
 p_id=>wwv_flow_imp.id(10581545443607449050)
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
 p_id=>wwv_flow_imp.id(10833474682575371401)
,p_name=>'AREA_INITIATIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AREA_INITIATIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>60
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833474809183371402)
,p_name=>'PROJECT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>70
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833474866490371403)
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
 p_id=>wwv_flow_imp.id(10833475010431371404)
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
 p_id=>wwv_flow_imp.id(10833475124985371405)
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
 p_id=>wwv_flow_imp.id(10833475333074371407)
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
 p_id=>wwv_flow_imp.id(10833475419780371408)
,p_name=>'COMPLETED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPLETED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>130
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833475483207371409)
,p_name=>'PRIORITY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRIORITY_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>140
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833475598856371410)
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
 p_id=>wwv_flow_imp.id(10833475668484371411)
,p_name=>'RELEASE_DEPENDENT_YN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RELEASE_DEPENDENT_YN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>160
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833475818631371412)
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
 p_id=>wwv_flow_imp.id(10833475886367371413)
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
 p_id=>wwv_flow_imp.id(10833475944796371414)
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
 p_id=>wwv_flow_imp.id(10833476076702371415)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833476181325371416)
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
 p_id=>wwv_flow_imp.id(10833476268783371417)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833476382674371418)
,p_name=>'UPDATED_MONTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_MONTH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>230
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833476527817371419)
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
 p_id=>wwv_flow_imp.id(10833476588186371420)
,p_name=>'SIZE_SORT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SIZE_SORT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(10833476670764371421)
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
 p_id=>wwv_flow_imp.id(10833476822225371422)
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
 p_id=>wwv_flow_imp.id(10833477807740371432)
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
 p_id=>wwv_flow_imp.id(11137835902388223118)
,p_name=>'PROJECT_GROUP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_GROUP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>400
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11729035047043054210)
,p_name=>'FAVORITE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAVORITE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>330
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12138910059106253211)
,p_name=>'FAVORITE_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAVORITE_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>340
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12140332931129875343)
,p_name=>'ACTIVE_ACTIVITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVE_ACTIVITY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>350
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(12140333499201875349)
,p_name=>'ACTIVE_ACTIVITY_ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVE_ACTIVITY_ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>360
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(13170457110058903829)
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
 p_id=>wwv_flow_imp.id(13628145386450228417)
,p_name=>'INIT_FOCUS_AREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INIT_FOCUS_AREA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>390
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18259856723045635928)
,p_name=>'PCT_COMPLETE_OB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PCT_COMPLETE_OB'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>410
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(22349829984453897837)
,p_name=>'REQUIRES_REVIEWS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REQUIRES_REVIEWS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>380
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14848788879833626825)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15713132234866641643)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(14848788879833626825)
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
 p_id=>wwv_flow_imp.id(15713133468372641655)
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
 p_id=>wwv_flow_imp.id(40549416703912266422)
,p_plug_name=>'Items'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI:margin-bottom-none'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'<div id="active_facets"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41349811724678670137)
,p_plug_name=>'Faceted Search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(10581545011201449045)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11623399856347051575)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14848788879833626825)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_PROJ_JUMP_PG.:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10300340843008735314)
,p_name=>'P23_INITIATIVE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10300342962499735335)
,p_name=>'P23_PROJECT_SIZE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Size'
,p_source=>'PROJECT_SIZE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11137836001529223119)
,p_name=>'P23_PROJECT_GROUP'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'&NOMENCLATURE_PROJECT. Group'
,p_source=>'PROJECT_GROUP'
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
 p_id=>wwv_flow_imp.id(11729034610260054205)
,p_name=>'P23_FAV1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10581545011201449045)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11729034679559054206)
,p_name=>'P23_FAV2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10581545011201449045)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11729034798225054207)
,p_name=>'P23_FAV3'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10581545011201449045)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11729034958929054209)
,p_name=>'P23_FAVORITE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
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
 p_id=>wwv_flow_imp.id(12140332973412875344)
,p_name=>'P23_ACTIVE_ACTIVITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
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
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12315980415951475903)
,p_name=>'P23_PROJECT_TO_FAVORITE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13398446439608841115)
,p_name=>'P23_FOCUS_AREA_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13628145269105228416)
,p_name=>'P23_INIT_FOCUS_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Focus Area'
,p_source=>'INIT_FOCUS_AREA'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_display_when=>'select 1 from sp_initiative_focus_areas'
,p_display_when_type=>'EXISTS'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
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
 p_id=>wwv_flow_imp.id(13841474796508823613)
,p_name=>'P23_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
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
 p_id=>wwv_flow_imp.id(22349829914861897836)
,p_name=>'P23_REQUIRES_REVIEWS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Requires Reviews'
,p_source=>'REQUIRES_REVIEWS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41349811810923670138)
,p_name=>'P23_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
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
 p_id=>wwv_flow_imp.id(41349811918011670139)
,p_name=>'P23_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Pct Complete'
,p_source=>'STATUS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
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
 p_id=>wwv_flow_imp.id(41349812011255670140)
,p_name=>'P23_THE_OWNER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Owner'
,p_source=>'THE_OWNER'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_max_height=>320
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
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
 p_id=>wwv_flow_imp.id(41349812116329670141)
,p_name=>'P23_RELEASE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Release'
,p_source=>'RELEASE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>true
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41349812174090670142)
,p_name=>'P23_PRIORITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Priority'
,p_source=>'PRIORITY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>false
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41349812403110670144)
,p_name=>'P23_UPDATED_MONTH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'Updated'
,p_source=>'UPDATED_MONTH'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
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
 p_id=>wwv_flow_imp.id(41547359728839037132)
,p_name=>'P23_FOCUS_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'&NOMENCLATURE_AREA.'
,p_source=>'FOCUS_AREA'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>true
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41547359756319037133)
,p_name=>'P23_INITIATIVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(41349811724678670137)
,p_prompt=>'&NOMENCLATURE_INITIATIVE.'
,p_source=>'INITIATIVE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>true
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41862934464889777404)
,p_name=>'P23_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(40549416703912266422)
,p_item_display_point=>'NEXT'
,p_item_default=>'UPDATED'
,p_prompt=>' '
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Updated Desc;UPDATED,Area;FOCUS_AREA,Updated Asc;UPDATED1,Created;CREATED,Project;PROJECT,Initiative;INITIATIVE,Owner;OWNER,Priority 1-5;PRIORITY15,Priority 5-1;PRIORITY51,% Complete 0-100;PCT_COMPLETE_OB,% Complete 100-0;PCT_COMPLETE_OB1'
,p_cHeight=>1
,p_tag_css_classes=>'w200 no-item-ui'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-sort-amount-asc'
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(14325034641323784424)
,p_computation_sequence=>10
,p_computation_item=>'LAST_PROJECT_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'23'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42436013335883244401)
,p_name=>'refresh on dialog close'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(10581545011201449045)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42908329368540296201)
,p_event_id=>wwv_flow_imp.id(42436013335883244401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10581545011201449045)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42436013434469244402)
,p_event_id=>wwv_flow_imp.id(42436013335883244401)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10581545011201449045)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11652230410847405934)
,p_name=>'on dialog closed'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(14848788879833626825)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11652230506717405935)
,p_event_id=>wwv_flow_imp.id(11652230410847405934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10581545011201449045)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11652230569946405936)
,p_event_id=>wwv_flow_imp.id(11652230410847405934)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41349811724678670137)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12315980661836475906)
,p_name=>'Fav Project'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_PROJECT_TO_FAVORITE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12315980745641475907)
,p_event_id=>wwv_flow_imp.id(12315980661836475906)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_favorite_toggle(',
'    p_project_id  => :P23_PROJECT_TO_FAVORITE, ',
'    p_app_user_id => :APP_USER_ID );'))
,p_attribute_02=>'P23_PROJECT_TO_FAVORITE,APP_USER_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12315980910779475908)
,p_event_id=>wwv_flow_imp.id(12315980661836475906)
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
'apex.items.P23_PROJECT_TO_FAVORITE.setValue('''',undefined,true); //third parameter used to suppress change event'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11729034885772054208)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'fav'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   i int := 0;',
' begin',
':P23_FAV1 := null;',
':P23_FAV2 := null;',
':P23_FAV3 := null;',
'for c1 in (',
'    select l.project_id, count(*) c',
'    from   SP_PROJ_INTERACTIONS_LOG l',
'    where  l.APP_USER = lower(:APP_USER) and',
'           l.PAGE_RENDERED > sysdate - 14 and',
'           l.project_id is not null',
'    group by  l.project_id',
'    order by count(*) desc',
'    fetch first 3 rows only',
') loop',
'    i := i + 1;',
'    if i = 1 then ',
'       :P23_FAV1  := c1.project_id; ',
'    elsif i = 2 then',
'       :P23_FAV2  := c1.project_id; ',
'    else ',
'       :P23_FAV3  := c1.project_id; ',
'    end if;',
'end loop;',
'end;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1494980544625549808
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(10831921117061414750)
,p_region_id=>wwv_flow_imp.id(10581545011201449045)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Favorite Project'
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'#action$favoriteProject?id=&ID.'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'&FAVORITE_ICON.'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(10833477224184371426)
,p_region_id=>wwv_flow_imp.id(10581545011201449045)
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
 p_id=>wwv_flow_imp.id(10833477551114371430)
,p_region_id=>wwv_flow_imp.id(10581545011201449045)
,p_position_id=>348722977165395441
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:&FRIENDLY_IDENTIFIER1.,&PROJECT_URL_NAME.'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(11855786382427318639)
,p_region_id=>wwv_flow_imp.id(15713132234866641643)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Add &NOMENCLATURE_PROJECT.'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:104,24:P104_INITIATIVE,P104_AREA:&P23_INITIATIVE_ID.,&P23_FOCUS_AREA_ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-plus'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(15713132535445641646)
,p_region_id=>wwv_flow_imp.id(15713132234866641643)
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
 p_id=>wwv_flow_imp.id(10833477292942371427)
,p_component_action_id=>wwv_flow_imp.id(10833477224184371426)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit '
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(10833477458994371429)
,p_component_action_id=>wwv_flow_imp.id(10833477224184371426)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Details'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:FI,PN:&FRIENDLY_IDENTIFIER1.,&PROJECT_URL_NAME.'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11137834628343223105)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECT. Groups'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11407077688486857910)
,p_component_action_id=>wwv_flow_imp.id(10833477224184371426)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECT. Quick Look'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID:&ID.'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11407077812317857911)
,p_component_action_id=>wwv_flow_imp.id(10833477224184371426)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>30
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11571027554657681711)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>130
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11571027723274681712)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>50
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11571031163664681747)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>110
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11640037650706298223)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECTS. Interactive Report'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11958140438695354319)
,p_component_action_id=>wwv_flow_imp.id(10833477224184371426)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Change History'
,p_display_sequence=>150
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:124:&SESSION.::&DEBUG.:RP,124:P124_ID:&ID.'
,p_icon_css_classes=>'fa-clock-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12326323358851394432)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My Activities'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP,102:P102_PERSON:&APP_USER_FIRST_LAST_NAME.'
,p_icon_css_classes=>'fa-badge-check'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12326323443675394433)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>100
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12326323612694394434)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>80
,p_build_option_id=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12935389160277934548)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Releases'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-ship'
,p_build_option_id=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(13115945916064122129)
,p_component_action_id=>wwv_flow_imp.id(10833477224184371426)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Owner Quick Look'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:&OWNER_ID.'
,p_icon_css_classes=>'fa-user'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14711151501201402922)
,p_component_action_id=>wwv_flow_imp.id(10833477224184371426)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Archive'
,p_display_sequence=>110
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP,47:P47_PROJECT_ID:&ID.'
,p_icon_css_classes=>'fa-remove'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15713133241352641653)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>120
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(18635534907307822419)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20235784886490330509)
,p_component_action_id=>wwv_flow_imp.id(15713132535445641646)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My Tasks'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:500:&SESSION.::&DEBUG.:RP,500:P500_ASSIGNED_TO:&APP_USER_FIRST_LAST_NAME.'
,p_icon_css_classes=>'fa-clipboard-list'
);
wwv_flow_imp.component_end;
end;
/

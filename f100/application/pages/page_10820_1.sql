prompt --application/pages/page_10820
begin
--   Manifest
--     PAGE: 10820
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
 p_id=>10820
,p_name=>'About this App'
,p_alias=>'HELP'
,p_step_title=>'About this App'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18412433224561085883)
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(12364451874652416490)
,p_protection_level=>'C'
,p_help_text=>'All application help text can be accessed from this page. The links in the "Documentation" region give a much more in-depth explanation of the application''s features and functionality.'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11571031056408681746)
,p_plug_name=>'Terminology'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>60
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-folder-o fa-2x margin-right-sm"></span> &NOMENCLATURE_AREAS.</h3> Top level organization for &NOMENCLATURE_PROJECTS..',
'    All &NOMENCLATURE_PROJECTS. are organized by &NOMENCLATURE_INITIATIVES. ',
'    that are organized by &NOMENCLATURE_AREAS..  Full &NOMENCLATURE_PROJECT. organization is &NOMENCLATURE_AREA. > &NOMENCLATURE_INITIATIVE. >  &NOMENCLATURE_PROJECT..',
'<p/>',
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-lightbulb-o fa-2x  margin-right-sm"></span> &NOMENCLATURE_INITIATIVES.</h3> Further organize &NOMENCLATURE_AREAS..',
'    All &NOMENCLATURE_PROJECTS. are organized by &NOMENCLATURE_INITIATIVES. ',
'    that are organized by &NOMENCLATURE_AREAS..',
'<p/>',
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-package fa-2x  margin-right-sm"></span> &NOMENCLATURE_PROJECTS.</h3> This application primarily tracks &NOMENCLATURE_PROJECTS.. ',
'    &NOMENCLATURE_PROJECTS. are organized by &NOMENCLATURE_AREAS. and &NOMENCLATURE_INITIATIVES..',
'    &NOMENCLATURE_PROJECTS. typically have owners, sizes, priorities, tags.',
'<p/>',
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-badge-check fa-2x  margin-right-sm"></span> Activities</h3>  Activities are work performed by people.  ',
'    Activities can be specific to a &NOMENCLATURE_PROJECT. but they are not required to be.',
'    Activities track who is doing on what within a time range.  For example Jane Doe is researching an implementation for a specific &NOMENCLATURE_PROJECT..',
'<p/>',
''))
,p_required_patch=>-wwv_flow_imp.id(14578465101782602994)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11640036186488298208)
,p_plug_name=>'Percent Complete'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_05'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Each &NOMENCLATURE_PROJECT. has a percent complete attribute.  ',
'This percent complete status specifies a percent complete ranging from 0% to 100% in 10% increments.  ',
'Each &NOMENCLATURE_PROJECT. can choose a scale from a list of scales.  ',
'The scale identifies the meaing of what is 10% complete and what is 20% complete etc, in addition to what milestones will be tracked based on the type. See details for this system percent complete scales.  ',
'Each instance of this application can adjust the scales.',
'<p/>',
'<p>',
'    The percent complete can be rolled up for all &NOMENCLATURE_PROJECTS. for a given release to provide some indication of progress. ',
'</p>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12342032321761717640)
,p_plug_name=>'About this Application'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>40
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    x clob;',
'begin',
'x := ''No content provided.'';',
'for c1 in (select configurable_content from SP_CONFIGURABLE_TEXT where config_ID = ''ABOUT-PRIMARY-TEXT'') loop',
'    x := c1.configurable_content;',
'    x := apex_application.do_substitutions(x);',
'    x := replace(x,''NOMENCLATURE_PROJECTS'',''hello'');',
'    x := apex_markdown.to_html(x);',
'end loop;',
'return x;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15710429838270752016)
,p_plug_name=>'Terminology'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-folder-o fa-2x margin-right-sm"></span> &NOMENCLATURE_AREAS.</h3> Top level organization for &NOMENCLATURE_PROJECTS..',
'    All &NOMENCLATURE_PROJECTS. are organized by &NOMENCLATURE_INITIATIVES. ',
'    that are organized by &NOMENCLATURE_AREAS..  Full &NOMENCLATURE_PROJECT. organization is &NOMENCLATURE_AREA. > &NOMENCLATURE_INITIATIVE. >  &NOMENCLATURE_PROJECT..',
'<p/>',
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-lightbulb-o fa-2x  margin-right-sm"></span> &NOMENCLATURE_INITIATIVES.</h3> Further organize &NOMENCLATURE_AREAS..',
'    All  &NOMENCLATURE_PROJECTS. are organized by &NOMENCLATURE_INITIATIVES. ',
'    that are organized by &NOMENCLATURE_AREAS..',
'<p/>',
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-package fa-2x  margin-right-sm"></span> &NOMENCLATURE_PROJECTS.</h3> This application primarily tracks &NOMENCLATURE_PROJECTS.. ',
'    &NOMENCLATURE_PROJECTS. are organized by &NOMENCLATURE_AREAS. and &NOMENCLATURE_INITIATIVES..',
'    &NOMENCLATURE_PROJECTS. typically have owners, sizes, priorities, tags, and can be optionally assocated with releases.',
'<p/>',
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-badge-check fa-2x  margin-right-sm"></span> Activities</h3>  Activities are work performed by people.  ',
'    Activities can be specific to a &NOMENCLATURE_PROJECT. but they are not required to be.',
'    Activities track who is doing on what within a time range.  For example Jane Doe is researching an implementation for a specific &NOMENCLATURE_PROJECT..',
'<p/>',
'<p>',
'    <h3><span aria-hidden="true" class="fa fa-ship fa-2x margin-right-sm"></span> Releases</h3>  &NOMENCLATURE_PROJECTS. can be optionally associated with a release.  ',
'    A release is typically a software distribution.  ',
'    Releases have specific milestones with dates.  ',
'    When a &NOMENCLATURE_PROJECT. is associated with a release, e.g. "release dependant", the &NOMENCLATURE_PROJECT. due date is the date of the release.',
'',
'<p/>',
''))
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19946441152925382765)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20810784507958397583)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(19946441152925382765)
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
 p_id=>wwv_flow_imp.id(20810785741464397595)
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
 p_id=>wwv_flow_imp.id(13398446541162841117)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11640036186488298208)
,p_button_name=>'view_percent_complete_scales'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'View Percent Complete Scales'
,p_button_redirect_url=>'f?p=&APP_ID.:222:&SESSION.::&DEBUG.:RP,::'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13930460399854708773)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19946441152925382765)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(20810784808537397586)
,p_region_id=>wwv_flow_imp.id(20810784507958397583)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(13732075710757739625)
,p_component_action_id=>wwv_flow_imp.id(20810784808537397586)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit Terminology'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10400:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15267436731589886103)
,p_component_action_id=>wwv_flow_imp.id(20810784808537397586)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit App Description'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:14000:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(16668679827749437651)
,p_component_action_id=>wwv_flow_imp.id(20810784808537397586)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10820:&SESSION.::&DEBUG.:CR,10820::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(16668679996366437652)
,p_component_action_id=>wwv_flow_imp.id(20810784808537397586)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>50
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20810785514444397593)
,p_component_action_id=>wwv_flow_imp.id(20810784808537397586)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10820:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp.component_end;
end;
/

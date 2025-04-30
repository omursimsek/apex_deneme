prompt --application/pages/page_00145
begin
--   Manifest
--     PAGE: 00145
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
 p_id=>145
,p_name=>'Groups'
,p_alias=>'GROUPS1'
,p_page_mode=>'MODAL'
,p_step_title=>'Groups'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23577344138028402955)
,p_plug_name=>'button container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(26306694123093201991)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'A group is a collection of users who are working together.  ',
'Using groups allow filtering of &NOMENCLATURE_PROJECTS. for only those owned by a member of the group. Each group can also be associated with a tag.  This allows filtering of &NOMENCLATURE_PROJECTS. associated with the "Group Tag".',
'</p>',
'<p>',
'A user can be part of more then one group.  You can also use the groups capability to identify a virtual team. ',
'</p>',
'',
'</p>',
'',
'<br />',
'<br />'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19354687344366587036)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(23577344138028402955)
,p_button_name=>'what_is_a_release'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'About Releases'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa=info'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19354688214848587036)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(23577344138028402955)
,p_button_name=>'what_is_an_area'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'About &NOMENCLATURE_AREAS.'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa=info'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19354687013840587034)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(23577344138028402955)
,p_button_name=>'what_is_a_initiative'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'About &NOMENCLATURE_INITIATIVES.'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa=info'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19354687751467587036)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(23577344138028402955)
,p_button_name=>'what_is_activity'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'About Activities'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa=info'
);
wwv_flow_imp.component_end;
end;
/

prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(12364451874652416490)
,p_build_option_name=>'About Page'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>40760826019912
,p_feature_identifier=>'APPLICATION_ABOUT_PAGE'
,p_build_option_comment=>'This feature displays an "About this application" link and exposes a partially configurable about this application page.  If you don''t want to have a link to about this application disable this setting.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(13408792237973796442)
,p_build_option_name=>'Reviews'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44449905286858
,p_build_option_comment=>'If disabled, Reviews will not be included within NOMENCLATURE_PROJECTS.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(14578465101782602994)
,p_build_option_name=>'Releases'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>40935286839364
,p_build_option_comment=>'Used to exclude the use of "Releases".'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(15989153410617755570)
,p_build_option_name=>'Show friendly identifier'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>40760828906055
,p_build_option_comment=>'Each project gets a friendly identifier by default.  Friendly identifiers are alternative primary keys that are human readable. For example "AA01" is a friendly identifier.  This setting controls if the identifiers are displayed in the UI of the appl'
||'ication.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(18418211303568240240)
,p_build_option_name=>'Feature: Feedback'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41287209098302
,p_feature_identifier=>'APPLICATION_FEEDBACK'
,p_build_option_comment=>'Provide a mechanism for end users to post general comments back to the application administrators and developers.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(18464647985472733381)
,p_build_option_name=>'Configure Application Features'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41300082518941
,p_feature_identifier=>'APPLICATION_CONFIGURATION'
,p_build_option_comment=>'Allow application administrators to enable or disable specific application features.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(20138793112175491883)
,p_build_option_name=>'Comment Tagging'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44449904548259
,p_build_option_comment=>'If included, Screen Name will be available under NOMENCLATURE_USERS and NOMENCLATURE_PROJECT comments will be searched for screen names and if someone is ''tagged'', they will receive an alert (if they have Comment Alerts enabled).'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(20198787690630337545)
,p_build_option_name=>'Developer Audit Reports'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41116367005658
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Allows hiding functions appropriate for a development environment, but not to be displayed in a production environment.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(20442394029406870290)
,p_build_option_name=>'Groups'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44449904974681
,p_build_option_comment=>'Groups allow you to organize contributors.  You define a group, then add NOMENCLATURE_USERS to the group.  When viewing  NOMENCLATURE_USERS, you can filter by groups.  This reduces a large list to a smaller, more targeted, list.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(21356200367810334522)
,p_build_option_name=>'Subscriptions'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41329529515893
,p_build_option_comment=>'Allows enable/disable of Notification Subscriptions, sent via email.  This should be disabled if email is not configured on this instance.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(21855158598441364965)
,p_build_option_name=>'Kanban'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>42092809933464
,p_build_option_comment=>'Kanban Board, Cumulative Flow, Control Chart and Planning Board.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(24517378663928473922)
,p_build_option_name=>'Activity Planning'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44449904025996
,p_build_option_comment=>'Allows a team member to plan activities; For example I am working on these activities (aka NOMENCLATURE_PROJECTS) for these dates.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(27063355719221060172)
,p_build_option_name=>'Email Configured'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41331431166856
,p_build_option_comment=>'If email is not configured on your instance, use this to turn off the features that would send emails.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(28325828910135123747)
,p_build_option_name=>'Include Project Active Toggle'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>44449905825992
,p_build_option_comment=>'Identifies a NOMENCLATURE_PROJECT as being actively worked or not.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(149556928703600434420)
,p_build_option_name=>'Access Control'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>40760827840139
,p_feature_identifier=>'APPLICATION_ACCESS_CONTROL'
,p_build_option_comment=>'Incorporate role based user authentication within your application and manage username mappings to application roles.'
);
wwv_flow_imp.component_end;
end;
/

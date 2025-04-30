prompt --application/pages/page_00053
begin
--   Manifest
--     PAGE: 00053
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
 p_id=>53
,p_name=>'Initiative Document Details'
,p_alias=>'INITIATIVE-DOCUMENT-DETAILS'
,p_step_title=>'Initiative Document Details'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_javascript_file_urls=>'#PRISMJS_DIRECTORY#prism#MIN#.js'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(28149992594593519537)
,p_name=>'Document Details'
,p_template=>4501440665235496320
,p_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:margin-left-md'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.ID,',
'       i.id initiative_id,',
'       i.initiative,',
'       f.area,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.created,',
'       --d.doc_description,',
'       lower(d.created_by) author,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       d.created date_created,',
'       substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1)) file_extension',
'  from SP_INITIATIVE_DOCUMENTS d,',
'       sp_initiatives i,',
'       sp_areas f',
' where d.id = :P53_ID and d.initiative_id = i.id and f.id = i.area_id',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P53_ID'
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
 p_id=>wwv_flow_imp.id(26903918144628320703)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903918947147320704)
,p_query_column_id=>2
,p_column_alias=>'INITIATIVE_ID'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903919398955320705)
,p_query_column_id=>3
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>20
,p_column_heading=>'Initiative'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_INITIATIVE:#INITIATIVE#'
,p_column_linktext=>'#INITIATIVE#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903919784861320705)
,p_query_column_id=>4
,p_column_alias=>'AREA'
,p_column_display_sequence=>10
,p_column_heading=>'Area'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_FOCUS_AREA:#AREA#'
,p_column_linktext=>'#AREA#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903920626269320706)
,p_query_column_id=>5
,p_column_alias=>'DOCUMENT_FILENAME'
,p_column_display_sequence=>60
,p_column_heading=>'Document Filename'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903921024692320706)
,p_query_column_id=>6
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>70
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903921430977320707)
,p_query_column_id=>7
,p_column_alias=>'CREATED'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903921745255320707)
,p_query_column_id=>8
,p_column_alias=>'AUTHOR'
,p_column_display_sequence=>90
,p_column_heading=>'Author'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903922172489320707)
,p_query_column_id=>9
,p_column_alias=>'DOC_SIZE'
,p_column_display_sequence=>100
,p_column_heading=>'Size'
,p_column_format=>'FILESIZE'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903922574863320708)
,p_query_column_id=>10
,p_column_alias=>'DATE_CREATED'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903922971683320708)
,p_query_column_id=>11
,p_column_alias=>'FILE_EXTENSION'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30483703017647678853)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(31506319928044471997)
,p_plug_name=>'SQL'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_INITIATIVE_DOCUMENTS',
'       where id = :P53_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-sql">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'SQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(31506320016849471998)
,p_plug_name=>'PDF'
,p_region_name=>'pdf_viewer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>120
,p_location=>null
,p_plug_source=>'&P53_PDF_LINK.'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PDF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32502220648185999622)
,p_plug_name=>'YAML'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_INITIATIVE_DOCUMENTS',
'       where id = :P53_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-yaml">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'YAML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32502220683342999623)
,p_plug_name=>'Java'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_INITIATIVE_DOCUMENTS',
'       where id = :P53_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-java">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'JAVA'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32502220816835999624)
,p_plug_name=>'JSON'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_INITIATIVE_DOCUMENTS',
'       where id = :P53_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-json">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'JSON'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32502220937995999625)
,p_plug_name=>'XML'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_INITIATIVE_DOCUMENTS',
'       where id = :P53_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-xml">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'XML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32502221054350999626)
,p_plug_name=>'PL/SQL'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_INITIATIVE_DOCUMENTS',
'       where id = :P53_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-plsql">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PLS:PLSQL:PLB'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32502221085240999627)
,p_plug_name=>'Python'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_INITIATIVE_DOCUMENTS',
'       where id = :P53_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-python">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P53_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PYC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(34082468515544616968)
,p_plug_name=>'&P53_FILE_NAME.'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P53_DOCUMENT_IS_IMAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(34574052984703194339)
,p_name=>'Document Description'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DOC_description',
'  from SP_INITIATIVE_DOCUMENTS d',
' where id = :P53_ID '))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from SP_INITIATIVE_DOCUMENTS d',
' where id = :P53_ID ',
'   and DOC_description is not null'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P53_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26903917343997320702)
,p_query_column_id=>1
,p_column_alias=>'DOC_DESCRIPTION'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47410103540927949588)
,p_plug_name=>'No Preview Available'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source=>'This file type cannot be previewed.'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P53_FILE_EXTENSION not in (''SQL'',''PLS'',''PLSQL'',''PLB'',''YAML'',''JSON'',''XML'',''JAVA'',''PYC'',''PDF'') and',
':P53_DOCUMENT_IS_IMAGE is null'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26903926038508320712)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30483703017647678853)
,p_button_name=>'Previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Previous'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:53:P53_ID,P53_PREV_PAGE:&P53_PREV_ID.,&P53_PREV_PAGE.'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26903925589584320711)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(30483703017647678853)
,p_button_name=>'Next'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Next'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:53:P53_ID,P53_PREV_PAGE:&P53_NEXT_ID.,&P53_PREV_PAGE.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26903927199311320712)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(30483703017647678853)
,p_button_name=>'Edit'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13:P13_ID:&P53_ID.'
,p_icon_css_classes=>'fa-edit'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26903926770895320712)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(30483703017647678853)
,p_button_name=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Download'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26903926363992320712)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(30483703017647678853)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:&P53_PREV_PAGE.:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26269778342212083416)
,p_name=>'P53_PREV_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26269779675818083429)
,p_name=>'P53_PDF_LINK'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30492537889501441028)
,p_name=>'P53_DOCUMENT_BLOB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(34082468515544616968)
,p_prompt=>'Document'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'SQL',
  'sql_statement', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT DOCUMENT_BLOB ',
    '  from SP_INITIATIVE_DOCUMENTS d',
    ' where id = :P53_ID ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30492544617717441033)
,p_name=>'P53_DOCUMENT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30492545038946441037)
,p_name=>'P53_NEXT_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30492545141495441038)
,p_name=>'P53_PREV_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30511343494620639917)
,p_name=>'P53_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31506328074768472013)
,p_name=>'P53_FILE_EXTENSION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(34918848364263971901)
,p_name=>'P53_FILE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(34082468515544616968)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57396423154213260943)
,p_name=>'P53_DOCUMENT_IS_IMAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(28149992594593519537)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(26903933593537320720)
,p_computation_sequence=>10
,p_computation_item=>'P53_FILE_EXTENSION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1))) ext',
'  from SP_INITIATIVE_DOCUMENTS d',
' where id = :P53_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(26903931631796320718)
,p_computation_sequence=>10
,p_computation_item=>'P53_DOCUMENT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DOCUMENT_FILENAME',
'  from SP_INITIATIVE_DOCUMENTS d',
' where id = :P53_ID',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(26903934424925320720)
,p_computation_sequence=>20
,p_computation_item=>'P53_DOCUMENT_IS_IMAGE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Y''',
'  from SP_INITIATIVE_DOCUMENTS d',
' where id = :P53_ID',
'and upper(substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1)))',
' in (''JPG'',''JPEG'',''PNG'',''GIF'',''AVIF'',''WEBP'')',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(26903931969349320719)
,p_computation_sequence=>30
,p_computation_item=>'P53_NEXT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id',
'  from SP_INITIATIVE_DOCUMENTS d',
' where initiative_id = (select initiative_id from SP_INITIATIVE_DOCUMENTS d2 where d2.id = :P53_ID) and',
'       created < (select created from SP_INITIATIVE_DOCUMENTS d2 where d2.id = :P53_ID) and',
'          dbms_lob.getlength(DOCUMENT_BLOB) > 0 ',
'order by created desc',
'fetch first 1 rows only'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(26903932345074320719)
,p_computation_sequence=>40
,p_computation_item=>'P53_PREV_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id',
'  from SP_INITIATIVE_DOCUMENTS d',
' where initiative_id = (select initiative_id from SP_INITIATIVE_DOCUMENTS d2 where d2.id = :P53_ID) and',
'       created > (select created from SP_INITIATIVE_DOCUMENTS d2 where d2.id = :P53_ID) and',
'          dbms_lob.getlength(DOCUMENT_BLOB) > 0 ',
'order by created ',
'fetch first 1 rows only'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(26903933969773320720)
,p_computation_sequence=>50
,p_computation_item=>'P53_FILE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DOCUMENT_FILENAME',
'  from SP_INITIATIVE_DOCUMENTS d',
' where id = :P53_ID '))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(26269779754364083430)
,p_computation_sequence=>60
,p_computation_item=>'P53_PDF_LINK'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return APEX_PAGE.GET_URL (',
'            p_page      => 53,',
'            p_request   => ''APPLICATION_PROCESS=viewInitiativePDF'',',
'            p_plain_url => TRUE );'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26903936020068320722)
,p_name=>'DC'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(30483703017647678853)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26903936518727320723)
,p_event_id=>wwv_flow_imp.id(26903936020068320722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(28149992594593519537)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26903936903306320723)
,p_name=>'Load PDF'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P53_FILE_EXTENSION'
,p_display_when_cond2=>'PDF'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26903937379359320723)
,p_event_id=>wwv_flow_imp.id(26903936903306320723)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#pdf_viewer'').html('''');',
'var url = ''&P53_PDF_LINK.'';',
'var preview = document.createElement(''embed''); ',
'preview.type = "application/pdf";',
'preview.width="100%";',
'preview.height="1000px";',
'preview.src = url;',
'$("#pdf_viewer").append(preview);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26903935123232320721)
,p_name=>'Disable Next Button'
,p_event_sequence=>30
,p_condition_element=>'P53_NEXT_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26903935600548320722)
,p_event_id=>wwv_flow_imp.id(26903935123232320721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(26903925589584320711)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26903937801162320723)
,p_name=>'Disable Previous Button'
,p_event_sequence=>40
,p_condition_element=>'P53_PREV_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26903938271951320724)
,p_event_id=>wwv_flow_imp.id(26903937801162320723)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(26903926038508320712)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26903934683168320721)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'download document'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.download_blob (',
'    p_file_type => ''INITIATIVE'',',
'    p_file_id   => :P53_ID );'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Document download resulted in an error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(26903926770895320712)
,p_internal_uid=>16669880342021816321
);
wwv_flow_imp.component_end;
end;
/

<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Project: GAMS Projekttemplate - GRaF
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
    Author: Hans Clausen, Maximilian Müller, Gerlinde Schneider, Martina Semlak, Christian Steiner, Elisabeth Steiner
    Last update: 2015
    Modified for GRaF by: Sarah Lang, 2020
 -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/" exclude-result-prefixes="#all">

    <xsl:include href="graf-static.xsl"/>



    <!-- Romans Simple Checkbox Menu -->
    <script>
        
        
        /*simpleCheckboxMenu (SCM): JQUery Plugin for simple Dom visualisation via toggling a class
        The Plugin attaches a click event (may be changed to any other event).
        On the checkbox input element the class 'scm-checkbox' is required
        Also required are two additional attributes on the checkbox:
        "data-scm-target": contains a Jqery selector string to the elements on which the class should be toggled
        "data-scm-class": contains the class name that should be toggled on the above elements
        
        In the simpleCheckbxMenu.div.css file are some predefined classed that can be used, new ones can be added there.
        
        */
        
        $(document).ready(function(){
        
        
        function triggerEvent($ele){
        
        var target = $($ele).attr("data-scm-target");
        var classToToggle = $($ele).attr("data-scm-class");
        
        //console.log("Target Jquery selector is: "+target);
        //console.log("Class to toggle is: "+classToToggle);
        
        $(target).toggleClass(classToToggle);
        
        }
        
        
        $("input.scm-checkbox").on("click", function(){
        //console.log("click event works");
        triggerEvent(this);
        
        });	
        
        $("input.scm-checkbox:checked").each(function(){
        //console.log("checkbox checked event works");
        triggerEvent(this);
        
        });
        
        
        });
    </script>
    
    
    
    <xsl:template name="content">
        <main class="container">
        <section class="row equalheight">

            <article class="col-md-12" style="margin-bottom:30px;">
                <div class="panel">
                    <div class="static-wrapper-no-bottom" style="background-color:#ffffff; margin-bottom:10px;">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="contains(//t:titleStmt/t:title,'==')">
                                <xsl:value-of select="substring-before(//t:titleStmt/t:title,'==')"/>
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="//t:titleStmt/t:title"/></xsl:otherwise>
                        </xsl:choose>
                        <span style="float:right;">
                        <!-- TEI (P5) -->
                        <a target="blank" style="padding-right:20px; text-decoration:none;border-bottom:none;">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat($server, '/archive/objects/')"/>
                                <xsl:value-of select="//t:idno"/>
                                <xsl:text>/datastreams/TEI_SOURCE/content</xsl:text>
                            </xsl:attribute>
                            <img src="{$gamsdev}/graf/img/tei.jpg" width="30" height="30"
                                alt="XML (TEI P5)"/>
                        </a>
                        <!-- Druckversion, LaTeX-PDF -->
                            <a target="blank"  style="padding-right:20px; text-decoration:none;border-bottom:none;" >
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat($server, '/archive/objects/')"/>
                                
                                <xsl:value-of select="//t:idno"/>
                                <xsl:text>/methods/sdef:TEI/getLaTeXPDF</xsl:text>
                                <!-- <xsl:if test="$mode='interpretation'">
                                    <xsl:text>?mode=interpretation</xsl:text>
                                </xsl:if> -->
                            </xsl:attribute>
                                <img src="/templates/img/pdf_icon.png" width="30" height="30"
                                alt="Druckversion"/>
                        </a>
                           [<a href="/context:graf?mode=overview">Zurück zur Übersicht.</a>]
                        </span>
                    </h2>
                   
                    <hr/>
                    <p>
                        <b>Zitiervorschlag: </b>
                        <xsl:if test="//t:teiHeader//t:titleStmt/t:author">
                            <xsl:value-of select="//t:teiHeader//t:titleStmt/t:author"/>
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        
                            <xsl:choose>
                                <xsl:when test="contains(//t:titleStmt/t:title,'==')">
                                    <xsl:value-of select="substring-before(//t:titleStmt/t:title,'==')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="//t:titleStmt/t:title"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        
                        <xsl:text>, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020. </xsl:text><br/>
                        <xsl:text>Permalink: </xsl:text>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>http:</xsl:text>
                                <xsl:value-of select="$server"/>
                                <xsl:text>/</xsl:text>
                                <xsl:value-of select="//t:idno"/>
                            </xsl:attribute>
                            <xsl:text>http:</xsl:text>
                            <xsl:value-of select="$server"/>
                            <xsl:text>/</xsl:text>
                            <xsl:value-of select="//t:idno"/>
                        </a>
                        <xsl:text>.</xsl:text>
                    </p>
                </div></div>
                
            </article>
           
        </section>


        <!-- aus Skerbisch: Tabs -->
        <section class="row equalheight" style="margin-bottom: 5em">
            <ul class="nav nav-tabs" style="margin-left: 1em">
                <li data-tab-id="metadata">
                    <xsl:if test="$mode = 'metadata'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a><xsl:attribute name="href"
                            select="concat($server, '/', $teipid, '/sdef:TEI/get?mode=metadata')"/>
                        Metadaten</a>
                </li>
                <li data-tab-id="text">
                    <!-- not($mode) macht, dass immer automatisch zuerst das hier offen ist -->
                    <xsl:if test="not($mode) or $mode = 'text'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a><xsl:attribute name="href"
                            select="concat($server, '/', $teipid, '/sdef:TEI/get?mode=text')"/> Text
                        &amp; Übersetzung</a>
                </li>
                <li data-tab-id="interpretation">
                    <xsl:if test="$mode = 'interpretation'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a><xsl:attribute name="href"
                            select="concat($server, '/', $teipid, '/sdef:TEI/get?mode=interpretation')"
                        /> Interpretation</a>
                </li>
                <li data-tab-id="vergleichstellen">
                    <xsl:if test="$mode = 'vergleichsstellen'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:if>
                    <a><xsl:attribute name="href"
                            select="concat($server, '/', $teipid, '/sdef:TEI/get?mode=vergleichsstellen')"
                        /> Vergleichsstellen</a>
                </li>  
            </ul>



            <div class="tab-content" style="background-color: #ffffff">
                <xsl:choose>
                    <xsl:when test="$mode = 'metadata'">
                        <!-- Metadaten zum Text -->
                        <div role="tabpanel" id="metadata">
                            <article class="col-md-12">
                                <div class="panel" style="overflow: hidden; padding-bottom: 5em">
                       
                            <!-- class="tab-pane" -->
                            <h3>Metadaten zum Text</h3>
                            <xsl:for-each select="t:TEI/t:teiHeader">
                                <table class="table table-striped" style="width: 100%;">
                                    <tr>
                                        <th>Titel</th>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="contains(//t:titleStmt/t:title,'==')">
                                                    <xsl:value-of select="substring-before(//t:titleStmt/t:title,'==')"/>
                                                </xsl:when>
                                                <xsl:otherwise><xsl:value-of select="//t:titleStmt/t:title"/></xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="//t:div[@type = 'translation']/t:head">
                                                <em>
                                                  <xsl:text>: </xsl:text>
                                                  <xsl:value-of
                                                  select="//t:div[@type = 'translation']/t:head"/>
                                                </em>
                                            </xsl:if>
                                            <xsl:text> </xsl:text>    
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Autor</th>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when
                                                  test="contains(//t:titleStmt/t:title, 'Phaedr.')">
                                                    <a target="blank">
                                                  <xsl:attribute name="href"
                                                  >http://d-nb.info/gnd/118593730</xsl:attribute>
                                                  Phaedrus</a>
                                                </xsl:when>
                                                <xsl:when
                                                  test="contains(//t:titleStmt/t:title, 'Aes.')">
                                                  <a target="blank">
                                                  <xsl:attribute name="href"
                                                  >http://d-nb.info/gnd/118647180</xsl:attribute>
                                                  Aesop</a>
                                                </xsl:when>
                                                <xsl:when test="contains(//t:titleStmt/t:title, 'Av')">
                                                    <a target="blank">
                                                        <xsl:attribute name="href">/context:graf?mode=avian</xsl:attribute>
                                                        Avian</a>
                                                </xsl:when>
                                                <xsl:when test="contains(//t:titleStmt/t:title, 'Babr')">
                                                    <a target="blank">
                                                        <xsl:attribute name="href"
                                                            >http://d-nb.info/gnd/118978160</xsl:attribute>
                                                        Babrios</a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="substring-before(//t:titleStmt/t:title, ' ')"/>
                                                  <!-- no author specified -->
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Vorkommende Akteure</th>
                                        <td>
                                            <xsl:for-each select="//t:listPerson/t:person">
                                                <span class="glyphicon glyphicon-user"
                                                  style="color: grey" aria-hidden="true">
                                                  <xsl:text> </xsl:text>
                                                </span>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="translate(.,';',' ')"/>
                                                <xsl:text> </xsl:text>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Themen (Schlagworte)</th>
                                        <td>
                                            <xsl:for-each select="//t:span[@ana = 'Thema']">
                                                <span class="glyphicon glyphicon-search"
                                                  style="color: grey" aria-hidden="true">
                                                  <xsl:text> </xsl:text>
                                                </span>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="."/>
                                                <xsl:text> </xsl:text>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Geeignete Lehrplanmodule</th>
                                        <td>
                                            <xsl:for-each select="//t:bibl[@type = 'Lehrplanmodul']">
                                                <span class="glyphicon glyphicon-inbox"
                                                  style="color: grey" aria-hidden="true">
                                                  <xsl:text> </xsl:text>
                                                </span>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="replace(replace(t:seg[@type='Lerndauer'], 'Lateinvierjährig', 'Latein vierjährig'), 'Lateinsechsjährig', 'Latein sechsjährig')"/>
                                                <xsl:text>, </xsl:text><xsl:value-of select="t:seg[@type='Semesterzuordnung']"/><xsl:text>: </xsl:text><em><xsl:value-of select="t:seg[@type='Modulname']"/></em><br/>
                                            </xsl:for-each>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Vergleichsstellen</th>
                                        <td>
                                            <xsl:for-each
                                                select="//t:listBibl[@type = 'Vergleichsstellen']/t:bibl/t:ref">
                                                <span class="glyphicon glyphicon-pencil"
                                                  style="color: grey" aria-hidden="true">
                                                  <xsl:text> </xsl:text>
                                                </span>
                                                <xsl:text> </xsl:text>
                                                <a>
                                                  <xsl:attribute name="href">
                                                   <xsl:value-of select="$server"/><xsl:text>/context:graf?mode=vglstellen</xsl:text>
                                                      <!--  warum geht das nicht? -->
                                                      <xsl:variable name="vglautor"  select="lower-case(translate(translate(@target,':#-–;',''),',','.'))"/>
                                                      <xsl:for-each select="document(concat('/context:graf/', 'VGLSTELLEN'))/t:TEI//t:div[@type = 'text'][t:span[@type='Vergleichstextidentitaet']/t:ref[lower-case(translate(@xml:id,'–-',''))=$vglautor]]">
                                                  <xsl:text>#</xsl:text><xsl:value-of select="t:span/t:ref/@xml:id"/></xsl:for-each>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="."/>
                                                </a>
                                                <xsl:text> </xsl:text>
                                            </xsl:for-each>
                                        </td>
                                    </tr>
                                    
                                    <!-- <xsl:when test="t:citedRange and t:editor"> incollection
                                    article <xsl:when test="t:citedRange and not(t:editor)">
                                    book <xsl:when test="not(t:citedRange)">
                                    onlinequelle <xsl:for-each select="//t:listBibl[@type='Onlinezitation']/t:biblStruct">
                                    
                                    bzw: in nur falls booktitle
                                    imprint nur falls vorhanden etc
                                    
                                    andererseits sollte es eig schon drin sein... weil es sind eh ifs.. oder 
                                    es wird nur überprüft, ob die Elemente vorhanden sind und nicht, ob befüllt..
                                    weil vorhandend sind sie womöglich so oder so...
                                    
                                    -->

                                    <xsl:if
                                        test="//t:sourceDesc/t:ab/t:listBibl[@type = 'Textgrundlage']/t:biblStruct">
                                        <tr>
                                            <th>Textgrundlage</th>
                                            <td>
                                                <xsl:for-each
                                                  select="//t:sourceDesc/t:ab/t:listBibl[@type = 'Textgrundlage']/t:biblStruct">
                                                  <span class="glyphicon glyphicon-file"
                                                  style="color: grey" aria-hidden="true">
                                                  <xsl:text> </xsl:text>
                                                  </span>
                                                  <xsl:text> </xsl:text>
                                                    <xsl:value-of select="t:note/t:bibl"/>
                                                    
                                                    <!-- automated citation is commented out because not wanted by project partners anymore -->

                                                   <!--  <xsl:if test="t:monogr/t:title != ''">                                               
                                                  <xsl:value-of select="t:monogr/t:title"/>
                                                  
                                                  <xsl:text>, </xsl:text>
                                                  </xsl:if>
                                                  <xsl:value-of
                                                  select="t:monogr/t:imprint/t:pubPlace"/>
                                                  <xsl:text> </xsl:text>
                                                  <xsl:value-of select="t:monogr/t:imprint/t:date"/>
                                                    <xsl:if test="t:citedRange != ''">
                                                        <xsl:text>, </xsl:text>
                                                        <xsl:value-of select="t:citedRange"/>
                                                        
                                                    </xsl:if>
                                                    <xsl:if test="t:ref">
                                                        <xsl:text>, </xsl:text>
                                                        <a>
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="."/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select="."/>
                                                        </a>
                                                        <xsl:text> [</xsl:text> <xsl:value-of select="t:ref/t:time/@when"/> <xsl:text>]</xsl:text>                                                  </xsl:if>
                                                  <xsl:text>.</xsl:text>
                                                  <br/>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>

                                    <xsl:if
                                        test="//t:sourceDesc/t:ab/t:listBibl[@type = 'Sekundärliteratur']/t:biblStruct">
                                        <tr>
                                            <th>Sekundärliteratur zur Textstelle</th>
                                            <td>
                                                <xsl:for-each
                                                  select="//t:sourceDesc/t:ab/t:listBibl[@type = 'Sekundärliteratur']/t:biblStruct">
                                                  <span class="glyphicon glyphicon-file"
                                                  style="color: grey" aria-hidden="true">
                                                  <xsl:text> </xsl:text>
                                                  </span>
                                                  <xsl:text> </xsl:text>
                                                    <xsl:for-each select="t:analytic/t:author/t:persName">
                                                        <xsl:choose> 
                                                        <xsl:when test="t:surname">
                                                            <xsl:value-of select="normalize-space(t:surname)"/>
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:value-of select="normalize-space(t:forename)"/>
                                                            <xsl:choose>
                                                                <xsl:when test="following-sibling::t:persName">
                                                                    <xsl:text>, </xsl:text>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:text>: </xsl:text>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="."/>
                                                            <xsl:if test="following-sibling::t:persName">
                                                                <xsl:text>, </xsl:text>
                                                            </xsl:if>
                                                            <xsl:text>: </xsl:text>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    </xsl:for-each>
                                                      
                                                      <xsl:choose>
                                                          <xsl:when test="t:monogr/t:biblScope != ''">
                                                              <xsl:if test="t:analytic/t:title != ''">
                                                                  <xsl:value-of select="t:analytic/t:title"/><xsl:text>, </xsl:text>
                                                              </xsl:if>
                                                              <xsl:value-of select="t:monogr/t:title"/><xsl:text> </xsl:text>
                                                              <xsl:value-of select="t:monogr/t:biblScope"/><xsl:text>,</xsl:text>
                                                          </xsl:when>
                                                          <xsl:otherwise>
                                                              <xsl:if test="t:analytic/t:title != ''">
                                                                  <xsl:value-of select="t:analytic/t:title"/>
                                                                  <xsl:text>, </xsl:text>
                                                              </xsl:if>
                                                              
                                                              <xsl:if test="t:monogr/t:title != ''">
                                                                  <xsl:if test="t:monogr/t:editor != ''"> 
                                                                      <xsl:text> in: </xsl:text>
                                                                      <xsl:for-each select="t:monogr/t:editor/t:persName">
                                                                          <xsl:choose> 
                                                                              <xsl:when test="t:surname">
                                                                                  <xsl:value-of select="normalize-space(t:surname)"/>
                                                                                  <xsl:text>, </xsl:text>
                                                                                  <xsl:value-of select="normalize-space(t:forename)"/>
                                                                              </xsl:when>
                                                                              <xsl:otherwise>
                                                                                  <xsl:value-of select="."/>
                                                                              </xsl:otherwise>
                                                                          </xsl:choose>
                                                                          <xsl:if test="following-sibling::t:persName">
                                                                              <xsl:text>, </xsl:text>
                                                                          </xsl:if>
                                                                      </xsl:for-each>
                                                                      <xsl:choose>
                                                                          <xsl:when test="count(t:monogr/t:editor/t:persName) > 1">
                                                                              <xsl:text> (Hgg.), </xsl:text>
                                                                          </xsl:when>
                                                                          <xsl:otherwise>
                                                                              <xsl:text> (Hg.), </xsl:text>
                                                                          </xsl:otherwise>
                                                                      </xsl:choose>
                                                                  </xsl:if>
                                                                  
                                                                  <xsl:value-of select="t:monogr/t:title"/>
                                                                  <xsl:text>, </xsl:text>
                                                              </xsl:if>
                                                              
                                                              
                                                              <xsl:choose>
                                                                  <xsl:when test="count(t:monogr/t:imprint/t:pubPlace/t:placeName) > 1">
                                                                      <xsl:for-each select="t:monogr/t:imprint/t:pubPlace/t:placeName">
                                                                          <xsl:value-of select="."/>
                                                                          <xsl:if test="count(following-sibling::t:placeName) > 0">
                                                                              <xsl:text>/</xsl:text>
                                                                          </xsl:if>
                                                                      </xsl:for-each>
                                                                  </xsl:when>
                                                                  <xsl:otherwise>
                                                                      <xsl:value-of
                                                                          select="t:monogr/t:imprint/t:pubPlace"/> 
                                                                  </xsl:otherwise>
                                                              </xsl:choose>
                                                              
                                                          </xsl:otherwise>
                                                      </xsl:choose>
                                                  
                                                  
                                                  
                                                    <xsl:text> </xsl:text>
                                                  <xsl:value-of select="t:monogr/t:imprint/t:date"/>
                                                    
                                                    <xsl:if test="t:citedRange != ''">
                                                        <xsl:text>, </xsl:text>
                                                        <xsl:value-of select="t:citedRange"/>
                                                        
                                                    </xsl:if>
                                                    <xsl:if test="t:ref != ''">
                                                        <xsl:text>, </xsl:text>
                                                        <a>
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="."/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select="."/>
                                                        </a>
                                                        <xsl:text> [</xsl:text> <xsl:value-of select="t:ref/t:time/@when"/> <xsl:text>]</xsl:text> 
                                                        </xsl:if>
                                                         -->
                                                  <xsl:text>.</xsl:text>
                                                  <br/>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if
                                        test="//t:sourceDesc/t:ab/t:listBibl[@type = 'Primärliteratur']/t:biblStruct">
                                        <tr>
                                            <th>Weitere Primärliteratur zur Textstelle</th>
                                            <td>
                                                <xsl:for-each
                                                    select="//t:sourceDesc/t:ab/t:listBibl[@type = 'Primärliteratur']/t:biblStruct">
                                                    <span class="glyphicon glyphicon-file"
                                                        style="color: grey" aria-hidden="true">
                                                        <xsl:text> </xsl:text>
                                                    </span>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:value-of select="t:note/t:bibl"/>
                                                    <!-- former automated citation was not wanted anymore and thus replaced in the data by one single bibl -->
                                                    <!-- 
                                                    <xsl:choose>
                                                        <xsl:when test="t:analytic/t:author/t:persName/t:surname">
                                                            <xsl:value-of select="normalize-space(t:analytic/t:author/t:persName/t:surname)"/>
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:value-of select="normalize-space(t:analytic/t:author/t:persName/t:forename)"/>
                                                            <xsl:text>: </xsl:text>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="t:analytic/t:author/t:persName"/><xsl:text>: </xsl:text>
                                                        </xsl:otherwise>
                                                    </xsl:choose>

                                                    <xsl:value-of select="t:analytic/t:title"/>
                                                    <xsl:if test="t:monogr/t:title != ''">
                                                        <xsl:text> in: </xsl:text>
                                                        <xsl:if test="t:monogr/t:editor != ''">
                                                            <xsl:value-of select="normalize-space(t:monogr/t:editor)"/>
                                                            <xsl:text> (Hg.), </xsl:text>
                                                        </xsl:if>
                                                     
                                                            <xsl:value-of select="t:monogr/t:title"/>
                                                        
                                                        <xsl:text>, </xsl:text>
                                                    </xsl:if>
                                                    <xsl:value-of
                                                        select="t:monogr/t:imprint/t:pubPlace"/>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:value-of select="t:monogr/t:imprint/t:date"/>
                                                    
                                                    <xsl:if test="t:citedRange != ''">
                                                        <xsl:text>, </xsl:text>
                                                        <xsl:value-of select="t:citedRange"/>
                                                        
                                                    </xsl:if>
                                                    <xsl:if test="t:ref">
                                                        <xsl:text>, </xsl:text>
                                                        <a>
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="."/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select="."/>
                                                        </a>
                                                        <xsl:text> [</xsl:text> <xsl:value-of select="t:ref/t:time/@when"/> <xsl:text>]</xsl:text>                                                  </xsl:if>
                                                     -->
                                                    <xsl:text>.</xsl:text>
                                                    <br/>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if
                                        test="//t:sourceDesc/t:ab/t:listBibl[@type = 'Onlinezitation']/t:biblStruct">
                                        <tr>
                                            <th>Onlinequellen zur Textstelle</th>
                                            <td>
                                                <xsl:for-each
                                                    select="//t:sourceDesc/t:ab/t:listBibl[@type = 'Onlinezitation']/t:biblStruct">
                                                    <span class="glyphicon glyphicon-file"
                                                        style="color: grey" aria-hidden="true">
                                                        <xsl:text> </xsl:text>
                                                    </span>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="t:analytic/t:author/t:persName/t:surname">
                                                            <xsl:value-of select="normalize-space(t:analytic/t:author/t:persName/t:surname)"/>
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:value-of select="normalize-space(t:analytic/t:author/t:persName/t:forename)"/>
                                                            <xsl:text>: </xsl:text>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="t:analytic/t:author/t:persName"/><xsl:text>: </xsl:text>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                
                                                        <xsl:value-of select="t:analytic/t:title"/>
                                                    <xsl:if test="t:monogr/t:title != ''">
                                                        <xsl:text>, in: </xsl:text>
                                                        <xsl:if test="t:monogr/t:editor != ''">
                                                            <xsl:value-of select="normalize-space(t:monogr/t:editor)"/>
                                                            <xsl:text> (Hg.), </xsl:text>
                                                        </xsl:if>
                                                        
                                                            <xsl:value-of select="t:monogr/t:title"/>
                                                        
                                                        <xsl:text>, </xsl:text>
                                                    </xsl:if>
                                                    <xsl:value-of
                                                        select="t:monogr/t:imprint/t:pubPlace"/>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:value-of select="t:monogr/t:imprint/t:date"/>
                                                    
                                                    <xsl:if test="t:citedRange != ''">
                                                        <xsl:text>, </xsl:text>
                                                        <xsl:value-of select="t:citedRange"/>
                                                        
                                                    </xsl:if>
                                                    <xsl:if test="t:ref">
                                                        <xsl:text>, </xsl:text>
                                                        <a>
                                                            <xsl:attribute name="href">
                                                                <xsl:value-of select="."/>
                                                            </xsl:attribute>
                                                            <xsl:value-of select="."/>
                                                        </a>
                                                        <xsl:text> [</xsl:text> <xsl:value-of select="t:ref/t:time/@when"/> <xsl:text>]</xsl:text>                                                  </xsl:if>
                                                    <xsl:text>.</xsl:text>
                                                    <br/>
                                                </xsl:for-each>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>Verantwortlichkeiten</th>
                                        <td>
                                            <xsl:for-each select="//t:respStmt">
                                                <xsl:for-each select="t:resp">
                                                    <xsl:choose>
                                                        <xsl:when test="(@from and @to) or @when">
                                                            <b>
                                                                <xsl:text>[</xsl:text>
                                                                <xsl:choose>
                                                                    <xsl:when test="@from">
                                                                        <xsl:value-of select="normalize-space(@from)"/>
                                                                        <xsl:text> bis </xsl:text>
                                                                        <xsl:value-of select="normalize-space(@to)"/>
                                                                    </xsl:when>
                                                                    <xsl:when test="@when">
                                                                        <xsl:value-of select="normalize-space(@when)"/>
                                                                    </xsl:when>
                                                                </xsl:choose>
                                                                <xsl:text>] </xsl:text>
                                                            </b></xsl:when>
                                                        <xsl:otherwise>
                                                            <b>[2017-2019] </b>
                                                        </xsl:otherwise></xsl:choose>
                                                    <xsl:value-of select="normalize-space(preceding-sibling::t:persName)"/>
                                                    <xsl:text>: </xsl:text>
                                                    <xsl:value-of select="."/><xsl:text>. </xsl:text>
                                                    <br/>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>Permalink</th>
                                        <td>
                                            
                                            <a>
                                                <xsl:attribute name="href">
                                                  <xsl:text>http://gams.uni-graz.at/</xsl:text>
                                                  <xsl:value-of select="//t:idno"/>
                                                </xsl:attribute>
                                                <xsl:text>http://gams.uni-graz.at/</xsl:text>
                                                <xsl:value-of select="//t:idno"/>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Dublin Core</th>
                                        <td>
                                            <a target="blank">
                                                    <xsl:attribute name="href">
                                                        <xsl:text>http:</xsl:text>
                                                        <xsl:value-of select="$server"/>
                                                        <xsl:text>/archive/objects/</xsl:text>
                                                        <xsl:value-of select="//t:idno"/>
                                                        <xsl:text>/methods/sdef:Object/getDC?</xsl:text>
                                                    </xsl:attribute>
                                                    Dublin Core Metadata
                                                </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Zitiervorschlag</th>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="contains(//t:titleStmt/t:title,'==')">
                                                    <xsl:value-of select="substring-before(//t:titleStmt/t:title,'==')"/>
                                                </xsl:when>
                                                <xsl:otherwise><xsl:value-of select="//t:titleStmt/t:title"/></xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="//t:div[@type = 'translation']/t:head">
                                             
                                                    <xsl:text>: </xsl:text>
                                                    <xsl:value-of
                                                        select="normalize-space(//t:div[@type = 'translation']/t:head)"/>
                                                
                                            </xsl:if>
                                            <xsl:text>, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020. Permalink: </xsl:text>
                                            <a>
                                                <xsl:attribute name="href"> 
                                                    <xsl:text>http:</xsl:text>
                                                    <xsl:value-of select="$server"/>
                                                    <xsl:text>/</xsl:text>
                                                    <xsl:value-of select="//t:idno"/>
                                                </xsl:attribute>
                                                <xsl:text>http:</xsl:text>
                                                <xsl:value-of select="$server"/>
                                                <xsl:text>/</xsl:text>
                                                <xsl:value-of select="//t:idno"/>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Lizenzbestimmungen</th>
                                        <td>
                                            <xsl:apply-templates select="t:fileDesc//t:availability"
                                            />
                                        </td>
                                    </tr>
                                </table>
                            </xsl:for-each>
                                </div></article>
                        </div>
                    </xsl:when>


                    <xsl:when test="not($mode) or $mode = 'text'">
                        <div role="tabpanel" id="text">
                            <article class="col-md-8">
                                
                                <div class="panel" style="overflow: auto; padding-bottom: 5em">
                                    
                                    <div class="static-wrapper-no-bottom">
                                        <h3>Text und Übersetzung</h3>
                                    </div>
                                   
                                    <article class="col-md-7 equal">
                                        <!-- Text -->
                                        <xsl:for-each select="//t:div[@type = 'originaltext']">
                                            <xsl:if test="t:head">
                                                <xsl:for-each select="t:head">
                                                  <h2>
                                                  <xsl:apply-templates mode="tei"/>
                                                  </h2>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <xsl:for-each
                                                select="t:div[@type = 'Abschnitt/Sinneinheit']">
                                                <span class="Gliederung">
                                                    <br/>
                                                    <br/>
                                                  <b>
                                                  <xsl:value-of select="t:head"/>
                                                  </b>
                                                </span>
                                                <xsl:choose>
                                                  <xsl:when test="t:lg">
                                                  <xsl:for-each select="t:lg">
                                                  <table
                                                      class="table table-responsive table-condensed table-borderless">
                                                  <tbody>
                                                  <xsl:apply-templates mode="tei"/>
                                                  </tbody>
                                                  </table>
                                                  </xsl:for-each>
                                                  </xsl:when>

                                                  <xsl:otherwise>
                                                  <xsl:for-each select="t:p">
                                                  <p>
                                                  <xsl:apply-templates mode="tei"/>
                                                      <xsl:text> </xsl:text>
                                                  </p>
                                                  </xsl:for-each>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </article>
                                    <article class="col-md-5 equal">
                                        <!-- Uebersetzung -->
                                        
                                            <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#uebers" style="margin-top:2em;">Übersetzung</button>
                                        <div id="uebers" class="collapse"  style="margin-top:2em;">
                                       
                                        <xsl:for-each select="//t:div[@type = 'translation']">
                                            <xsl:if test="t:head">
                                                <h2>
                                                  <xsl:value-of select="t:head"/>
                                                </h2>
                                            </xsl:if>
                                            <xsl:for-each select="t:p[@rend = 'translation']">
                                                <p>
                                                    <xsl:apply-templates/><xsl:text> </xsl:text>
                                                </p>
                                            </xsl:for-each>
                                        </xsl:for-each></div>
                                    </article>
                                </div>
                            </article>
                            <!-- Side-bar mit den Fußnoten und so.. -->
                            <article class="col-md-4">
                                <div class="panel" style="overflow: hidden; padding-bottom: 5em">
                                    <h2>Anpassen</h2>
                                    <ul class="checkbox">

                                        <xsl:if test="//t:note[contains(@type, 'Vokabel')]">
                                        <li><label><input class="scm-checkbox" data-scm-target=".vokabel" data-scm-class="scm-vokabel" type="checkbox"/>
                                            <xsl:text>Vokabelangaben</xsl:text></label></li></xsl:if>
                                        <xsl:if test="//t:note[contains(@type, 'Sach')]">
                                        <li><label><input class="scm-checkbox" data-scm-target=".realien" data-scm-class="scm-realien" type="checkbox"/>
                                            <xsl:text>Sachangaben</xsl:text></label></li></xsl:if>
                                        <xsl:if test="//t:note[contains(@type, 'Grammatik')]">
                                        <li><label><input class="scm-checkbox" data-scm-target=".grammatik" data-scm-class="scm-grammatik" type="checkbox"/>
                                            <xsl:text>Grammatik-Angaben</xsl:text></label></li></xsl:if>
                                        <xsl:if test="//t:note[contains(@type, 'Stilistik')]">
                                        <li><label><input class="scm-checkbox" data-scm-target=".stilistik" data-scm-class="scm-stilistik" type="checkbox"/>
                                            <xsl:text>Stilistische Anmerkungen</xsl:text></label></li></xsl:if>
                                        <xsl:if test="//t:note[contains(@type, 'Textkritik')]">
                                        <li><label><input class="scm-checkbox" data-scm-target=".textkritik" data-scm-class="scm-textkritik" type="checkbox"/>
                                            <xsl:text>Textkritik</xsl:text></label></li></xsl:if>
                                        
                                        <xsl:if test="//t:l[@real]">
                                            <li><label><input class="scm-checkbox" data-scm-target=".metrik" data-scm-class="scm-metrik" type="checkbox"/>
                                                <xsl:text>Metrik</xsl:text></label></li></xsl:if>
                                        <xsl:if test="//t:head[contains(@n, 'Gliederung')]">
                                            <li><label><input class="scm-checkbox" data-scm-target=".Gliederung" data-scm-class="scm-Gliederung" type="checkbox"/>
                                                <xsl:text>Gliederung</xsl:text></label></li></xsl:if>
                                    </ul>

                                    <hr/>
                                    <div title="Angaben" style="font-size:small;">
                                        <xsl:if test="//t:note">
                                            <h2>Angaben zum Text</h2>
                                            <xsl:if test="//t:note[contains(@type, 'Vokabel')]">
                                                <a style="text-decoration:none;" data-toggle="collapse" href="#vokabel"><h3 class="scm-vokabel"
                                                    >Vokabelangaben</h3></a>
                                                <div id="vokabel" class="collapse">
                                                <ol style="padding-left: 1em;">
                                                  <xsl:for-each
                                                  select="//t:note[contains(@type, 'Vokabel')]">
                                                  <li style="font-size:smaller;">
                                                      <xsl:choose>
                                                          <xsl:when test="ancestor::t:head">
                                                              <b>[Überschrift] </b>
                                                          </xsl:when>
                                                          <xsl:when test="ancestor::t:l">
                                                              <b><xsl:text>[Zeile </xsl:text>
                                                                  <xsl:value-of select="ancestor::t:l/@n"/>
                                                                  <xsl:text>]</xsl:text></b>
                                                          </xsl:when>
                                                      </xsl:choose>
                                                  <xsl:apply-templates mode="angaben"/>
                                                  </li>
                                                  </xsl:for-each>
                                                </ol>
                                                <hr/></div>
                                            </xsl:if>

                                            <xsl:if test="//t:note[contains(@type, 'Stilistik')]">
                                                <a style="text-decoration:none;" data-toggle="collapse" href="#stilistik"><h3 class="scm-stilistik">Stilistik</h3></a>
                                                    <div id="stilistik" class="collapse">
                                                <ol style="padding-left: 1em;">
                                                  <xsl:for-each
                                                  select="//t:note[contains(@type, 'Stilistik')]">
                                                  <li style="font-size:smaller;">
                                                      <xsl:choose>
                                                          <xsl:when test="ancestor::t:head">
                                                              <b>[Überschrift] </b>
                                                          </xsl:when>
                                                          <xsl:when test="ancestor::t:l">
                                                              <b><xsl:text>[Zeile </xsl:text>
                                                                  <xsl:value-of select="ancestor::t:l/@n"/>
                                                                  <xsl:text>]</xsl:text></b>
                                                          </xsl:when>
                                                      </xsl:choose>
                                                  <xsl:apply-templates mode="angaben"/>
                                                  </li>
                                                  </xsl:for-each>
                                                </ol>
                                                <hr/></div>
                                            </xsl:if>

                                            <xsl:if test="//t:note[contains(@type, 'Grammatik')]">
                                                <a style="text-decoration:none;" data-toggle="collapse" href="#grammatik"><h3  class="scm-grammatik"
                                                    >Grammatik</h3></a>
                                                <div id="grammatik" class="collapse">
                                                <ol style="padding-left: 1em;">
                                                  <xsl:for-each
                                                  select="//t:note[contains(@type, 'Grammatik')]">
                                                  <li style="font-size:smaller;">
                                                      <xsl:choose>
                                                          <xsl:when test="ancestor::t:head">
                                                              <b>[Überschrift] </b>
                                                          </xsl:when>
                                                          <xsl:when test="ancestor::t:l">
                                                              <b><xsl:text>[Zeile </xsl:text>
                                                              <xsl:value-of select="ancestor::t:l/@n"/>
                                                              <xsl:text>]</xsl:text></b>
                                                          </xsl:when>
                                                      </xsl:choose>
                                                      <xsl:apply-templates mode="angaben"/>
                                                  </li>
                                                  </xsl:for-each>
                                                </ol>
                                                <hr/></div>
                                            </xsl:if>

                                            <xsl:if test="//t:note[contains(@type, 'Sach')]">
                                                <a style="text-decoration:none;" data-toggle="collapse" href="#realien"><h3  class="scm-realien"
                                                    >Sachangaben</h3></a>
                                                <div id="realien" class="collapse">
                                                <ol style="padding-left: 1em;">
                                                  <xsl:for-each
                                                  select="//t:note[contains(@type, 'Sach')]">
                                                  <li style="font-size:smaller;">
                                                      <xsl:choose>
                                                          <xsl:when test="ancestor::t:head">
                                                              <b>[Überschrift] </b>
                                                          </xsl:when>
                                                          <xsl:when test="ancestor::t:l">
                                                              <b><xsl:text>[Zeile </xsl:text>
                                                                  <xsl:value-of select="ancestor::t:l/@n"/>
                                                                  <xsl:text>]</xsl:text></b>
                                                          </xsl:when>
                                                      </xsl:choose>
                                                  <xsl:apply-templates mode="angaben"/>
                                                  </li>
                                                  </xsl:for-each>
                                                </ol>
                                                <hr/></div>
                                            </xsl:if>

                                            <xsl:if test="//t:note[contains(@type, 'Textkritik')]">
                                                <a style="text-decoration:none;" data-toggle="collapse" href="#textkritik"><h3  class="scm-textkritik">Textkritischer
                                                    Apparat</h3></a>
                                                <div id="textkritik" class="collapse">
                                                <ol style="padding-left: 1em;">
                                                  <xsl:for-each
                                                  select="//t:note[contains(@type, 'Textkritik')]">
                                                  <li style="font-size:smaller;">
                                                      <xsl:choose>
                                                          <xsl:when test="ancestor::t:head">
                                                              <b>[Überschrift] </b>
                                                          </xsl:when>
                                                          <xsl:when test="ancestor::t:l">
                                                              <b><xsl:text>[Zeile </xsl:text>
                                                                  <xsl:value-of select="ancestor::t:l/@n"/>
                                                                  <xsl:text>]</xsl:text></b>
                                                          </xsl:when>
                                                      </xsl:choose>
                                                  <xsl:apply-templates mode="angaben"/>
                                                  </li>
                                                  </xsl:for-each>
                                                </ol>
                                                <br/></div>
                                            </xsl:if>

                                        </xsl:if>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </xsl:when>
                    <xsl:when test="$mode = 'interpretation'">
                        <div role="tabpanel" id="interpretation">
                            <article class="col-md-12">
                                <div class="panel" style="overflow: hidden; padding-bottom: 5em">
                                    <h3>Arbeitsaufträge <span style="float: right;"><a target="blank" style="text-decoration:none; border-bottom:none; ">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="$server"/><xsl:text>/archive/objects/</xsl:text>
                                            <xsl:value-of select="//t:idno"/>
                                            <xsl:text>/methods/sdef:TEI/getLaTeXPDF?mode=interpretation</xsl:text>
                                        </xsl:attribute>
                                        <img src="/templates/img/pdf_icon.png" width="30" height="30"
                                            alt="Druckversion"/>
                                        Download LehrerInnenversion
                                    </a></span></h3>
                                   
                                    
                                    <xsl:for-each select="//t:div[@type = 'Interpretationsfrage']">
                                        <div class="panel-group  no-underline-links">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" style="text-decoration: none;">
                                                                <xsl:attribute name="href">
                                                                    <xsl:text>#</xsl:text>
                                                                    <xsl:for-each select="t:head">
                                                                        <xsl:text>interpret</xsl:text><xsl:value-of select="count(preceding::t:head[ancestor::t:div[@type = 'Interpretationsfrage']]) + 1"/>
                                                                    </xsl:for-each>
                                                                </xsl:attribute>
                                                                <!-- Verbindung zw. dem oberen Teil des ausklappbaren Dings mit dem Inhalt ueber die hier generierte ID -->
                                                                <xsl:for-each select="t:head">
                                                                        <xsl:value-of select="count(preceding::t:head[parent::t:div[@type = 'Interpretationsfrage']]) + 1"/><xsl:text>.) </xsl:text>
                                                                        <xsl:apply-templates mode="tei"/>
                                                                    </xsl:for-each>
                                                               
                                                                <xsl:text>  </xsl:text>
                                                                <small>
                                                                    <span class="glyphicon glyphicon-menu-down">
                                                                        <xsl:text> </xsl:text>
                                                                    </span>
                                                                </small>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div class="panel-collapse collapse">
                                                        <xsl:attribute name="id">
                                                            <xsl:for-each select="t:head">
                                                                <xsl:text>interpret</xsl:text><xsl:value-of select="count(preceding::t:head[ancestor::t:div[@type = 'Interpretationsfrage']]) + 1"/>
                                                            </xsl:for-each>
                                                        </xsl:attribute>
                                                        <div class="panel-body">
                                                            <xsl:for-each select="t:table[@subtype='Vergleichstabelle']">
                                                                <table class="table table-hover table-responsive" style="table-layout: fixed;white-space:normal;">
                                                                    <xsl:for-each select="t:row">
                                                                        <tr style="display: block; float: left;width:45%;">
                                                                            <th><xsl:value-of select="t:cell[@role='label']"/></th>
                                                                            <xsl:for-each select="t:cell[@rend]">
                                                                                <xsl:sort select="@rend"/> <!-- soll das hier passieren oder nicht? vllt ist die Ordnung aus den Daten besser? -->
                                                                                <td class="success" style="display: block;word-wrap: break-all;">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="@rend[.='formal']">
                                                                                            <xsl:attribute name="class">success</xsl:attribute>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <xsl:attribute name="class">warning</xsl:attribute>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                    <b><xsl:value-of select="@rend"/><xsl:text>: </xsl:text></b>
                                                                                    <xsl:apply-templates mode="tei"/>
                                                                                </td>
                                                                            </xsl:for-each>
                                                                            <xsl:text> </xsl:text>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                    
                                                                </table>
                                                            </xsl:for-each>
                                                            
                                                            <xsl:for-each
                                                                select="t:p[@rend = 'Erwartungshorizont']">
                                                                <p>
                                                                    <xsl:apply-templates mode="tei"/>
                                                                </p>
                                                            </xsl:for-each>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        
                                       
                                    </xsl:for-each>
                                </div>
                            </article>

                        </div>
                    </xsl:when>

                    <xsl:when test="$mode = 'vergleichsstellen'">
                        <div role="tabpanel" id="interpretation">
                            <article class="col-md-12">
                                <div class="panel no-underline-links" style="overflow: hidden; padding-bottom: 5em">
                                    <div class="static-wrapper-no-bottom">
                                        <h3>Vergleichsstellen</h3>
                                    </div>

                                    <div class="static-wrapper" style="padding-bottom:1em; border-bottom:0px dotted #596C75;"> <!-- -->
 <xsl:for-each select="//t:listBibl[@type='Vergleichsstellen']/t:bibl/t:ref">
     <xsl:sort select="t:listBibl[@type='Vergleichsstellen']/t:bibl/t:ref"/>
     <xsl:variable name="vglautor"  select="lower-case(translate(translate(@target,';:#-–',''),',','.'))"/>
     <xsl:for-each select="document(concat('/context:graf/', 'VGLSTELLEN'))/t:TEI//t:div[@type = 'text'][t:span[@type='Vergleichstextidentitaet']/t:ref[lower-case(translate(@xml:id,'-–',''))=$vglautor]]">
       
         <div class="static-wrapper" style="padding-bottom:1em;border-bottom:0px dotted #596C75;
             "> <!--  -->
             <xsl:attribute name="id">
                 <xsl:value-of
                     select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@xml:id"
                 />
             </xsl:attribute>
             <h4>
                 <xsl:value-of
                     select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@n"
                 /></h4>
             <div class="static-wrapper col-md-10"
                 style="background-color: #ecece7;">
                 <xsl:apply-templates mode="vgl"/>
             </div>
             <xsl:text>  </xsl:text>
             <!-- die Infos zum Autor aus dem Autorenglossar herausziehen -->
             <a class="autorenbutton" data-toggle="tooltip">
                 <xsl:attribute name="title">
                     <xsl:variable name="thisauthor" select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@ana"/>
                     <xsl:for-each select="document(concat('/context:graf/', 'VGLSTELLEN'))/t:TEI//t:person[@xml:id=$thisauthor]/t:p">
                         <xsl:apply-templates/><xsl:text> </xsl:text>
                     </xsl:for-each>
                 </xsl:attribute>
                     <xsl:text>    </xsl:text>
                     <span class="glyphicon glyphicon-user"> <xsl:text> </xsl:text></span>
                     <xsl:value-of select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@ana"/>

             </a>
             
             
         </div>
     </xsl:for-each>
 </xsl:for-each>
                                        
                                        
                                    </div>
                                   
                                </div>
                            </article>
                           
                        </div>
                    </xsl:when>
                </xsl:choose>
            </div>
        </section>
        </main>
    </xsl:template>



    <!-- aus Alchem: -->
    <xsl:template match="t:div" mode="tei">
        <xsl:apply-templates mode="tei"/>
    </xsl:template>

    <xsl:template match="t:head" mode="tei">
        <h3>
            <xsl:apply-templates mode="tei"/>
        </h3>
    </xsl:template>

    <xsl:template match="t:p" mode="tei">
        <p>
            <xsl:apply-templates mode="tei"/><xsl:text> </xsl:text>
        </p>
    </xsl:template>

    <xsl:template match="t:lb" mode="tei"><xsl:text> </xsl:text>
        <br/>
    </xsl:template>

    <xsl:template match="t:l[t:milestone]" mode="tei">
        <tr>
            <th>
                <xsl:text> </xsl:text>
            </th>
            <td>
                <span class="Gliederung" style="text-decoration:underline;font-size:medium;">
                    <em>
                        <xsl:value-of select="t:milestone/@n"/>
                    </em>
                </span>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="t:l" mode="tei">
        <tr>
            <th>
                <xsl:value-of select="@n"/>
            </th>
            <td>
                <span class="metrik"
                    style="font-size:smaller;letter-spacing:7px;font-family:Symbola;">
                    <xsl:value-of select="replace(replace(replace(replace(@met, '[ùú]', '&#9169;&#x0301;'), '[àá]','—&#x0301;'), 'u', '◡'), 'a','—')"/>
                    
                    <!-- &#x0301;&#9169;
                    http://www.htmlescape.net/03/character_combining_acute_accent_0301.html
                    https://r12a.github.io/app-conversion/
                    longa —
                    brevis http://www.fileformat.info/info/unicode/char/0023D1/index.htm
                    
                    aá|uá|aá|u//á|aá|uú
                    
                    , 'ù', '́⏑') 
                    , 'à','́—'),
                    
                    ́⏑
                    
                    sollte man eig nicht brauchen
                    
                    translate scheint es trotz der kombinierten Version als 2 Einzeldinger zu erkennen und ersetzt nur jeweils das erste dadurch
                    
                    , 'ú', '◡'), 'á','—')"/>
                    -->
                    <br/>
                </span>
                <p><xsl:if test="contains(@met,'pentameter') or contains(@real,'pentameter')">
                    <xsl:attribute name="style"><xsl:text>text-indent:10%;</xsl:text></xsl:attribute>
                </xsl:if>
                <xsl:apply-templates mode="tei"/></p>
            </td>
        </tr>
    </xsl:template>

<xsl:template match="t:l">
    <p>
        <xsl:if test="contains(@met,'pentameter') or contains(@real,'pentameter')">
            <xsl:attribute name="style"><xsl:text>text-indent:10%;</xsl:text></xsl:attribute>
        </xsl:if>
    <xsl:apply-templates/></p>
</xsl:template>



    <xsl:template match="t:note" mode="tei">
        <span class="note">
            <xsl:apply-templates mode="tei"/>
        </span>
    </xsl:template>


    <xsl:template match="t:hi[@rend = 'italic']" mode="tei">
        <em>
            <xsl:apply-templates mode="tei
            "/>
        </em>
    </xsl:template>

    <xsl:template match="t:hi" mode="tei">
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="@rend"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="t:note[contains(@type, 'Vokabel')]">vokabel</xsl:when>
                    <xsl:when test="t:note[contains(@type, 'Stilistik')]">stilistik</xsl:when>
                    <xsl:when test="t:note[contains(@type, 'Sach')]">realien</xsl:when>
                    <xsl:when test="t:note[contains(@type, 'Grammatik')]">grammatik</xsl:when>
                    <xsl:when test="t:note[contains(@type, 'Textkritik')]">textkritik</xsl:when>
                    <xsl:otherwise>noclass</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <a style="text-decoration:none;" href="#" data-toggle="tooltip" data-html="true" data-placement="right">
                <xsl:attribute name="title">
                    <xsl:for-each select="t:note">
                        <xsl:value-of select="."/>
                    </xsl:for-each>
                </xsl:attribute>
            <xsl:apply-templates mode="tei"/></a>
        </span>
    </xsl:template>

<xsl:template match="t:ref[ancestor::t:div[@type='originaltext']]" mode="tei">
    <!-- loeschen, sonst steht ein Ref unerwünscht im Text, es soll nur in der Seitenleiste ausgelesen werden -->
</xsl:template>
    
    <xsl:template match="t:ref" mode="tei">
        <!-- macht Fehler im Haupttext
        <a> 
            <xsl:attribute name="href">
                <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:apply-templates mode="tei"/>
        </a> -->
        <xsl:choose>
            <xsl:when test="ancestor::t:head[ancestor::t:div[@type='Interpretationsfrage']]">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <a> 
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:apply-templates mode="tei"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="t:seg[@xml:lang='la']" mode="tei">
        <em><xsl:apply-templates mode="tei"/></em>
    </xsl:template>
    
    
    <!-- ................................. mode ANGABEN ................................. -->
    
    <xsl:template match="t:note" mode="angaben">
        <span class="note">
            <xsl:apply-templates mode="angaben"/>
        </span>
    </xsl:template>
    
    
    <xsl:template match="t:hi[@rend = 'italic']" mode="angaben">
        <em>
            <xsl:apply-templates mode="angaben
                "/>
        </em>
    </xsl:template>
    
    <xsl:template match="t:seg[@xml:lang='la'] | t:seg[@xml:lang='grc']" mode="angaben">
        <em>
            <xsl:apply-templates mode="angaben
                "/>
        </em>
    </xsl:template>
    
    <xsl:template match="t:ref" mode="angaben">
       <!-- 
       hier weitermachen.. wird wohl doch bissl komplizierter...
       -->
        <xsl:choose>
            <xsl:when test="ancestor::t:head[ancestor::t:div[@type='Interpretationsfrage']]">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <a> 
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:apply-templates mode="angaben"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
        
        <!-- 
        <ref target="#King-1998::836">King, 1998::836.</ref>
        biblStruct xml:id="King-1998"
        if not contains '::'
        #Phaedrus (fixe Anzahl / Keywords für unsere Texte
        if matches vgl-stelle ID
        für alle anderen contains(.  = Zitatname
        -->
    </xsl:template>
    
    
    <!-- ................................. mode VGL ................................. -->
    <xsl:template match="t:head[parent::t:div[@type='translation']]" mode="vgl">
        <h5>
            <xsl:apply-templates/>
        </h5>
    </xsl:template>
    
    <xsl:template match="t:head" mode="vgl">
        <h5>
            <xsl:apply-templates/>
        </h5>
    </xsl:template>
   

    <xsl:template match="t:div[@type='translation']" mode="vgl">
        <hr/>
            <xsl:apply-templates mode="vgl"/>
    </xsl:template>
    
    <xsl:template match="t:p[xml:lang='la']" mode="vgl">
        <p><xsl:apply-templates mode="vgl"/></p>
        
        <hr/>
    </xsl:template>
    
    <xsl:template match="t:p[xml:lang='grc']" mode="vgl">
        <p><xsl:apply-templates mode="vgl"/></p>
        <hr/>
    </xsl:template>
    
    <xsl:template match="t:p" mode="vgl">
        <xsl:apply-templates mode="vgl"/><xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="t:l" mode="vgl">
        <em><xsl:if test="contains(@met,'pentameter')">
            <xsl:attribute name="style"><xsl:text>text-indent:10%;</xsl:text></xsl:attribute>
        </xsl:if>
        <xsl:apply-templates mode="vgl"/><br/></em>
    </xsl:template>
    
    <xsl:template match="t:hi[@rend = 'italic']" mode="vgl">
        <em><xsl:apply-templates mode="vgl"/></em>
    </xsl:template>
    
    
    <xsl:template match="t:span[@type = 'Textgrundlage']" mode="vgl">
        <hr/><span class="blackwhite-span">
            <a target="blank" style="color:#f9f4ea;border-bottom: none;">
                
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('/context:graf?mode=vglstellen',translate(t:ref/@target, '-', ''))"/>
                </xsl:attribute>
                <xsl:value-of select="t:ref"/>
            </a>
        </span>
    </xsl:template>
    
    <xsl:template match="t:span[@ana = 'Akteur']" mode="vgl">
        <span>
            <xsl:choose>
                <xsl:when test="t:persName[@type = 'animal']">
                    <xsl:attribute name="class">
                        <xsl:text>animal-tag</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="t:persName[@type = 'person']">
                    <xsl:attribute name="class">
                        <xsl:text>person-tag</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="style">
                        <xsl:text>background-color:#fff;padding:0.2em;</xsl:text>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="translate(t:persName,';',' ')"/>
        </span>
    </xsl:template>
    
    <xsl:template match="t:span[@ana = 'keyword']" mode="vgl">
        <span class="red-box">
            <xsl:value-of select="translate(t:term,';',' ')"/>
        </span>
    </xsl:template>
    

    

</xsl:stylesheet>

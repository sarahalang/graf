<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Project: GAMS Projekttemplate - GRaF
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
    Modified for GRaF by: Sarah Lang, 2020
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/" exclude-result-prefixes="#all">

    <xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>

    <!-- TODO static -->
    <xsl:include href="graf-static.xsl"/>

    <xsl:template name="content">

        <xsl:choose>
            <xsl:when test="not($mode)">
                <xsl:call-template name="contexts"/>
            </xsl:when>
            <xsl:otherwise>
                <section class="row ">
                    <article class="col-md-12 ">
                        <div class="panel">
                            <xsl:call-template name="contexts"/>
                        </div>
                    </article>

                </section>
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>

    <xsl:template name="contexts">
        <xsl:choose>
            <xsl:when test="not($mode)">


                <div class="container">

                    <div class="panel" id="texte">
                        <div class="jumbotron" style="background-color:#f9f4ea; margin-top:10px; align-items: center;">

                            <h1 style="padding-bottom:1em; text-align:center;">Willkommen
                                <!--  beim Grazer Repositorium antiker Fabeln -->
                            </h1>
                            <!--
                            <p>
                                Hinweis: Bei der vorliegenden Version des Webportals handelt es sich um eine unvollständige Test-Version, die noch im Aufbau befindlich ist. 
                                Aufgrund der aktuellen Lage des Home-Office stellen wir Sie Ihnen trotzdem gern bereits zur Verfügung.
                            </p> -->
                        </div>

                        <div class="container">
                            <xsl:variable name="theTime" select="format-time(current-time(),'[m01]')"/>
                            <xsl:variable name="pseudoRandom" select="substring($theTime,2,2)"/>
                            <div class="col-md-3 grid-image-block">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:text>/</xsl:text>
                                        <xsl:value-of select="//s:results/s:result[number($pseudoRandom) + 1]/s:identifier"/>
                                        <!-- plus 1 ist wichtig, weil XSLT ja keinen Null-Index kennt, sonst ist immer zu den vollen 10min ein Fehler! -->
                                    </xsl:attribute>
                                    <div class="grid-image"
                                        style="background:  url({$gamsdev}/graf/img/glt2/phaedr1.jpg) no-repeat center top;background-size:cover;">
                                        <p> </p>
                                    </div>
                                    <div class="grid-info">
                                        <span>Zufallsfabel <!-- <xsl:value-of select="$pseudoRandom"/> --></span>
                                    </div>
                                </a>
                            </div>

                            <div style="padding-top:20px; font-size: 21px;" class="col-md-7"> <!-- jumbotron hat 21px font-size oder larger? -->
                                <ul><li>Möchten Sie einführende Texte lesen oder einen Überblick über das
                                    Portal gewinnen? Konsultieren Sie die <a
                                        href="/context:graf?mode=inhaltsuebersicht"
                                        >Inhaltsübersicht</a>.</li>
                                <li>Möchten Sie lateinische oder griechische Fabeln lesen? Weiter zu
                                    den <a href="/context:graf?mode=overview">Fabel-Texten</a>.</li>
                                <li>Brauchen Sie <a href="/context:graf?mode=benutzungsanleitung"
                                        >Hilfe</a>? Weiter zur <a
                                        href="/context:graf?mode=benutzungsanleitung"
                                        >Benutzungsanleitung</a>.</li></ul>  
                            </div>
                        </div>
                        

                        <section class="row">
                            <hr/>
                            <article class="col-md-12">

                                <div class="static">

                                    <div class="static-wrapper-no-bottom">


                                        <div class="row">
                                            <div class="col-md-3 grid-image-round">
                                                <a href="/context:graf?mode=overview">
                                                  <div class="grid-image"
                                                  style="background: url({$gamsdev}/graf/img/glt2/phaedr4.jpg) no-repeat center top;background-size:cover;border-radius: 50%;">
                                                  <p><xsl:text> </xsl:text></p>
                                                  </div>
                                                  <div class="grid-info">
                                                  <span>Fabel-Texte</span>
                                                  </div>
                                                </a>
                                            </div>
                                            <div class="grid-image-round col-md-3">
                                                <a href="/context:graf?mode=inhaltsuebersicht">
                                                  <div class="grid-image"
                                                  style="background: url({$gamsdev}/graf/img/glt2/phaedr2.jpg) no-repeat center top;background-size:cover;border-radius: 50%;">
                                                      <p> <xsl:text> </xsl:text></p>
                                                  </div>
                                                  <div class="grid-info">
                                                  <span>Inhaltsübersicht</span>
                                                  </div>
                                                </a>
                                            </div>
                                            <div class="grid-image-round col-md-3">
                                                <a href="/context:graf?mode=benutzungsanleitung">
                                                  <div class="grid-image"
                                                  style="background: url({$gamsdev}/graf/img/glt2/phaedr3.jpg) no-repeat center top;background-size:cover;border-radius: 50%;">
                                                      <p> <xsl:text> </xsl:text></p>
                                                  </div>
                                                  <div class="grid-info">
                                                  <span>Benutzungsanleitung</span>
                                                  </div>
                                                </a>
                                            </div>

                                        </div>
                                    <hr/>
                                    </div>
                                </div>
                            </article>
                        </section>

                    </div>
                </div>


            </xsl:when>
            
            <xsl:when test="$mode = 'infomaterial'">
                <section class="row equalheight">
                    
                    <article class="col-md-12">
                        <div class="static-wrapper-no-bottom" style="background-color:#ffffff;">
                            <h2> Informaterialien <span style="float:right;"> [<a
                                href="/context:graf">Zurück zur Homepage.</a>] </span>
                            </h2>
                            
                            <hr/>
                            
                            <p>
                                <b>Zitiervorschlag: </b>
                                <xsl:text>Infomaterialien, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020.</xsl:text>
                                <br/>
                                <xsl:text>Permalink: </xsl:text>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:text>http:</xsl:text>
                                        <xsl:value-of select="$server"/>
                                        <xsl:text>/context:graf?mode=</xsl:text>
                                        <xsl:value-of select="$mode"/>
                                    </xsl:attribute>
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select="$server"/>
                                    <xsl:text>/context:graf?mode=</xsl:text>
                                    <xsl:value-of select="$mode"/>
                                </a>
                                <xsl:text>.</xsl:text>
                            </p>
                        </div>
                    </article>
                    
                </section>

                
                <div>
                    <h1 style="padding-bottom:0.5em;">Poster</h1>
                    
                    <div class="static-wrapper lightgrey-box"
                        >
                        <h2 class="spaced-head">
                            <a target="blank">
                                <xsl:attribute name="href">
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select="$server"/>
                                    <xsl:text>/archive/objects/context:graf/datastreams/POSTERDT/content</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Poster (dt.)</xsl:text>
                            </a>
                        </h2>
                    </div>
                    
                    <div class="static-wrapper lightgrey-box"
                        >
                        <h2 class="spaced-head ">
                            <a target="blank">
                                <xsl:attribute name="href">
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select="$server"/>
                                    <xsl:text>/archive/objects/context:graf/datastreams/POSTEREN/content</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Tagungsposter (en.)</xsl:text>
                            </a>
                        </h2>
                    </div>
                    
                    <h1 style="padding-bottom:0.5em;">Folder</h1>
                    <div class="static-wrapper lightgrey-box"
                        >
                        <h2 class="spaced-head ">
                            <a target="blank">
                                <xsl:attribute name="href">
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select="$server"/>
                                    <xsl:text>/archive/objects/context:graf/datastreams/FLYERJAHR1/content</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Informationsfolder 2017/18</xsl:text>
                            </a>
                        </h2>
                    </div>
                    <div class="static-wrapper lightgrey-box"
                        >
                        <h2 class="spaced-head ">
                            <a target="blank">
                                <xsl:attribute name="href">
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select="$server"/>
                                    <xsl:text>/archive/objects/context:graf/datastreams/FLYERJAHR2/content</xsl:text>
                                </xsl:attribute>
                                <xsl:text>Informationsfolder 2018/19</xsl:text>
                            </a>
                        </h2>
                    </div>
                    <hr/>
                </div>
            </xsl:when>


            <xsl:when test="$mode = 'inhaltsuebersicht'">
                <section class="row equalheight">

                    <article class="col-md-12">
                        <div class="static-wrapper-no-bottom" style="background-color:#ffffff;">
                            <h2> Inhaltsübersicht <span style="float:right;"> [<a
                                        href="/context:graf">Zurück zur Homepage.</a>] </span>
                            </h2>

                            <hr/>

                            <p>
                                <b>Zitiervorschlag: </b>
                                <xsl:text>Inhaltsübersicht, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020.</xsl:text>
                                <br/>
                                <xsl:text>Permalink: </xsl:text>
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:text>http:</xsl:text>
                                        <xsl:value-of select="$server"/>
                                        <xsl:text>/context:graf?mode=</xsl:text>
                                        <xsl:value-of select="$mode"/>
                                    </xsl:attribute>
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select="$server"/>
                                    <xsl:text>/context:graf?mode=</xsl:text>
                                    <xsl:value-of select="$mode"/>
                                </a>
                                <xsl:text>.</xsl:text>
                            </p>
                        </div>
                    </article>

                </section>

<div>
                <h1 style="padding-bottom:0.5em;">Über das Portal</h1>

                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head">
                            <a 
                                href="/context:graf?mode=project">Projektbeschreibung</a>
                        </h2>
                </div>
    
    
    <div class="static-wrapper lightgrey-box"
        >
        <h2 class="spaced-head">
            <a 
                href="/context:graf?mode=ressourcen">Liste online verfügbarer Ressourcen für den altsprachlichen Unterricht</a>
        </h2>
    </div>
    <div class="static-wrapper lightgrey-box"
        >
        <h2 class="spaced-head">
            <a 
                href="/context:graf?mode=literatur">Publikationen zu GRaF</a>
        </h2>
    </div>
    
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=doku">Dokumentation</a>
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a 
                                href="/context:graf?mode=benutzungsanleitung">Zur Benutzung des
                                Portals</a>
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=team">Team</a>
                    </h2>
                </div>
    <div class="static-wrapper lightgrey-box"
        >
        <h2 class="spaced-head ">
            <a
                href="/context:graf?mode=infomaterial">Infomaterialien</a>
        </h2>
    </div>
    


                <hr/>
                <h1 style="padding-bottom:0.5em;">Zu den Fabeln</h1>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=overview">Übersicht</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a 
                                href="/context:graf?mode=vglstellen">Vergleichsstellen</a>
                        
                    </h2>
                </div>


                <hr/>
                <h1 style="padding-bottom:0.5em;">Bibliographie</h1>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=bibliographie">Bibliographie zur antiken
                                Fabel</a>
                        
                    </h2>
                </div>
    <hr/>
    
    <h1 style="padding-bottom:0.5em;">Einleitungstexte</h1>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=fableintro">Einführung zur antiken
                                Fabel</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=textkritik">Textkritik</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=metrik">Metrik</a>
                        
                    </h2>
                </div>

                <hr/>
                <h1 style="padding-bottom:0.5em;">Einleitungstexte zu Autoren</h1>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=aesop">Aesop</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=avian">Avian</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=babrios">Babrios</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=phaedrus">Phaedrus</a>
                        
                    </h2>
                </div>


                <hr/>
                <h1 style="padding-bottom:0.5em;">Events</h1>


                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=glt1">1. Grazer Latein-Tag 2016</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=glt2">2. Grazer Latein-Tag 2017</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=glt3">3. Grazer Latein-Tag 2018</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=kongressachtzehn">SchülerInnenkongress Mai
                                2018</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                            <a
                                href="/context:graf?mode=kongressneunzehn">SchülerInnenkongress Mai
                                2019</a>
                        
                    </h2>
                </div>
                <div class="static-wrapper lightgrey-box"
                    >
                    <h2 class="spaced-head ">
                        
                            <a
                                href="/context:graf?mode=fabelworkshop">Fabelworkshop 2018</a>
                        
                    </h2>
                </div>

                <hr/>
    
</div>

            </xsl:when>
        </xsl:choose>
        
        

    </xsl:template>




    <xsl:template match="t:TEI" mode="context">

        <!-- Farbe für Team und Imprint -->
        <xsl:variable name="this-color">
            <xsl:choose>
                <xsl:when test="$mode = 'team' or 'event'">
                    <xsl:text>rgba(231, 156, 0, 0.15)</xsl:text>
                </xsl:when>
                <xsl:when test="$mode = 'project' or $mode = 'benutzungsanleitung' or $mode='doku' or $mode='literatur' or $mode='ressourcen'">
                    <xsl:text>rgba(240,223,219, 0.8)</xsl:text>
                    <!-- #c8a3fb #fdf2e9-->
                </xsl:when>
                <xsl:when test="$mode = 'imprint'">
                    <xsl:text>rgba(232,225,237, 0.8)</xsl:text>
                </xsl:when>
                <xsl:when test="$mode = 'research'">
                    <xsl:text>rgba(39, 98, 53, 0.15)</xsl:text>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>



        <div>
            <div class="static">
                <xsl:choose>

                    <!-- Projektbeschreibung -->
                    <xsl:when
                        test="$mode = 'project' or $mode = 'glt1' or $mode = 'glt2' or $mode = 'glt3' or 
                        $mode = 'kongressachtzehn' or $mode = 'doku' or $mode = 'team' or $mode = 'kongressneunzehn' or 
                        $mode = 'benutzungsanleitung' or $mode = 'fabelworkshop' or $mode='ressourcen' or $mode='literatur'">
                        <section class="row equalheight">

                            <article class="col-md-12">
                                <div class="static-wrapper-no-bottom"
                                    style="background-color:#ffffff;">
                                    <h2>
                                        <xsl:value-of select="//t:TEI//t:body/t:div/t:head"/>
                                        <span style="float:right;">
                                            <xsl:if test="$mode = 'doku' or $mode = 'benutzungsanleitung' or $mode='ressourcen'">
                                                <!-- hier PDF hinzufuegen  -->
                                                <a target="blank" style="padding-right:20px; text-decoration:none;border-bottom:none;">
                                                    <xsl:attribute name="href">
                                                        <xsl:text>http:</xsl:text>
                                                        <xsl:value-of select="$server"/>
                                                        <xsl:text>/archive/objects/context:graf/datastreams/</xsl:text>
                                                        <xsl:choose>
                                                            <xsl:when test="$mode = 'doku'"
                                                                >DOKUPDF</xsl:when>
                                                            <xsl:when test="$mode = 'benutzungsanleitung'"
                                                                >HILFEPDF</xsl:when>
                                                            <xsl:when test="$mode = 'ressourcen'"
                                                                >RESSOURCENPDF</xsl:when>
                                                        </xsl:choose>
                                                        <xsl:text>/content</xsl:text>
                                                    </xsl:attribute>
                                                    <img src="/templates/img/pdf_icon.png"
                                                        width="30" height="30" alt="Druckversion"/>
                                                </a> 
                                            </xsl:if>
                                            [<a href="/context:graf">Zurück
                                                zur Homepage.</a>] </span>
                                    </h2>

                                    <hr/>

                                    <p>
                                        <b>Zitiervorschlag: </b>
                                        <xsl:if test="$mode = 'doku' or $mode = 'benutzungsanleitung' or $mode = 'ressourcen'">
                                            <xsl:text>Lang, S.: </xsl:text>
                                        </xsl:if>
                                        <xsl:value-of select="//t:TEI//t:body/t:div/t:head"/>

                                        <xsl:text>, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020.</xsl:text>
                                        <br/>
                                        <xsl:text>Permalink: </xsl:text>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text>http:</xsl:text>
                                                <xsl:value-of select="$server"/>
                                                <xsl:text>/context:graf?mode=</xsl:text>
                                                <xsl:value-of select="$mode"/>
                                            </xsl:attribute>
                                            <xsl:text>http:</xsl:text>
                                            <xsl:value-of select="$server"/>
                                            <xsl:text>/context:graf?mode=</xsl:text>
                                            <xsl:value-of select="$mode"/>
                                        </a>
                                        <xsl:text>.</xsl:text>
                                    </p>
                                </div>
                            </article>

                        </section>



                        <xsl:for-each select="t:text/t:body//t:div[child::t:p]">
                            <div class="static-wrapper"
                                style="background-color: #f7edeb; margin-bottom:10px !important;">
                                <article>
                                    <div class="static-content row">


                                        <div class="col-sm-9 float">
                                            <xsl:if test="t:head">
                                                <h4>
                                                  <xsl:text>   </xsl:text>
                                                  <xsl:value-of select="t:head"/>
                                                </h4>
                                            </xsl:if>

                                            <xsl:for-each select="t:p">
                                                <p>
                                                    <xsl:apply-templates/><xsl:text> </xsl:text>
                                                </p>
                                            </xsl:for-each>
                                        </div>
                                        <xsl:if test="//t:graphic">
                                            <xsl:for-each select="t:p/t:graphic">
                                                <div class="col-sm-3">
                                                  <img class="img-fluid img-responsive" alt="Photo from the GRaF project">
                                                  <xsl:attribute name="src">
                                                  <xsl:value-of select="concat($gamsdev, @url)"/>
                                                  </xsl:attribute>
                                                  </img>
                                                </div>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </div>
                                </article>
                            </div>
                        </xsl:for-each>
                        
                        <xsl:if test="$mode = 'ressourcen'">
                            <div class="static-wrapper"
                                style="background-color: #f7edeb; margin-bottom:10px !important;">
                                <article>
                                    <div class="static-content row">
                                        <div class="col-sm-9 float">
                                            <h4>Fußnoten</h4>
                                            
                                            <xsl:for-each select="t:text/t:body//t:note">
                                                <p id="{@xml:id}" style="font-size:smaller;">
                                                    <sup><xsl:value-of select="@n"/><xsl:text>. </xsl:text></sup>
                                                        <xsl:apply-templates/><xsl:text> </xsl:text>
                                                </p>
                                            </xsl:for-each>
                                        </div>

                                    </div>
                                </article>
                                <article>
                                    <div class="static-content row">
                                        
                                        <div class="col-sm-9 float">
                                            <h4>Literaturangaben</h4>
                                            
                                            <xsl:for-each select="t:text/t:body//t:item">
                                                <p>
                                                    <xsl:apply-templates/><xsl:text> </xsl:text>
                                                </p>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </xsl:if>
                    </xsl:when>

                    <xsl:when test="$mode = 'overview'">
                        <xsl:apply-templates mode="overview"/>
                    </xsl:when>
                    

                    <xsl:when test="$mode = 'imprint'">
                        <section class="row equalheight">
                            <article class="col-md-12">
                                <div class="static-wrapper-no-bottom"
                                    style="background-color:#ffffff;">
                                    <h2>
                                       Impressum
                                        <span style="float:right;"> 
                                            <a target="blank" style="padding-right:20px; text-decoration:none;border-bottom:none;">
                                                <xsl:attribute name="href">
                                                    <xsl:text>http:</xsl:text>
                                                    <xsl:value-of select="$server"/>
                                                    <xsl:text>/mode=imprint</xsl:text>
                                                </xsl:attribute>
                                                <img src="/templates/img/tei_icon.jpg" width="30" height="30"
                                                    alt="XML (TEI P5) Download"
                                                />
                                            </a> [<a href="/context:graf">Zurück
                                                zur Homepage.</a>] </span><br/>
                                        
                                    </h2>
                                    
                                    <hr/>
                                    <p>
                                        <b>Zitiervorschlag: </b>
                                        
                                        <xsl:text>Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020.</xsl:text>
                                        <br/>
                                        <xsl:text>Permalink: </xsl:text>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text>http:</xsl:text>
                                                <xsl:value-of select="$server"/>
                                                <xsl:text>/graf</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>http:</xsl:text>
                                            <xsl:value-of select="$server"/>
                                            <xsl:text>/graf</xsl:text>ŝ
                                        </a>
                                        <xsl:text>.</xsl:text>
                                    </p>
                                </div>
                            </article>
                            
                        </section>
                        
                        <div class="static-wrapper-no-bottom">
                                

                        <xsl:for-each select="t:text/t:body//t:div[child::t:p]">
                            <div class="imprint-wrapper">
                                <article>
                                    <div class="static-content row">
                                        <xsl:if test="t:head">
                                            <h4>
                                                <xsl:text>   </xsl:text>
                                                <xsl:value-of select="t:head"/>
                                            </h4>
                                        </xsl:if>

                                        <div class="col-sm-9 float">
                                            <xsl:for-each select="t:p">
                                                <p>
                                                    <xsl:apply-templates/><xsl:text> </xsl:text>
                                                </p>
                                            </xsl:for-each>
                                        </div>
                                        <xsl:if test="//t:graphic">
                                            <xsl:for-each select="t:p/t:graphic">
                                                <div class="col-sm-3">
                                                  <img class="img-fluid img-responsive" alt="GRaF project image">
                                                  <xsl:attribute name="src">
                                                  <xsl:value-of select="concat($gamsdev, @url)"/>
                                                  </xsl:attribute>
                                                  </img>
                                                </div>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </div>
                                </article>
                            </div>
                        </xsl:for-each>
                                </div>
                    </xsl:when>


                   

                    <xsl:when test="$mode = 'bibliographie'">
                        <section class="row equalheight">
                        <article class="col-md-12">
                            <div class="static-wrapper-no-bottom"
                                style="background-color:#ffffff;">
                                
                                <h2>
                                    Bibliographie zur antiken Fabel
                                    
                                    <span style="float:right;"> 
                                        <a target="blank" style="padding-right:20px; text-decoration:none;border-bottom:none;">
                                            <xsl:attribute name="href">
                                                <xsl:text>http:</xsl:text>
                                                <xsl:value-of select="$server"/>
                                                <xsl:text>/archive/objects/context:graf/datastreams/BIBLIOGRAPHIE/content</xsl:text>
                                            </xsl:attribute>
                                            <img src="/templates/img/tei_icon.jpg" width="30" height="30"
                                               alt="XML (TEI P5) Download"
                                            />
                                        </a> [<a href="/context:graf">Zurück
                                            zur Homepage.</a>] </span><br/>
                                    
                                </h2>

                                <hr/>
                                <p>
                                    <b>Zitiervorschlag: </b>
                                   
                                    <xsl:text>Bibliographie zur antiken Fabel, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020.</xsl:text>
                                    <br/>
                                    <xsl:text>Permalink: </xsl:text>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>http:</xsl:text>
                                            <xsl:value-of select="$server"/>
                                            <xsl:text>/context:graf?mode=</xsl:text>
                                            <xsl:value-of select="$mode"/>
                                        </xsl:attribute>
                                        <xsl:text>http:</xsl:text>
                                        <xsl:value-of select="$server"/>
                                        <xsl:text>/context:graf?mode=</xsl:text>
                                        <xsl:value-of select="$mode"/>
                                    </a>
                                    <xsl:text>.</xsl:text>
                                </p>
                            </div>
                        </article>
                        
                        </section>

                        <div class="static-wrapper">
                            <article style="background-color: #f9f4ea;padding:1em;">

                                <div class="static-content row">

                                    <div class="table-responsive" style="padding:1em;">
                                        <!--<h3>Bibliographie Aesop (Testversion)</h3>-->

                                        <table class="table table-striped display" id="theBiblioTable">
                                            <thead>
                                                <tr>
                                                  <th>Name</th>
                                                  <th>Jahr</th>
                                                  <th>Titel</th>
                                                  <th>Sprache</th>
                                                  <th>Vollzitat</th>
                                                  <th>Rez.</th>
                                                  <th>Kategorie</th>
                                                  <th>Fabelautor</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                  <td>Name</td>
                                                  <td>Jahr</td>
                                                  <td>Titel</td>
                                                  <td>Sprache</td>
                                                  <td>Vollzitat</td>
                                                  <td>Rez.</td>
                                                  <td>Kategorie</td>
                                                    <td>Fabelautor</td>
                                                </tr>
                                            </tfoot>
                                            <tbody>

                                                <xsl:for-each select="//t:div[position() > 1][t:biblStruct/t:analytic/t:title != '']">
                                                  <tr style="font-size:small;">
                                                  <td class="col-md-1">
                                                  <xsl:value-of
                                                  select="t:biblStruct/t:analytic/t:author"/>
                                                  </td>
                                                  <td class="col-md-1">
                                                      <code class="bg-greybox-blackfont">
                                                  <xsl:value-of select="t:biblStruct//t:date"/>
                                                          <xsl:text> </xsl:text>
                                                  </code>
                                                  </td>
                                                  <td class="col-md-2">
                                                  <xsl:value-of
                                                  select="t:biblStruct/t:analytic/t:title"/>
                                                  </td>
                                                  <td class="col-md-1">
                                                  <code>
                                                  <xsl:value-of
                                                  select="t:biblStruct/t:monogr/@xml:lang"/>
                                                      <xsl:text> </xsl:text>
                                                  </code>
                                                  </td>
                                                  <td class="col-md-4">
                                                  <span style="font-size: smaller;">
                                                  <xsl:value-of
                                                  select="t:biblStruct//t:bibl[@type='Vollzitat']"/>
                                                  </span>
                                                  </td>
                                                  <td style="font-size:smaller;" class="col-md-1">
                                                      
                                                      <!-- Rezensionen-Button -->

                                                  <xsl:choose>
                                                      <xsl:when test="t:biblStruct//t:ref/t:bibl[@type='Rezension']">
                                                  <xsl:for-each select="t:biblStruct//t:ref">
                                                  <a class="btn btn-primary" data-toggle="collapse"
                                                  role="button" aria-expanded="false">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>#rezension-</xsl:text>
                                                  <xsl:value-of
                                                  select="count(ancestor::t:div[t:biblStruct]/preceding-sibling::t:div)"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="position()"/>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="aria-controls">
                                                  <xsl:text>rezension-</xsl:text>
                                                  <xsl:value-of
                                                  select="count(ancestor::t:div[t:biblStruct]/preceding-sibling::t:div)"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="position()"/>
                                                  </xsl:attribute> Rez.</a>
                                                  <div class="row">
                                                  <div class="col-md-12">
                                                  <div class="collapse multi-collapse">
                                                  <xsl:attribute name="id">
                                                  <xsl:text>rezension-</xsl:text>
                                                  <xsl:value-of
                                                  select="count(ancestor::t:div[t:biblStruct]/preceding-sibling::t:div)"/>
                                                  <xsl:text>-</xsl:text>
                                                  <xsl:value-of select="position()"/>
                                                  </xsl:attribute>
                                                  <div class="card card-body"
                                                  style="margin-bottom: 8pt;">
                                                  <xsl:for-each select="t:bibl">
                                                      <p style="font-size:smaller;"><xsl:value-of select="."/></p>
                                                  </xsl:for-each>
                                                  </div>
                                                  </div>
                                                  </div>
                                                  </div>
                                                  </xsl:for-each>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <code
                                                  class="bg-greybox">
                                                  - </code>
                                                  <!-- Zeichen für "keine" -->
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </td>
                                                  <td class="col-md-1">

                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="string-length(t:biblStruct//t:term[not(@type='Fabelautor')]) > 3">
                                                  <span style="font-size: smaller;">
                                                      <xsl:value-of select="t:biblStruct//t:term[not(@type='Fabelautor')]"/>
                                                  </span>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:text>-</xsl:text>
                                                  </xsl:otherwise>
                                                  </xsl:choose>

                                                  </td>
                                                      <td class="col-md-1">
                                                          <xsl:choose>
                                                              <xsl:when test="t:biblStruct//t:term[@type='Fabelautor']">
                                                                  <span style="font-size: smaller;">
                                                                      <xsl:variable name="fabelautor" select="t:biblStruct//t:term[@type='Fabelautor']"/>
                                                                      
                                                                      <xsl:for-each select="t:biblStruct//t:term[@type='Fabelautor']">
                                                                          
                                                                          <xsl:value-of select="."/> <xsl:text> </xsl:text> 
                                                                      </xsl:for-each>
                                                                  </span>
                                                          </xsl:when>
                                                              <xsl:otherwise>-</xsl:otherwise>
                                                          </xsl:choose>
                                                      </td>
                                                  </tr>
                                                </xsl:for-each>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </article>
                        </div>

                    </xsl:when>



                    <!-- Einfuehrungen / Artikel -->
                    <xsl:when
                        test="$mode = 'aesop' or $mode = 'phaedrus' or $mode = 'babrios' or $mode = 'textkritik' or $mode = 'fableintro' or $mode = 'avian' or $mode = 'metrik'">

                        <section class="row equalheight">

                            <article class="col-md-12">
                                <div class="static-wrapper-no-bottom"
                                    style="background-color:#ffffff;">
                                    <h2>
                                        <xsl:value-of select="//t:titleStmt/t:title"/>
                                        <span style="float:right;">
                                            <!-- TEI (P5) -->
                                            <a target="blank" style="padding-right:20px; text-decoration:none;border-bottom:none;">
                                                <xsl:attribute name="href">
                                                  <xsl:text>http:</xsl:text>
                                                  <xsl:value-of select="$server"/>
                                                  <xsl:text>/archive/objects/context:graf/datastreams/</xsl:text>
                                                  <xsl:choose>
                                                  <xsl:when test="$mode = 'aesop'">AESOP</xsl:when>
                                                  <xsl:when test="$mode = 'phaedrus'"
                                                  >PHAEDRUS</xsl:when>
                                                  <xsl:when test="$mode = 'metrik'"
                                                  >METRIK</xsl:when>
                                                  <xsl:when test="$mode = 'babrios'"
                                                  >BABRIOS</xsl:when>
                                                  <xsl:when test="$mode = 'avian'">AVIAN</xsl:when>
                                                  <xsl:when test="$mode = 'textkritik'"
                                                  >TEXTKRITIK</xsl:when>
                                                  <xsl:when test="$mode = 'fableintro'"
                                                  >FABLEINTRO</xsl:when>
                                                  </xsl:choose>
                                                  <xsl:text>/content</xsl:text>
                                                </xsl:attribute>
                                                <img src="/templates/img/tei_icon.jpg" width="30"
                                                  height="30" alt="XML (TEI P5) Download"/>
                                            </a>
                                            <!-- hier PDF hinzufuegen  -->
                                            <a target="blank" style="padding-right:20px; text-decoration:none;border-bottom:none;">
                                                <xsl:attribute name="href">
                                                  <xsl:text>http:</xsl:text>
                                                  <xsl:value-of select="$server"/>
                                                  <xsl:text>/archive/objects/context:graf/datastreams/</xsl:text>
                                                  <xsl:choose>
                                                  <xsl:when test="$mode = 'aesop'"
                                                  >AESOPPDF</xsl:when>
                                                  <xsl:when test="$mode = 'babrios'"
                                                  >BABRIOSPDF</xsl:when>
                                                  <xsl:when test="$mode = 'avian'"
                                                  >AVIANPDF</xsl:when>
                                                  <xsl:when test="$mode = 'textkritik'"
                                                  >TEXTKRITIKPDF</xsl:when>
                                                  <xsl:when test="$mode = 'phaedrus'"
                                                  >PHAEDRUSPDF</xsl:when>
                                                  <xsl:when test="$mode = 'metrik'"
                                                  >METRIKPDF</xsl:when>
                                                  <xsl:when test="$mode = 'fableintro'"
                                                  >FABELPDF</xsl:when>
                                                  </xsl:choose>
                                                  <xsl:text>/content</xsl:text>
                                                </xsl:attribute>
                                                <img src="/templates/img/pdf_icon.png"
                                                  width="30" height="30" alt="Druckversion"/>
                                            </a> [<a href="/context:graf">Zurück zur Homepage.</a>]
                                        </span>
                                    </h2>

                                    <hr/>

                                    <p>
                                        <b>Zitiervorschlag: </b>
                                        <xsl:value-of
                                            select="substring-after(normalize-space(//t:teiHeader//t:author), ' ')"/>
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of
                                            select="substring(substring-before(normalize-space(//t:teiHeader//t:author), ' '), 1, 1)"/>
                                        <xsl:text>.: </xsl:text>

                                        <xsl:value-of select="//t:teiHeader//t:titleStmt/t:title"/>

                                        <xsl:text>, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020. Permalink: </xsl:text>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text>http:</xsl:text>
                                                <xsl:value-of select="$server"/>
                                                <xsl:text>/context:graf?mode=</xsl:text>
                                                <xsl:value-of select="$mode"/>
                                            </xsl:attribute>
                                            <xsl:text>http:</xsl:text>
                                            <xsl:value-of select="$server"/>
                                            <xsl:text>/context:graf?mode=</xsl:text>
                                            <xsl:value-of select="$mode"/>
                                        </a>
                                        <xsl:text>.</xsl:text>
                                    </p>
                                </div>
                            </article>

                        </section>

                        <div class="static-wrapper"
                            style="background-color:#f9f4ea;margin-bottom:15px !important;">

                            <article>
                                <xsl:attribute name="id">
                                    <xsl:value-of select="$mode"/>
                                </xsl:attribute>
                                <div class="static-content">
                                   


                                    <div class="static-wrapper">
                                        <h3>
                                            <xsl:value-of select="//t:titleStmt/t:title"/>
                                        </h3>
                                        <p>
                                            <em>
                                                <xsl:value-of select="//t:titleStmt/t:author"/>
                                            </em>
                                        </p>
                                        <br/>

                                        <div>
                                            <xsl:apply-templates mode="artikel"
                                                select="//t:body/t:div"/>
                                        </div>
                                    </div>

                                    <xsl:if test="//t:div[t:bibl]">
                                        <div class="static-wrapper">
                                            <h4>Literatur</h4>
                                            <xsl:for-each
                                                select="//t:div[contains(t:head, 'Literatur')]//t:head[@rend = 'sub']">
                                                <h5>
                                                    <xsl:value-of select="."/>
                                                </h5>
                                                <table style="width:80%">
                                                    <xsl:for-each select="following-sibling::t:bibl">
                                                        <tr>
                                                            <xsl:if test="@xml:id">
                                                                <xsl:attribute name="id">
                                                                    <xsl:value-of select="@xml:id"/>
                                                                </xsl:attribute>
                                                            </xsl:if>
                                                            <td>
                                                                <b>
                                                                    <xsl:value-of select="@n"/><xsl:text> </xsl:text>
                                                                </b>
                                                            </td>
                                                            <td style="font-size:smaller;">
                                                                <xsl:value-of select="."/><xsl:text> </xsl:text>
                                                            </td>
                                                        </tr>
                                                    </xsl:for-each>
                                                </table>
                                            </xsl:for-each>
                                            
                                            <!-- ausgleichen, dass in den Daten nicht die Konventionen befolgt wurden... -->
                                            <xsl:if
                                                test="not(//t:div[contains(t:head, 'Literatur')]//t:head[@rend = 'sub'])">
                                                <xsl:for-each select="//t:div[t:bibl]">
                                                    <table style="width:80%">
                                                        <xsl:for-each select="t:bibl">
                                                            <tr>
                                                                <xsl:attribute name="id">
                                                                    <xsl:value-of select="@xml:id"/>
                                                                </xsl:attribute>
                                                                <td>
                                                                    <b>
                                                                        <xsl:value-of select="@n"/>
                                                                    </b>
                                                                </td>
                                                                <td style="font-size:smaller;">
                                                                    <xsl:value-of select="."/>
                                                                </td>
                                                            </tr>
                                                        </xsl:for-each>
                                                    </table>
                                                </xsl:for-each>
                                            </xsl:if>
                                            
                                        </div>
                                    </xsl:if>

                                    <xsl:if test="//t:note">
                                        <div class="static-wrapper">
                                            <h4>Fußnoten</h4>
                                            <xsl:for-each select="//t:note">
                                                <p class="article-note">
                                                    <xsl:attribute name="id">
                                                        <xsl:text>ftn-</xsl:text>
                                                        <xsl:value-of select="@n"/>
                                                    </xsl:attribute>
                                                    <b>
                                                        <xsl:value-of select="@n"/>
                                                        <xsl:text>. </xsl:text>
                                                    </b>
                                                    <xsl:apply-templates mode="artikel"/>
                                                    <xsl:text> [</xsl:text>
                                                    <a title="jump back">
                                                        <xsl:attribute name="href">
                                                            <xsl:text>#ftn-</xsl:text>
                                                            <xsl:value-of select="@n"/>
                                                            <xsl:text>-intext</xsl:text>
                                                        </xsl:attribute>
                                                        <xsl:text>zurück</xsl:text>
                                                    </a>
                                                    <xsl:text>]</xsl:text>
                                                </p>
                                            </xsl:for-each>
                                        </div>
                                    </xsl:if>
                                </div>
                            </article>
                        </div>
                    </xsl:when>

                    <!-- Vglstellen -->
                    <xsl:when test="$mode = 'vglstellen'">
                        <section class="row equalheight">

                            <article class="col-md-12">
                                <div class="static-wrapper" style="background-color:#ffffff;">
                                    <h2>
                                        <xsl:value-of select="//t:teiHeader//t:titleStmt/t:title"/>
                                        <span style="float:right;">
                                            <!-- TEI (P5) -->
                                            <a target="blank" style="padding-right:20px;text-decoration:none;border-bottom:none;">
                                                <xsl:attribute name="href">
                                                  <xsl:text>http:</xsl:text>
                                                  <xsl:value-of select="$server"/>
                                                  <xsl:text>/archive/objects/context:graf/datastreams/VGLSTELLEN</xsl:text>
                                                  <xsl:text>/content</xsl:text>
                                                </xsl:attribute>
                                                <img src="{$gamsdev}/graf/img/tei.jpg" width="30"
                                                  height="30" alt="XML (TEI P5) Download"/>
                                            </a> [<a href="/context:graf">Zurück zur Homepage.</a>]
                                        </span>
                                    </h2>

                                    <hr/>

                                    <p>
                                        <b>Zitiervorschlag: </b>
                                        <xsl:value-of select="//t:teiHeader//t:titleStmt/t:title"/>

                                        <xsl:text>, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020.</xsl:text>
                                        <br/>
                                        <xsl:text>Permalink: </xsl:text>
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:text>http:</xsl:text>
                                                <xsl:value-of select="$server"/>
                                                <xsl:text>/context:graf?mode=</xsl:text>
                                                <xsl:value-of select="$mode"/>
                                            </xsl:attribute>
                                            <xsl:text>http:</xsl:text>
                                            <xsl:value-of select="$server"/>
                                            <xsl:text>/context:graf?mode=</xsl:text>
                                            <xsl:value-of select="$mode"/>
                                        </a>
                                        <xsl:text>.</xsl:text>
                                    </p>
                                </div>
                            </article>

                        </section>
                        <div class="static-wrapper no-underline-links"
                            style="background-color: #f9f4ea; overflow: auto;margin-top: 15px !important;margin-bottom: 15px !important;">

                            <article class="col-md-9">
                                <div class="panel" style="overflow: hidden; padding-bottom: 5em">
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="$mode"/>
                                    </xsl:attribute>

                                    <div class="static-wrapper"
                                        style="padding-bottom:1em;border-bottom:0px dotted #596C75;">

                                        <xsl:for-each select="//t:div[@type = 'text']">
                                            <xsl:sort select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@n"/>
                                            <div class="static-wrapper"
                                                style="padding-bottom:1em;border-bottom:0px dotted #596C75;">
                                                <xsl:attribute name="id">
                                                  <xsl:value-of
                                                  select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@xml:id"
                                                  />
                                                </xsl:attribute>
                                                <h4>
                                                  <xsl:value-of
                                                  select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@n"
                                                  />
                                                </h4>
                                                <div class="static-wrapper col-md-10"
                                                    style="background-color: #ecece7;">
                                                  <xsl:apply-templates mode="vgl"/>
                                                </div>
                                                <xsl:text>  </xsl:text>
                                                <a class="autorenbutton" data-toggle="tooltip">
                                                  <xsl:attribute name="title">
                                                  <xsl:variable name="thisauthor"
                                                  select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@ana"/>
                                                  <xsl:for-each
                                                  select="//t:person[@xml:id = $thisauthor]/t:p">
                                                      <xsl:apply-templates/><xsl:text> </xsl:text>
                                                  </xsl:for-each>
                                                  </xsl:attribute>
                                                  <xsl:text>    </xsl:text>
                                                    <span class="glyphicon glyphicon-user">  <xsl:text> </xsl:text></span>
                                                  <xsl:value-of
                                                  select="t:span[@type = 'Vergleichstextidentitaet']/t:ref/@ana"
                                                  />
                                                </a>


                                            </div>
                                        </xsl:for-each>

                                    </div>

                                    <div class="static-wrapper">
                                        <h2>Verwendete Textausgaben</h2>
                                        <xsl:for-each select="//t:biblStruct">
                                            <p>
                                                <xsl:attribute name="id">
                                                  <xsl:value-of select="translate(@xml:id, '-', '')"
                                                  />
                                                </xsl:attribute>
                                                <b>
                                                  <xsl:text>[</xsl:text>
                                                  <xsl:value-of select="@xml:id"/>
                                                  <xsl:text>] </xsl:text>
                                                </b>
                                                <xsl:value-of select="t:monogr/t:editor/t:persName"/>
                                                <xsl:text> (Hg.): </xsl:text>
                                                <xsl:value-of select="t:monogr/t:title"/>
                                                <xsl:text>, </xsl:text>
                                                <xsl:value-of
                                                  select="t:monogr/t:imprint/t:pubPlace/t:placeName"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="t:monogr/t:imprint/t:date"/>
                                            </p>
                                        </xsl:for-each>
                                    </div>
                                </div>
                            </article>




                            <article class="col-md-3" style="background-color: #f9f4ea;">
                                <div style="overflow: hidden; padding-bottom: 5em">

                                    <div class="static-wrapper">
                                        <xsl:for-each select="//t:person">
                                            <div class="panel-group">
                                                <div class="panel panel-default">
                                                  <div class="panel-heading">
                                                  <h4 class="panel-title">
                                                  <a data-toggle="collapse">
                                                  <xsl:attribute name="href">
                                                  <xsl:text>#</xsl:text>
                                                  <xsl:value-of select="translate(@xml:id, '.', '')"
                                                  />
                                                  </xsl:attribute>
                                                      <xsl:attribute name="id">
                                                          <xsl:value-of select="concat('Glossar::',@xml:id)"
                                                          />
                                                      </xsl:attribute>
                                                  <xsl:value-of select="@n"/>
                                                  <xsl:text>  </xsl:text>
                                                  <small>
                                                  <span class="glyphicon glyphicon-menu-down"><xsl:text> </xsl:text></span>
                                                  </small>
                                                  </a>
                                                  </h4>
                                                  </div>
                                                  <div class="panel-collapse collapse">
                                                  <xsl:attribute name="id">
                                                  <xsl:value-of select="translate(@xml:id, '.', '')"
                                                  />
                                                  </xsl:attribute>
                                                  <div class="panel-body">
                                                  <xsl:value-of select="t:p"/> 
                                                      <xsl:text> </xsl:text>
                                                  </div>
                                                  </div>
                                                </div>
                                            </div>
                                        </xsl:for-each>

                                    </div>
                                </div>
                            </article>

                        </div>
                    </xsl:when>


                </xsl:choose>
            </div>
        </div>
    </xsl:template>




<!-- Achtung, es gibt verwirrenderweise noch Templates ohne Mode in graf-static! -->

    <xsl:template match="t:figure/t:graphic">
        <img class="img-fluid img-responsive" alt="GRaF project image">
            <xsl:attribute name="src">
                <xsl:value-of select="concat($gamsdev, @url)"/>
            </xsl:attribute>
        </img>
    </xsl:template>
    
    <xsl:template match="t:code">
        <code><xsl:apply-templates/><xsl:text> </xsl:text></code>
    </xsl:template>
    
    
    
    <xsl:template match="t:p[ancestor::t:note]">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="t:note[@n and @xml:id]">
        <a href="#{@xml:id}"><sup><xsl:value-of select="@n"/></sup></a>
    </xsl:template>
    
    <xsl:template match="t:ref[contains(@target, 'mailto')]">
        <a target="blank" href="{@target}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <xsl:template match="t:ref">
        <a>
            <xsl:if test="@target">
                <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@type">
                <xsl:if test="@type = 'external'">
                <xsl:attribute name="target">
                    <xsl:text>blank</xsl:text>
                </xsl:attribute>
                </xsl:if>
            </xsl:if>
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    
    <xsl:template match="t:hi">
        <xsl:choose>
            <xsl:when test="@rend">
                <xsl:choose>
                    <xsl:when test="@rend = 'italic'">
                        <em>
                            <xsl:apply-templates/>
                        </em>
                    </xsl:when>
                    <xsl:when test="@rend = 'bold'">
                        <b>
                            <xsl:apply-templates/>
                        </b>
                    </xsl:when>
                    <xsl:otherwise>
                        <em>
                            <xsl:apply-templates/>
                        </em>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <em>
                    <xsl:apply-templates/>
                </em>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>


    <!-- ..................................................... alles mode artikel .......................................................... -->

    <xsl:template match="t:div[contains(t:head, 'Literatur')]" mode="artikel">
        <!-- loeschen
        Achtung, was passiert wenn eine tatsaechliche Ueberschrift "Literatur" enthaelt?-->
    </xsl:template>

    <xsl:template match="t:div" mode="artikel">
        <xsl:apply-templates mode="artikel"/>
    </xsl:template>


    <xsl:template match="t:p[not(child::t:cit)]" mode="artikel">
        <p>
            <span style="background-color:#fff;padding:0.4em;">
                <xsl:value-of
                    select="count(preceding::t:p[ancestor::t:text and not(ancestor::t:note) and not(child::t:cit)]) + 1"
                />
            </span>
            <xsl:text> </xsl:text>


            <xsl:apply-templates mode="artikel"/>
        </p>
    </xsl:template>


    <!--  wurde entfernt, weil Fehler bei Babrios-Text ... könnte später Probleme machen, bis nichts merklich -->

    <!--     <xsl:template match="t:note/t:p" mode="artikel">
        <xsl:apply-templates mode="artikel"/>
    </xsl:template>
 -->
    
    <xsl:template match="t:ab" mode="artikel">
        <p>
            <xsl:apply-templates mode="artikel"/>
        </p>
    </xsl:template>

    <xsl:template match="t:cit" mode="artikel">
        <blockquote style="font-size:smaller;padding:20px;width:60%;">
            <xsl:apply-templates mode="artikel"/>
        </blockquote>
    </xsl:template>

    <xsl:template match="t:q" mode="artikel">
        <xsl:choose>
            <xsl:when test="@xml:lang = 'la'">
                <em>
                    <xsl:apply-templates mode="artikel"/>
                </em>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates mode="artikel"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="t:l" mode="artikel">
        <xsl:apply-templates mode="artikel"/>
        <br/>
    </xsl:template>

    <xsl:template match="t:list" mode="artikel">
        <ol style="list-style-type:none">
            <xsl:apply-templates mode="artikel"/>
        </ol>
    </xsl:template>

    <xsl:template match="t:item" mode="artikel">
        <li>
            <xsl:apply-templates mode="artikel"/>
        </li>
    </xsl:template>


    <xsl:template match="t:note" mode="artikel">
        <sup>
            <a href="#" data-html="true" data-toggle="tooltip" data-placement="right"
                style="text-decoration:none;background-color:#5bc0de;color:#fff;padding:0.2em;">
                <xsl:attribute name="title">
                    <xsl:apply-templates/>
                </xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:text>#ftn-</xsl:text>
                    <xsl:value-of select="@n"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:text>ftn-</xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:text>-intext</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="@n"/>
            </a>
        </sup>
    </xsl:template>

    <xsl:template match="t:ref" mode="artikel">
        <xsl:choose>
            <xsl:when test="contains(@target, '(Einleitung|Fabel|Aesop|Phaedrus|Barbios|Textkritik|Metrik|Avian|Bibliographie|Doku|doku|Publikationen|Ressourcen|overview|Literatur)')">
                <!-- dann ist es ein Link auf eine der Einleitungen im Portal -->
                <a>
                    <xsl:attribute name="href">
                        <xsl:text>http:</xsl:text>
                        <xsl:value-of select="$server"/>
                        <xsl:text>/context:graf?mode=</xsl:text>
                        <xsl:if test="contains(@target, 'Fabel')">fableintro</xsl:if>
                        <xsl:if test="contains(@target, 'Metrik')">metrik</xsl:if>
                        <xsl:if test="contains(@target, 'Avian')">avian</xsl:if>
                        <xsl:if test="contains(@target, 'Aesop')">aesop</xsl:if>
                        <xsl:if test="contains(@target, 'Phaedrus')">phaedrus</xsl:if>
                        <xsl:if test="contains(@target, 'Babrios')">babrios</xsl:if>
                        <xsl:if test="contains(@target, 'Textkritik')">textkritik</xsl:if>
                        <xsl:if test="contains(@target, 'Doku')">doku</xsl:if>
                        <xsl:if test="contains(@target, 'doku')">doku</xsl:if>
                        <xsl:if test="contains(@target, 'Ressourcen')">ressourcen</xsl:if>
                        <xsl:if test="contains(@target, 'Literatur')">literatur</xsl:if>
                        <xsl:if test="contains(@target, 'Publikationen')">literatur</xsl:if>
                        <xsl:if test="contains(@target, 'Dokumentation')">doku</xsl:if>
                        <xsl:if test="contains(@target, 'overview')">overview</xsl:if>
                    </xsl:attribute>
                    <xsl:apply-templates mode="artikel"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <!-- dann ist es ein Link auf eine ID im Dokument, z.B. FN oder Literaturliste -->
                <a>
                    <xsl:attribute name="href">
                        <xsl:choose>
                            <xsl:when test="@target">
                                <xsl:value-of select="@target"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>#</xsl:text>
                                <xsl:value-of select="translate(translate(., ' ', ''), '/', '')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:apply-templates mode="artikel"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="t:head[@rend = 'chapter']" mode="artikel">
        <h4>
            <xsl:apply-templates mode="artikel"/>
        </h4>
    </xsl:template>

    <xsl:template match="t:head[@rend = 'sub']" mode="artikel">
        <h5>
            <xsl:apply-templates mode="artikel"/>
        </h5>
    </xsl:template>
    <xsl:template match="t:head[@rend = 'subsub']" mode="artikel">
        <h6>
            <xsl:apply-templates mode="artikel"/>
        </h6>
    </xsl:template>
    <xsl:template match="t:head[@rend = 'subsubsub']" mode="artikel">
        <h6>
            <xsl:apply-templates mode="artikel"/>
        </h6>
    </xsl:template>
    
    <xsl:template match="t:seg[@xml:lang='la']" mode="artikel">
        <em>
            <xsl:apply-templates mode="artikel"/>
        </em>
    </xsl:template>


    <xsl:template match="t:hi[@rend = 'italic']" mode="artikel">
        <em>
            <xsl:apply-templates mode="artikel"/>
        </em>
    </xsl:template>

    <xsl:template match="t:hi[@rend = 'superscript']" mode="artikel">
        <sup>
            <xsl:apply-templates mode="artikel"/>
        </sup>
    </xsl:template>




    <!-- ................................. mode VGL ................................. -->
    <xsl:template match="t:head" mode="vgl">
        <h5>
            <xsl:apply-templates mode="vgl"/>
        </h5>
    </xsl:template>


    <xsl:template match="t:head[parent::t:div[@type = 'translation']]" mode="vgl">
        <h5>
            <xsl:apply-templates mode="vgl"/>
        </h5>
    </xsl:template>

    <xsl:template match="t:div[@type = 'translation']" mode="vgl">
        <hr/>
            <xsl:apply-templates mode="vgl"/>
    </xsl:template>

    <xsl:template match="t:l" mode="vgl">
        <em>
            <xsl:if test="contains(@met, 'pentameter')">
                <xsl:attribute name="style">
                    <xsl:text>text-indent:10%;</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates mode="vgl"/>
            <br/>
        </em>
    </xsl:template>

    <xsl:template match="t:hi[@rend = 'italic']" mode="vgl">
        <em>
            <xsl:apply-templates mode="vgl"/>
        </em>
    </xsl:template>


    <xsl:template match="t:span[@type = 'Textgrundlage']" mode="vgl">
        <hr/>
        <span style="color:#FFF;background-color:#000000;padding:0.2em;">
            <a style="color:#f9f4ea;border-bottom: none;">
                <xsl:attribute name="href">
                    <xsl:value-of select="translate(t:ref/@target, '-', '')"/>
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
            <xsl:value-of select="t:persName"/>
        </span>
    </xsl:template>

    <xsl:template match="t:span[@ana = 'keyword']" mode="vgl">
        <span class="subject-tag">
            <xsl:value-of select="t:term"/>
        </span>
    </xsl:template>
    






    <!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    Übersicht SPARQL -->

    <xsl:template match="s:results" mode="overview">
        <section class="row equalheight">

            <article class="col-md-12">
                <div class="static-wrapper-no-bottom" style="background-color:#ffffff;">
                    <h2> Übersicht über die im Repositorium vorhandenen Primärtexte <span
                            style="float:right;"> [<a href="/context:graf">Zurück zur Homepage.</a>]
                        </span>
                    </h2>

                    <hr/>

                    <p>
                        <b>Zitiervorschlag: </b>
                        <xsl:text>Übersicht, in: Grazer Repositorium antiker Fabeln, hrsg. v. Ursula Gärtner, Graz 2020.</xsl:text>
                        <br/>
                        <xsl:text>Permalink: </xsl:text>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>http:</xsl:text>
                                <xsl:value-of select="$server"/>
                                <xsl:text>/context:graf?mode=</xsl:text>
                                <xsl:value-of select="$mode"/>
                            </xsl:attribute>
                            <xsl:text>http:</xsl:text>
                            <xsl:value-of select="$server"/>
                            <xsl:text>/context:graf?mode=</xsl:text>
                            <xsl:value-of select="$mode"/>
                        </a>
                        <xsl:text>.</xsl:text>
                    </p>
                </div>
            </article>

        </section>

        <div class="no-underline-links">
        <xsl:for-each select="s:result">
            <xsl:sort select="s:title"/>

            <xsl:if test="not(contains(s:identifier, 'cirilo'))">
            <div class="static-wrapper lightgrey-box"
                >
                <h2 class="spaced-head ">
                        <a>
                            <xsl:attribute name="href">
                                <xsl:text>http:</xsl:text>
                                <xsl:value-of select="$server"/>
                                <xsl:text>/</xsl:text>
                                <xsl:value-of select="s:identifier"/>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="contains(s:title, '==')">
                                    <xsl:value-of select="substring-before(s:title, '==')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="s:title"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </a>
                    <span style="float:right;"> [
                    <a target="blank">
                        <xsl:attribute name="href">
                            <xsl:text>http:</xsl:text>
                            <xsl:value-of select="$server"/>
                            <xsl:text>/archive/objects/</xsl:text>
                            <xsl:value-of select="s:identifier"/>
                            <xsl:text>/methods/sdef:Object/getDC?</xsl:text>
                        </xsl:attribute>
                        Dublin Core Metadata
                    </a>]</span>
                </h2>
                <br/>
                <xsl:variable name="theIdno" select="s:identifier"/>
                <!-- TODO overview idno link -->
                <!-- oldIdno makes up for two levels of /gamsdev/slang with the ../s -->
                <xsl:variable name="oldIdno" select="concat('../../..//archive/objects/', $theIdno)"/>
                <xsl:variable name="gamsIdno" select="concat('/archive/objects/', $theIdno)"/>
                <xsl:variable name="glossaIdno" select="concat('/archive/objects/', $theIdno)"/>
                <xsl:variable name="myIdno" select="$gamsIdno"/>
                
                <xsl:if test="not(contains($myIdno, 'cirilo'))">
                    <div style="line-height: 200%;">
                        <xsl:for-each
                            select="document(concat($myIdno, '/datastreams/TEI_SOURCE/content'))/t:TEI//t:span[@ana = 'Thema']">
                            <span class="red-box">
                                <xsl:value-of select="."/>
                            </span>
                        </xsl:for-each>
                        <xsl:for-each
                            select="document(concat($myIdno, '/datastreams/TEI_SOURCE/content'))/t:TEI//t:listPerson/t:person">
                            <span style="background-color:#aec7a8;padding:0.2em; margin:5px;">
                                <xsl:value-of select="translate(translate(.,',',' '),';',' ')"/>
                            </span>
                        </xsl:for-each>
                    </div>
                </xsl:if>
                
               
            </div>    </xsl:if>
        </xsl:for-each>
        </div>
    </xsl:template>






</xsl:stylesheet>

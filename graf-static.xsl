<?xml version="1.0" encoding="UTF-8"?>

<!-- 
    Project: GAMS Projekttemplate - GRaF
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
    Author: Hans Clausen, Maximilian Müller, Gerlinde Schneider, Martina Scholger, Christian Steiner, Elisabeth Steiner
    Last update: 2015
    Modified for GRaF by: Sarah Lang, 2020
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
	xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:lido="http://www.lido-schema.org"
	xmlns:bibtex="http://bibtexml.sf.net/" exclude-result-prefixes="#all">

	<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>

	<!-- häufig verwendete variablen... -->

	<xsl:param name="mode"/>
	<xsl:param name="search"/>

	<xsl:variable name="model"
		select="substring-after(/s:sparql/s:results/s:result/s:model/@uri, '/')"/>

	<xsl:variable name="cid">
		<!-- das ist der pid des contextes, kommt aus dem sparql (ggfs. query anpassen) - wenn keine objekte zugeordnet sind, gibt es ihn nicht! -->
		<xsl:value-of select="/s:sparql/s:results/s:result[1]/s:cid"/>
	</xsl:variable>

	<xsl:variable name="teipid">
		<xsl:value-of select="//t:idno[@type = 'PID']"/>
	</xsl:variable>

	<xsl:variable name="lidopid">
		<xsl:value-of select="//lido:lidoRecID"/>
	</xsl:variable>



	<!--variablen für Suchergebnisse-->
	<xsl:variable name="query" select="sparql/head/query"/>
	<xsl:variable name="hitTotal" select="/sparql/head/hitTotal"/>
	<xsl:variable name="hitPageStart" select="/sparql/head/hitPageStart"/>
	<xsl:variable name="hitPageSize" select="/sparql/head/hitPageSize"/>
	<xsl:variable name="hitsFrom" select="sparql/navigation/hits/from"/>
	<xsl:variable name="hitsTo" select="sparql/navigation/hits/to"/>


	<!-- GAMS global variables -->
	<xsl:variable name="zim">Zentrum für Informationsmodellierung - Austrian Centre for Digital
		Humanities</xsl:variable>
	<xsl:variable name="zim-acdh">ZIM-ACDH</xsl:variable>
	<xsl:variable name="gams">Geisteswissenschaftliches Asset Management System</xsl:variable>
	<xsl:variable name="uniGraz">Universität Graz</xsl:variable>

	<!-- project-specific variables -->
	<xsl:variable name="server">//gams.uni-graz.at</xsl:variable>
	<!-- beim Migrieren wird die ganze Variable geleert, weil das alles nicht mehr gebraucht wird 
	<xsl:variable name="gamsdev">/gamsdev/slang</xsl:variable>
	/gamsdev/slang/trunk/gams-www -->
	<xsl:variable name="gamsdev"></xsl:variable>

	<xsl:variable name="projectTitle">
		<xsl:text>Grazer Repositorium antiker Fabeln (GRaF)</xsl:text>
	</xsl:variable>
	<xsl:variable name="subTitle">
		<xsl:text>Ein Sparkling Science Projekt </xsl:text>
	</xsl:variable>

	<!-- gesamtes css ist in dieser Datei zusammengefasst mit Ausnahme der Navigation -->
	<xsl:variable name="projectCss">
		<xsl:value-of select="concat($gamsdev, '/graf/css/graf.css')"/>
	</xsl:variable>
	<!--css für die navigation-->
	<xsl:variable name="projectNav">
		<xsl:value-of select="concat($gamsdev, '/graf/css/navbar.css')"/>
	</xsl:variable>

	<!--xsl für die suchansicht-->
	<xsl:variable name="searchXsl">
		<xsl:value-of select="concat($server, $gamsdev, '/graf/graf-search.xsl')"/>
	</xsl:variable>
	
	
	
	<xsl:param name="type">website</xsl:param>
	<xsl:param name="url">http://gams.uni-graz.at/context:gams</xsl:param>
	<xsl:param name="image">https://static.uni-graz.at/fileadmin/_processed_/e/d/csm_gams-start1_4ebc8f634e.jpg</xsl:param>
	<xsl:param name="publisher" select="//t:publicationStmt//t:authority"/>
	<xsl:param name="author" select="//t:titleStmt//t:author"/>
	<xsl:param name="editor" select="//t:respStmt//t:persName"/>
	<xsl:param name="description" select="//t:editionStmt"/>
	<xsl:param name="license" select="//t:availability/t:licence"/>
	<xsl:param name="language" select="//t:text/@xml:lang"/>
	<xsl:param name="yearOfPublication" select="//t:pulicationStmt//t:date"></xsl:param>
	<xsl:param name="title" select="//t:titleStmt//t:title"></xsl:param>
	
	<xsl:template match="/">

		<html lang="de">
			<head>
				<meta charset="utf-8"/>
				<meta name="browser" content="IE=edge"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

				<meta name="description" content=""/>
				<!-- Projektbeschreibung eingeben -->
				<!-- wird durch Romans Metadata-Template eh ausgelesen (siehe unten) -->
				<!-- evtl. noch mehr Meta Tags aus Dublin Core, schema.org oder Open Graph -->

				<meta name="publisher"
					content="Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities"/>
				<meta name="content-language" content="de"/>

				<meta name="google" content="notranslate" />
				
				<!-- DCTERMS -->
				<meta name="dcterms.type" content="{$type}"></meta>
				<meta name="dcterms.title" content="{$title}"></meta>
				<meta name="dcterms.publisher" content="{$publisher}"></meta>
				<meta name="dcterms.issued" content="{$yearOfPublication}"></meta>
				<meta name="dcterms.description" content="{$description}"></meta>
				<meta name="dcterms.license" content="{$license}"></meta>
				<meta name="dcterms.language" content="{$language}"></meta>
				
				<xsl:for-each select="$author">
					<meta name="dcterms.creator">
						<xsl:attribute name="content">
							<xsl:value-of select="."/>
						</xsl:attribute>
					</meta>
				</xsl:for-each>
				
				<xsl:for-each select="$editor">
					<meta name="dcterms.creator">
						<xsl:attribute name="content">
							<xsl:value-of select="."/>
						</xsl:attribute>
					</meta>
				</xsl:for-each>
				
				<!-- OPEN GRAPH (following OG Protocol: http://ogp.me/ -->
				<meta property="og:type" content="{$type}"></meta>
				<meta property="og:url" content="{$url}" />
				<meta property="og:image" content="{$image}" />
				<meta property="og:description" content="{$description}" />
				<meta property="og:title" content="{$title}" />
				<meta property="og:description" content="{$description}"></meta>
				
				<xsl:for-each select="$author">
					<meta property="og:book:author">
						<xsl:attribute name="content">
							<xsl:value-of select="."/>
						</xsl:attribute>
						
					</meta>
				</xsl:for-each>
				
				<xsl:for-each select="$editor">
					<meta property="og:book:author">
						<xsl:attribute name="content">
							<xsl:value-of select="."/>
						</xsl:attribute>
						
					</meta>
				</xsl:for-each>

				<!--Projekttitel-->
				<title>
					<xsl:value-of select="$projectTitle"/>
				</title>

				<!-- Bootstrap core CSS -->
				<link href="/lib/1.0/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
				
				
				<!-- Custom styles for this template -->
				<link href="{$projectCss}" rel="stylesheet" type="text/css"/>

				<link href="{$projectNav}" rel="stylesheet" type="text/css"/>


				<!-- jQuery core JavaScript ================================================== -->
				
				<script src="/lib/1.0/jquery-1.11.3.min.js"><xsl:text> </xsl:text></script>

				<!-- Bootstrap core JavaScript ================================================== -->
				<script src="/lib/1.0/bootstrap-3.3.5/js/bootstrap.min.js"><xsl:text> </xsl:text></script>
				<!-- jQuery Plugin für Responsive Equal Height bei Columns: https://github.com/liabru/jquery-match-height -->
				<script src="/lib/1.0/plugins/matchHeight/jquery.matchHeight.js"><xsl:text> </xsl:text></script>
				<script src="/lib/1.0/plugins/matchHeight/matchHeight.js"><xsl:text> </xsl:text></script>

				<script src="//gams.uni-graz.at/lib/1.0/plugins/stickyfloat/stickyfloat.js">
					//
				</script>
				
				
				<!-- gams.js -->
				<script src="/lib/3.0/gamsJS/0.x/gams.js"><xsl:text> </xsl:text></script>
				<script>
					gamsJs.url.detectLocaleLang();
					gamsJs.dom.alignHashNavAwareOnLoad();
					gamsJs.dom.alignIdNavAwareOnClick();
				</script>             
				
				<script>
					$(document).ready(function () {
					$('article#sidebar').stickyfloat({
					duration: 0, startOffset: 70
					});});
				</script>
							
				<!-- TODO: sollte hier durch meine Version von navi.js ersetzt werden oder gehört das so?? 
				<script type="text/javascript" src="/gamsdev/steinerc/templates/trunk/www/project/js/navi.js">//</script>

				-->

				<!-- dataTables -->
				<link
					href="lib/2.0/plugins/bootstrap-datatable/dataTables.bootstrap.min.css"
					rel="stylesheet"/>
				<script src="lib/2.0/plugins/bootstrap-datatable/jquery.dataTables.min.js"><xsl:text> </xsl:text></script>


				<!-- Tooltip -->
				<script>
					$(document).ready(function(){
					//$('[data-toggle="tooltip"]').tooltip();   
					$('body').tooltip({selector: '[data-toggle="tooltip"]', boundary: 'window'});
					// stop conflict with DataTable tooltip
					});
				</script>

				
					
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

				
				<!-- Bootstrap DataTable -->
				<script>
					$(document).ready(function() {
					$('#theBiblioTable').DataTable( {
					dom: 'Bfrtip',
					buttons: [
					'print',
					'copy', 'excel', 'pdfHtml5', 'csv'
					]
					
					} );
					} );
					
				</script>
				
				
				<!-- Tooltip -->
				<script>
					$(document).ready(function(){
					//$('[data-toggle="tooltip"]').tooltip();   
					//$('body').tooltip({selector: '[data-toggle="tooltip"]'});
					// stop conflict with DataTable tooltip
					$("body").tooltip({
					selector: '[data-toggle="tooltip"]',
					'trigger': 'hover',
					});
					});
				</script>
				
				
				
			
			</head>

			<body>

				<header>
					<div class="container">
						<div class="row flex">
							<div class="col-lg-8 col-xs-7  col-md-7 col-sm-6">
								<h1 style="color:#f9f4ea">
									<a href="/context:graf" style="color:#f9f4ea;">
										<xsl:value-of select="$projectTitle"/>
									</a>
								</h1>
								<!-- <h2  style="color:#f9f4ea;margin-left:2em;margin-bottom:2em;">
									<xsl:value-of select="$subTitle"/><xsl:text>    </xsl:text>
									<span style="font-size:smaller;font-style:normal;background-color:#5bc0de;border:2px solid #5bc0de;border-radius: 5px;padding:3px;margin-bottom: 10px;"> βῆτα </span>
								</h2> -->
							</div>

							<div class="col-lg-3 col-md-3 col-sm-4 hidden-xs">
								<div class="unilogo" style="padding-right:15px; margin-top:10px">
									<img class="logoG img-fluid img-responsive"
										src="{$gamsdev}/graf/img/tiere-transparent-beige.png"
										title="Figuren aus Fabelbuch" alt="Gestalten mit Tiermasken"
										width="250"/>
								</div>
							</div>
							<div class="col-lg-1 col-md-2 col-sm-2 col-xs-5">
								<p> <xsl:text> </xsl:text></p>
								<!-- <div class="language"  style="color:#f9f4ea">
										<a href="#">DE</a> | <a href="#">EN</a>
									</div> -->
									<a target="blank" href="https://www.uni-graz.at" class="unilogo">
										<img class="logoUni img-fluid img-responsive pull-right" style="margin-top:20px;"
											src="/templates/img/logo_uni_graz_4c.jpg"
											title="Universität Graz" alt="Universität Graz"/>
									</a>
							</div>
						</div>
					</div>
				</header>



				<nav class="navbar navbar-default navbar-static-top" id="nav">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar">
									<xsl:text> </xsl:text>
								</span>
								<span class="icon-bar">
									<xsl:text> </xsl:text>
								</span>
								<span class="icon-bar">
									<xsl:text> </xsl:text>
								</span>
							</button>
							<a class="navbar-brand hidden-lg hidden-md hidden-sm" href="#"
								>Navigation</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li>
									<!-- active klasse muss für aktiven navigationspunkt zugewiesen werden -->
									<a href="/context:graf"> Home </a>
								</li>

								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false"
										>Über <span class="caret"><xsl:text> </xsl:text></span></a>
									<ul class="dropdown-menu">
										<li>
											
											<a href="/context:graf?mode=project"
												>Projektbeschreibung</a>
										</li>
										<li>
											
											<a href="/context:graf?mode=inhaltsuebersicht">Inhaltsübersicht</a>
										</li>
										<li>
											<a href="/context:graf?mode=benutzungsanleitung">Zur Benutzung des Portals</a>
										</li>
										<li>
											<a href="/context:graf?mode=team">Team</a>
										</li>
										<li>
											
											<a href="/context:graf?mode=doku"
												>Dokumentation</a>
										</li>
										
										<!-- Werbematerialien -->
										<li>
											<a href="/context:graf?mode=infomaterial">Infomaterialien</a>
										</li>
										<li>
											<a href="/context:graf?mode=literatur">Publikationen zu GRaF</a>
										</li>
										<li>
											<a href="/context:graf?mode=ressourcen">Ressourcenliste</a>
										</li>
										
										
	
									</ul>
								</li>
								<li class="dropdown">
									<!--<xsl:if test="$mode = 'glt1' or $mode='glt2' or $mode='glt3' or $mode='kongressachtzehn' or $mode='kongressneunzehn' or $mode='fabelworkshop'">
										<xsl:attribute name="class">active</xsl:attribute>
									</xsl:if>-->
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false"
										>Events
										<span class="caret"><xsl:text> </xsl:text></span></a>
									<ul class="dropdown-menu">
										<li>
											<a href="/context:graf?mode=glt1">1. Grazer Latein-Tag 2016</a>
										</li>
										<li>
											<a href="/context:graf?mode=glt2">2. Grazer Latein-Tag 2017</a>
										</li>
										<li>
											<a href="/context:graf?mode=glt3">3. Grazer Latein-Tag 2018</a>
										</li>
										<li>
											<a href="/context:graf?mode=kongressachtzehn">SchülerInnenkongress Mai 2018</a>
										</li>
										<li>
											<a href="/context:graf?mode=kongressneunzehn">SchülerInnenkongress Mai 2019</a>
										</li>
										<li>
											<a href="/context:graf?mode=fabelworkshop">Fabelworkshop 2018</a>
										</li>
									</ul>
								</li>
								
								<li>
									<a href="/context:graf?mode=benutzungsanleitung">Hilfe</a>
								</li>
								
								<li class="dropdown">
									<!--<xsl:if test="$mode = 'fableintro' or $mode='metrik' or $mode='textkritik' or $mode='aesop' or $mode='phaedrus' or $mode='avian' or $mode='babrios' or $mode = 'bibliographie' or $mode='bibliographieaesop'">
										<xsl:attribute name="class">active</xsl:attribute>
									</xsl:if>-->
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false"
										>Einleitung <span class="caret"><xsl:text> </xsl:text></span></a>
									<ul class="dropdown-menu">
										<li>
											<a href="/context:graf?mode=fableintro"
												>Einführung zur antiken Fabel</a>
										</li>
										<li>
											<a href="/context:graf?mode=textkritik"
												>Textkritik</a>
										</li>
										<li>
											<a href="/context:graf?mode=metrik"
												>Metrik</a>
										</li>
										<li>
											<a href="/context:graf?mode=aesop"
												>Aesop</a>
										</li>
										<li>
											<a href="/context:graf?mode=babrios"
												>Babrios</a>
										</li>

										<li>
											<a href="/context:graf?mode=phaedrus"
												>Phaedrus</a>
										</li>
										<li>
											<a href="/context:graf?mode=avian"
												>Avian</a>
										</li>
										<li>
											<a href="/context:graf?mode=bibliographie">Bibliographie zur antiken Fabel</a>
										</li>

									</ul>
								</li>
								
								<li class="dropdown">
									<a href="/context:graf?mode=overview" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false"
										>Fabeln <span class="caret"><xsl:text> </xsl:text></span></a>
									<ul class="dropdown-menu">
										<li>
											<a href="/context:graf?mode=overview">Übersicht</a>
										</li>
										<li>
											<a href="/context:graf?mode=vglstellen"
												>Vergleichsstellen</a>
										</li>
									</ul>
								</li>
							</ul>
							<form class="navbar-form navbar-right" role="search" method="get"
								action="/search/gsearch">

								<div class="input-group">

									<input id="query" name="query" type="text"
										placeholder="Volltextsuche" onclick="this.select()"
										class="form-control" title="Volltextsuche"/>
									<span class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<span class="glyphicon glyphicon-search">
												<xsl:text> </xsl:text>
											</span>
											<span class="sr-only">Suche</span>
										</button>
									</span>

									<input type="hidden" name="hitPageSize" value="10"/>
									<input type="hidden" name="hitPageStart" value="1"/>
									<input type="hidden" name="pid" value="graf"/>
									<!--<input type="hidden" name="search" value="simple"/>-->
									<!-- nur zur abgrenzung verwenden wenn man auch advanced hat -->
									<input type="hidden" name="x2">
										<xsl:attribute name="value">
											<xsl:text>https:</xsl:text>
											<xsl:value-of select="$searchXsl"/>
										</xsl:attribute>
									</input>

								</div>
							</form>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
					<!-- /.container -->
				</nav>
				<!-- sticky navigation, script muss unbedingt unter dem element <nav> stehen;
				 type="text/javascript" -->
				<script>
					$('#nav').affix({
					offset : {
					top : $('header').height() - $('#nav').height()
					}
					});
				</script>



<xsl:choose>
	<xsl:when test="not($mode)">
		<xsl:call-template name="content"/>
	</xsl:when>
	<xsl:otherwise>
	<main class="container">
					<xsl:choose>
						<xsl:when test="$mode = '' and $cid = 'context:templates'">
							<!-- einstiegsseite für projektkontext -->


						</xsl:when>


						<xsl:when test="$mode = 'imprint'">
							<!-- impressum, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->

							<section class="row">
								<article class="col-md-10">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'IMPRINT'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:when test="$mode = 'team'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'TEAM'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'literatur'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'LITERATUR'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'ressourcen'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'RESSOURCENLISTE'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'doku'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'DOKUMENTATION'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						

						<xsl:when test="$mode = 'bibliographie'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'BIBLIOGRAPHIE'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'vglstellen'">
							<section class="row">
								<article class="col-md-12">
									<xsl:apply-templates
											select="document(concat('/context:graf/', 'VGLSTELLEN'))/t:TEI"
											mode="context" />
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'aesop'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'AESOP'))/t:TEI"
											mode="context" />
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'babrios'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'BABRIOS'))/t:TEI"
											mode="context" />
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'metrik'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'METRIK'))/t:TEI"
											mode="context" />
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'avian'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'AVIAN'))/t:TEI"
											mode="context" />
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'textkritik'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'TEXTKRITIK'))/t:TEI"
											mode="context" />
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'phaedrus'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'PHAEDRUS'))/t:TEI"
											mode="context" />
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'fableintro'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'FABLEINTRO'))/t:TEI"
											mode="context" />
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'event'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'EVENT'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:when test="$mode = 'glt1'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'GLT1'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'glt2'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'GLT2'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'glt3'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'GLT3'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'kongressachtzehn'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'KONGRESS18'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						<xsl:when test="$mode = 'overview'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'METADATA'))/s:sparql"
											mode="overview"/>
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'kongressneunzehn'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'KONGRESS19'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>
						
						<xsl:when test="$mode = 'fabelworkshop'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'FABELWORKSHOP18'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:when test="$mode = 'project'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'PROJECT'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:when test="$mode = 'benutzungsanleitung'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'BENUTZUNGSANLEITUNG'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:when test="$mode = 'intro'">
							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'INTRO'))/t:TEI"
											mode="context"/>
									</div>
								</article>
							</section>
						</xsl:when>

						<xsl:when test="$mode = 'searchHelp'">
							<!-- Hilfe für die Suche, liegt in einem TEI-Datenstrom auf Projektkontext, auch für andere statische datenströme wie about, einleitung, etc. -->

							<section class="row">
								<article class="col-md-12">
									<div class="panel">
										<xsl:apply-templates
											select="document(concat('/context:graf/', 'SEARCH_HELP'))/t:TEI"
										/>
									</div>
								</article>
							</section>

						</xsl:when>



						<xsl:otherwise>
							<xsl:call-template name="content"/>
						</xsl:otherwise>
					</xsl:choose>


				</main></xsl:otherwise></xsl:choose>

				<footer class="footer">
					<div class="container">
						<div class="row">
							<div class="col-md-7">
								<h6>Weitere Informationen</h6>
								<p>
									<a href="/context:graf?mode=imprint">Impressum</a>
								</p>
								<p>
									<a target="blank" href="https://informationsmodellierung.uni-graz.at/"
										>ZIM:ACDH</a>
								</p>
								<p>
									<a target="blank" href="http://gams.uni-graz.at/archive/objects/context:gams/methods/sdef:Context/get?mode=dataprotection&amp;locale=de">Datenschutz</a>
								</p>

								<div class="icons">
									<a href="" target="blank">
										<img class="logoG" src="{$gamsdev}/graf/img/graf-logo-weiss.png"
											height="80" title="GRaF-Logo" alt="GRaF-Logo"
											style="padding-right:10px;padding-bottom:10px;margin-right: 2em;"
											/>
									</a>
									
									<a href="https://gams.uni-graz.at" target="blank">
										<img class="logo" src="/templates/img/gamslogo_weiss.gif" 
											height="45" title="{$gams}" alt="{$gams}"
											style="padding-right:10px;padding-bottom:10px;margin-right: 2em;"
											/>
									</a>

									<a href="https://informationsmodellierung.uni-graz.at/"
										target="blank">
										<img class="logo" src="/templates/img/ZIM_weiss.png"
											height="45" title="{$zim-acdh}" alt="{$zim-acdh}"
											style="padding-right:10px;padding-bottom:10px;margin-right: 2em;"
											/>
									</a>

									<a target="blank" href="https://www.sparklingscience.at/">
										<img class="logoG"	src="{$gamsdev}/graf/img/logo-sparkling-science.jpg"
											title="Sparkling Science" alt="Sparkling Science"
											style="padding-right:10px;padding-bottom:10px;margin-right: 2em;"
											height="90"/>
									</a>

									<a href="http://creativecommons.org/licenses/by-nc/4.0/"
										target="blank">
										<img class="logo" src="{$gamsdev}/graf/img/cc-bync.png"
											height="42" title="Lizenz" alt="Lizenz"
											style="padding-right:10px;padding-bottom:10px;margin-right: 2em;"
											/>
									</a>

								</div>
							</div>


							<div class="col-md-5">
								<h6>Kontakt</h6>
								<p>Univ.-Prof. Dr.phil. Ursula Gärtner<br/>Karl-Franzens-Universität
									Graz <br/>Institut für Antike <br/>Fachbereich Klassische Philologie<br/>
									Universitätsplatz 3/II, 8010 Graz, 8010 Graz<br/> +43 (0)316 380
									- 2432</p>
								<p>
									<a href="mailto:ursula.gaertner@uni-graz.at"
										>ursula.gaertner@uni-graz.at</a>
								</p>
							</div>
						</div>
					</div>
				</footer>
				

			</body>

		</html>
	</xsl:template>

	<!--Ab hier je nach Bedarf ändern-->
	<xsl:template match="t:head">
		<xsl:choose>
			<xsl:when test="following-sibling::t:p">
				<h4>
					<xsl:value-of select="."/>
				</h4>
			</xsl:when>
			<xsl:otherwise>
				<h3>
					<xsl:value-of select="."/>
				</h3>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="t:bibl">
		<p>
			<xsl:value-of select="./t:title"/>
		</p>
	</xsl:template>

	<xsl:template match="t:div">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="t:p">
		<p>
			<xsl:apply-templates/><xsl:text> </xsl:text>
		</p>
	</xsl:template>

	<xsl:template match="t:lb"><xsl:text> </xsl:text>
		<br/>
	</xsl:template>
	
	
	<xsl:template match="t:ref[contains(@target, '(Fabel|Aesop|Phaedrus|Barbios|Textkritik|Metrik|Avian|Bibliographie)')]">
		<a>
			<xsl:attribute name="href">
				<xsl:text>http:</xsl:text>
				<xsl:value-of select="$server"/>
				<xsl:text>/context:graf?mode=</xsl:text>
				<xsl:choose>
					<xsl:when test="contains(@target, 'Fabel')">fableintro</xsl:when>
					<xsl:when test="contains(@target, 'Aesop')">aesop</xsl:when>
					<xsl:when test="contains(@target, 'Phaedrus')">phaedrus</xsl:when>
					<xsl:when test="contains(@target, 'Babrios')">babrios</xsl:when>
					<xsl:when test="contains(@target, 'Textkritik')">textkritik</xsl:when>
					<xsl:when test="contains(@target, 'Metrik')">metrik</xsl:when>
					<xsl:when test="contains(@target, 'Avian')">avian</xsl:when>
					<!-- 
					<xsl:when test="contains(@target, 'Bibliographieaesop')">bibliographieaesop</xsl:when>
					 -->
					<xsl:when test="contains(@target, 'Bibliographie')">bibliographie</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="@target"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:apply-templates/>
		</a>
	</xsl:template>

</xsl:stylesheet>

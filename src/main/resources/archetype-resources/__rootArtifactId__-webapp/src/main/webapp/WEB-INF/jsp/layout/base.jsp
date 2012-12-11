#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>

<spring:url value="/" var="base" />

<!DOCTYPE html>
<%-- Modernizr removed no-js with js to detect javascript support, see http://modernizr.github.com/Modernizr/annotatedsource.html--%>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <%-- stopWatch for easy catch of bottlenecks --%>
    <script type="text/javascript">
        window.app_loadTime = window.icash_lastTime = new Date().getTime();
        window.app_prevLabel = '';

        window.stopWatch = function(label) {
            var time_ms = new Date().getTime(),
                age_ms = time_ms - window.app_loadTime,
                diff_ms = time_ms - window.app_lastTime,
                prevLabel = window.app_prevLabel;

            if (diff_ms > 20) {
                console.log('[' + (age_ms / 1000).toFixed(3) + 's +' + (diff_ms/1000).toFixed(3) + 's] [' + label + '], prev: [' + prevLabel + ']');
            }

            window.app_lastTime = time_ms;
            window.app_prevLabel = label;
        };
    </script>

    <%-- == Meta ================================================== --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>

    <meta name="viewport" content="width=device-width, initial-scale=${version}">
    <meta name="robots" content="none"/>
    <meta name="author" content=""/>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <%-- Place favicon.ico and apple-touch-icon.png in the webapps directory --%>
    <link rel="icon" type="image/x-icon" href="${symbol_dollar}{base}/favicon.ico">

    <%-- https://developer.apple.com/library/ios/#documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html --%>
    <link rel="apple-touch-icon" href="${symbol_dollar}{base}/apple-touch-icon.png"/>
    <link rel="apple-touch-icon-precomposed" href="${symbol_dollar}{base}/apple-touch-icon-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="${symbol_dollar}{base}/apple-touch-icon-57x57-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${symbol_dollar}{base}/apple-touch-icon-72x72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${symbol_dollar}{base}/apple-touch-icon-114x114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${symbol_dollar}{base}/apple-touch-icon-144x144-precomposed.png"/>

    <%--<link rel="apple-touch-startup-image" href="/startup.png">--%>
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />

    <tiles:useAttribute name="title" id="title_code"/>
    <title><spring:message code="${symbol_dollar}{title_code}"/></title>
    <tiles:insertAttribute name="headerInclude"/>
</head>
<body>
<!--[if lt IE 7]>
    <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->

<tiles:insertAttribute name="navbar" />

<div class="container">
<tiles:insertAttribute name="content"/>
</div>

<tiles:insertAttribute name="footerInclude"/>

</body>
</html>

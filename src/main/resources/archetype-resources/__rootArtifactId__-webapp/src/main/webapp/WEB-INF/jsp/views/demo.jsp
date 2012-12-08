#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>

<util:dust path="/template/dustjs_demo" />

<util:js value="/resources/js/pages/demo.js" />

<h3>JSP EL Demo</h3>
<p>
    2 + 2 = ${symbol_dollar}{2+2}
</p>

<h3>Form Demo</h3>
<div id="submit_demo">

<form class="form-horizontal" method="get">
    <c:if test="${symbol_dollar}{empty a}"><c:set var="a" value="2" /></c:if>
    <c:if test="${symbol_dollar}{empty b}"><c:set var="b" value="2" /></c:if>

    <input class="input-mini" type="text" name="a" value="${symbol_dollar}{a}" /> + <input class="input-mini" type="text" name="b" value="${symbol_dollar}{b}"/>
    <input type="submit" class="btn" value="Add" />
</form>
<p>
    <c:if test="${symbol_dollar}{not empty result}">${symbol_dollar}{a} + ${symbol_dollar}{b} = ${symbol_dollar}{result}</c:if>
   &nbsp;
</p>
</div>

<h3>Ajax Form Demo</h3>
<div id="ajax_demo">
    <div class="form-horizontal" style="margin-bottom: 20px">
        <input class="input-mini" type="text" name="a" value="2" /> + <input class="input-mini" type="text" name="b" value="2"/>
        <button class="btn" value="Add">Add</button>
    </div>
    <p>&nbsp;</p>
</div>

<h3>Dust.js Demo</h3>
<div id="dustjs_demo">

</div>

<p>
<small class="muted">
    <spring:url value="/template/dustjs_demo.dust" var="dustjs_demo_url" />
    <spring:url value="/api/add?a=1&b=2" var="ajax_api_demo_url" />

    You can find source of this page in <code>demo.jsp</code>. JavaScript code can be found in <code>demo.js</code>. Source code for logic is in <code>DemoController.java</code>.<br/>
    API endpoint for Ajax Demo can be tested <a href="${symbol_dollar}{ajax_api_demo_url}">here</a>.<br/>
    dust.js template can be checked at <a href="${symbol_dollar}{dustjs_demo_url}">${symbol_dollar}{dustjs_demo_url}</a>, compiled version is at <a href="${symbol_dollar}{dustjs_demo_url}.js">${symbol_dollar}{dustjs_demo_url}.js</a>.
</small>
</p>

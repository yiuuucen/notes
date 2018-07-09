<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static" />

<c:set var="css" value="${pageContext.request.contextPath}/static/css" />
<c:set var="img" value="${pageContext.request.contextPath}/static/img" />
<c:set var="js" value="${pageContext.request.contextPath}/static/js" />

<c:set var="libs" value="${pageContext.request.contextPath}/static/libs" />
<c:set var="dist" value="${pageContext.request.contextPath}/static/dist" />
<c:set var="plugins" value="${pageContext.request.contextPath}/static/plugins" />
<c:set var="cenimg" value="${pageContext.request.contextPath}/static/dist/img/old" />
<c:set var="cenimgnew" value="${pageContext.request.contextPath}/static/dist/img/new" />

<c:set var="webinf" value="/WEB-INF" />
<script type="text/javascript">
	window.ctx='${ctx}';
</script>




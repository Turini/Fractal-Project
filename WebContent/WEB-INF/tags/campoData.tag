<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ attribute name="id" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="value" required="false" type="java.util.Calendar"%>

<input type="text" class="date" name="${name}" value="<fmt:formatDate value="${value.time}" pattern="dd/MM/yyyy"/>" disabled="disabled" />

<script type="text/javascript">
	$(".date").datepicker({dateFormat: 'dd/mm/yy'});
</script>
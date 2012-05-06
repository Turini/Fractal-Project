<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ attribute name="id" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="value" required="false" type="java.util.Calendar"%>



<input type="text" id="${id}" name="${name}" value="<fmt:formatDate value="${value.time}" pattern="dd/MM/yyyy"/>" class="text ui-widget-content ui-corner-all" disabled="disabled" size="12px"/>

<script type="text/javascript">

	$("#${id}").datepicker({dateFormat: 'dd/mm/yy'});

</script>
<script language="javascript">
    window.history.forward();
</script><%
session.removeAttribute("currentUser");

session.invalidate();
response.sendRedirect("home.jsp?msg=logout");
 %>
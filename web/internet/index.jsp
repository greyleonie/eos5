<%
//response.sendRedirect(response.encodeRedirectURL("index.do")) ;
request.getRequestDispatcher("index.do").forward(request, response);
%>
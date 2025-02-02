<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_chat c inner join tbl_user s on (c.to_user_id=s.user_id) or (c.from_user_id=s.user_id) inner join tbl_serviceprovider com on (c.to_serviceprovider_id=com.provider_id) or (c.from_serviceprovider_id=com.provider_id)  where s.user_id='" + request.getParameter("cid") + "' and com.provider_id='" + session.getAttribute("Spid") + "' order by chat_id";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
        if (rs.getString("from_serviceprovider_id").equals(session.getAttribute("Spid"))) {

%>

<div class="chat-message is-sent">
    <img src="../../Assets/Files/ServiceProvider/<%=rs.getString("provider_photo")%>" alt="no img">
    <div class="message-block">
      
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%
//out.print(request.getParameter("cid"));
//out.print(rs.getString("to_user_id"));
} 
        else if (rs.getString("to_serviceprovider_id").equals(session.getAttribute("Spid"))) {
 
   
%>
<div class="chat-message is-received">
    <img src="../../Assets/Files/User/<%=rs.getString("user_photo")%>"alt="">
    <div class="message-block">
        <span><%=rs.getString("user_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%
                    }
                }
           


%>
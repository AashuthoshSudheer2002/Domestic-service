<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_chat c inner join tbl_serviceprovider s on (c.to_serviceprovider_id=s.provider_id) or (c.from_serviceprovider_id=s.provider_id) inner join tbl_user com on (c.to_user_id=com.user_id) or (c.from_user_id=com.user_id)  where s.provider_id='" + request.getParameter("cid") + "' and com.user_id='" + session.getAttribute("Urid") + "' order by chat_id";
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {
        if (rs.getString("from_user_id").equals(session.getAttribute("Urid"))) {

%>

<div class="chat-message is-sent">
    <img src="../../Assets/Files/User/<%=rs.getString("user_photo")%>" alt="no img">
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
        else if (rs.getString("to_user_id").equals(session.getAttribute("Urid"))) {
 
   
%>
<div class="chat-message is-received">
    <img src="../../Assets/Files/ServiceProvider/<%=rs.getString("provider_photo")%>"alt="">
    <div class="message-block">
        <span><%=rs.getString("provider_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%
                    }
                }
           


%>
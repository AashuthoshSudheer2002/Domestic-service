<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .form-table {
            margin: 20px auto;
            border: 2px solid #ddd;
            padding: 10px;
            width: 400px;
        }
    </style>
</head>
<body>
<a href="Homepage.jsp">HomePage</a>
       <%
        if(request.getParameter("btnsubmit")!=null)
        {
           if(request.getParameter("eid")!=null)
           {
               String upQry="update tbl_employee set employee_name='"+request.getParameter("empname")+"',employee_gender='"+request.getParameter("gender")+"',dept_id='"+request.getParameter("Department")+"',designation_id='"+request.getParameter("Designation")+"',basic_salary='"+request.getParameter("basicsal")+"' where employee_id='"+request.getParameter("eid")+"'";
                if(con.executeCommand(upQry))
                 {  
                
                %>
                <script>
                    alert("Data Updated");
                    window.location="Employee.jsp";
                </script>
                <%
             }   
           }
           else
           { 
             String ins="insert into tbl_employee (employee_name,employee_gender,dept_id,designation_id,basic_salary)value('"+request.getParameter("empname")+"','"+request.getParameter("gender")+"','"+request.getParameter("Department")+"','"+request.getParameter("Designation")+"','"+request.getParameter("basicsal")+"')";
                   
             if(con.executeCommand(ins))
             {  
                
                 %>
                 <script>
                     alert("Data inserted");
                     window.location="Employee.jsp";
                 </script>
                 <%
             }
             else
             {
                 %>
                 <script>
                     alert("Data not inserted");
                     window.location="Employee.jsp";
                 </script>
                 <%
             }    
        }
       }    
        if(request.getParameter("delID")!=null)
            {
                String delQry="delete from tbl_employee where employee_id='"+request.getParameter("delID")+"'";
                if(con.executeCommand(delQry))
                {  
                
                    %>
                    <script>
                        alert("Data deleted");
                        window.location="Employee.jsp";
                    </script>
                    <%
                }
                {
                    %>
                    <script>
                        alert("Data not deleted");
                        window.location="Employee.jsp";
                    </script>
                    <%
                }    
            }
         String empnamedit="";
         String empgender="";
         String desgid="";
         String deptid="";
         String empsal="";
    if(request.getParameter("eid")!=null)
    {
        String selQryedit="select * from tbl_employee where employee_id='"+request.getParameter("eid")+"'";
        ResultSet resedit = con.selectCommand(selQryedit);
        resedit.next();
        empnamedit= resedit.getString("employee_name");
        empgender= resedit.getString("employee_gender");
        desgid=resedit.getString("designation_id");
        deptid=resedit.getString("dept_id");
        empsal=resedit.getString("basic_salary");
    }   
 
 
                
       
        %>   
   
   
   <form method="post">
        <table class="form-table">
             <tr>
            <th>Name</th>
            <td>
                <input type="text" name="empname" placeholder="Enter the employee name" required value="<%=empnamedit%>"> 
            </td>
        </tr>
        <tr>
            <th>Gender</th>
            <td>
                <input type="radio" name="gender" value="M" required value="<%=empgender%>" <%if(empgender.equals("M")) out.print("checked");%>>Male
                <input type="radio" name="gender" value="F" required value="<%=empgender%>" <%if(empgender.equals("F")) out.print("checked");%>>Female
            </td>
        </tr>
        <tr>
            <th>Dept</th>
            <td>
                <select name="Department">
                    <%                               
                        String selQry = "select * from tbl_department";
                        ResultSet rscat = con.selectCommand(selQry);
                        while (rscat.next()) {
                    %>
                    <option value="<%=rscat.getString("dept_id")%>" <%if(rscat.getString("dept_id").equals(deptid)) out.print("Selected");%>><%=rscat.getString("dept_name")%></option>
                    <%
                        }
                    %>
                </select>							
            </td>
        </tr>
        <tr>
            <th>Designation</th>
            <td>
                <select name="Designation">
                    <%                               
                        String selQdes = "select * from tbl_designation";
                        ResultSet rsca = con.selectCommand(selQdes);
                        while (rsca.next()) {
                    %>
                    <option value="<%=rsca.getString("designation_id")%>" <%if(rsca.getString("designation_id").equals(desgid)) out.print("Selected");%>><%=rsca.getString("designation_name")%></option>
                    <%
                        }
                    %>
                </select>							
            </td>
        </tr>
        <tr>
            <th>Salary</th>
            <td>
                <input type="number" name="basicsal" required value="<%=empsal%>"> 
            </td>
        </tr>
    
        <tr>
            <td colspan="2" align="center">
                <div style="text-align: center;">
                <input type="submit" name="btnsubmit" value="Save">
                <input type="reset" name="btncancel" value="Cancel">
                </div>
            </td>
        </tr>
        </table>
        <br>
        <br>
        <table border="1" align="center">
           <tr>
                <td><b>SI.no</b></td>
                <td><b>Employee Name</b></td>
                <td><b>Department Name</b></td>
                <td><b>Designation Name</b></td>
                <td><b>Gender</b></td>
                <td><b>Salary</b></td>
                <td>Action</td>
            </tr>    
            <%                     
                int i = 0;
                String selEmp = "SELECT * from tbl_employee e inner join tbl_department d on d.dept_id=e.dept_id inner join tbl_designation ds on ds.designation_id=e.designation_id;";
                
                ResultSet rsemp = con.selectCommand(selEmp);
                while (rsemp.next()) {
                    i++;
            %>
         <tr>
  <td><%=i%></td>
  <td><%=rsemp.getString("employee_name")%></td>
  <td><%=rsemp.getString("dept_name")%></td>
  <td><%=rsemp.getString("designation_name")%></td>
  <td><%=rsemp.getString("employee_gender")%></td>
  <td><%=rsemp.getString("basic_salary")%></td>
  <td class="action-buttons">
    <form method="get" action="Employee.jsp" style="display: inline;">
      <input type="hidden" name="delID" value="<%=rsemp.getString("employee_id")%>">
      <button type="submit" name="action" value="delete">Delete</button>
    </form>
    <form method="get" action="Employee.jsp" style="display: inline;">
      <input type="hidden" name="eid" value="<%=rsemp.getString("employee_id")%>">
      <button type="submit" name="action" value="edit">Edit</button>
    </form>
  </td>
</tr>

            </tr>
            <%
                }
            %>
        </table>
    </form>
</body>
</html>

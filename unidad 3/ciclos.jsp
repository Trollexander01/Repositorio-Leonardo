<%@ contentType="text/html;charset=UTF-8" language="java" %>
<center>
    <h2 style="color:blue;">Uso de ciclos en jsp</h2>
    <u>
        <h3 style="color:green;">Ciclo for</h3>
    </u>
    <%
        for(int i = 1; i <= 6; i++){
    %>
    <h4 style="color:green;">DSM51</h4>
    <%
        }
    %>  
    <u> 
        <h3 style="color:green;">Ciclo while</h3>
    </u>
    <%
        int j = 1;
        while(j <= 6){
    %>
    <h4 style="color:green;">DSM51</h4>
    <%
            j++;
        }
    %> 
</center>
    <a href=\"index.jsp\">Volver al índice de la unidad 3</a>
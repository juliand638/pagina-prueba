<!--#include file="cons.asp"-->
<%' The above file is our Connection to our datebase.
' Below is all the code that is needed in order to retrieve our data from our Database.
Set getAllSQL = CreateObject("ADODB.Command")
getAllSQL.ActiveConnection=objConn
getAllSQL.Prepared = true
getAllSQL.Commandtext = "SELECT ID, NOMBRE, APELLIDOS FROM INFORMACION" ' We only want to get the list of records, so we do not need any thing else added to our SELECT STATEMENT.
set objRs = getAllSQL.execute

if request.QueryString("Update") then ' Looks at the QueryString, if present, then continue
Set getSQL = CreateObject("ADODB.Command") ' Creates our Command Object
getSQL.ActiveConnection=objConn ' Gets our Connection
getSQL.Prepared = true ' Stores the CommandText for future use (To retrieve the records faster)
getS = int(Request.QueryString("Update")) ' Looks at the QueryString, if present, then we will use it against our database
getSQL.Commandtext = "SELECT  ID, NOMBRE, APELLIDOS FROM INFORMACION where ID=?" ' Always list these in order as they appear.
getSQL.Parameters.Append getSQL.CreateParameter("@ID", adInteger, adParamInput, , getS)' Parameters will help with the prevention of SQL INJECTION, Get use to using this, it will save your site and maybe even your job one day.
set UpdateRs = getSQL.execute ' We set our RecordSet here, so there i no need to use the CreateObject.
if not UpdateRs.eof then ' If there are any records we will continue on to the next line, if the db is empty then we stop.
MyID = int(UpdateRs("ID")) ' Gets the ID
MyFirst = trim(UpdateRs("NOMBRE")) ' Gets the MyFirst Record
MySecond = trim(UpdateRs("APELLIDOS")) ' Gets the MySecond Record
end if ' end it here
end if ' end it here
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
.MyTdTop{
border:1px #000000 dotted;
}
.MyTd{
width:75px;
border:1px #000000 double;
}
    .auto-style1 {
        width: 153px;
        border: 1px #000000 double;
    }
    .auto-style2 {
        width: 419px;
    }
    .auto-style3 {
        width: 378px;
        border: 1px #000000 double;
    }
    .auto-style4 {
        width: 375px;
    }
    .auto-style6 {
        width: 162px;
    }
    .auto-style7 {
        width: 183px;
        border: 1px #000000 double;
    }
    .auto-style8 {
        width: 383px;
    }
</style>
</head>

<body>
    <div class="jumbotron text-center">
  <h1>MI PRIMER PROYECTO ASP</h1>
  <p>MATAME ESTA PROFE!!</p> 
</div>
    <div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>INSERTAR</h3>
     <%if request.QueryString("Update") then%>
<form action="setRecords.asp" method="post">
<table style="width: 373px">
<tr><td colspan="2"  class="MyTdTop">ACTUALIZAR DATOS EXISTENTES</td></tr>
<input type="hidden" name="MyRecord" value="Update" />
<input name="MyID" type="hidden" value="<%=MyID%>" />
<tr><td class="auto-style1">MI NOMBRE</td><td><input name="MyFirst" type="text" value="<%=MyFirst%>" style="width: 210px" /></td></tr>
<tr><td class="auto-style1">MI APELLIDOS</td><td><input name="MySecond" type="text" value="<%=MySecond%>" style="width: 208px" /></td></tr>
<tr><td colspan="2" class="MyTd"><input type="submit" name="Submit" value="Update" /></td></tr>
</table></form>
<a href="Q_24801116.asp">Go back to Insert (or) Delete Records</a>
<%else%>

<form action="setRecords.asp" method="post">
<table style="width: 373px">
<tr><td colspan="2"  class="MyTdTop">INSERTAR DATOS A BASE DE DATOS</td></tr>
<input type="hidden" name="MyRecord" value="Insert" />
<tr><td class="auto-style3">MI NOMBRE</td><td class="auto-style2"><input name="MyFirst" type="text" /></td></tr>
<tr><td class="auto-style3">MI APELLIDO</td><td class="auto-style2"><input name="MySecond" type="text" /></td></tr>
<tr><td colspan="2" class="MyTd"><input type="submit" name="Submit" value="Insert" /></td></tr>
</table></form>
    </div>
    <div class="col-sm-4">
      <h3>BORRAR</h3>
     <form action="setRecords.asp" method="post">
<table class="auto-style4">
<tr><td colspan="2"  class="MyTdTop">BORRAR DATOS DE BASE DE DATOS</td></tr>
<input type="hidden" name="MyRecord" value="Delete" />
<tr><td class="auto-style7">SELECCIONA UN DATO</td><td class="auto-style6">
<%'We are going to get the Values from the database and put them in a Dropdown (ListMenu) and so we can choose the item that we want to Delete%>
<select name="DelCom" style="font: 8pt verdana;">
<option value="">Choose a Record</option>
<%
if not objRs.eof then									  
While (NOT objRs.EOF)
%>
<option value="<%=objRs("ID")%>"><%=objRs("NOMBRE")&" "&objRs("APELLIDOS")%></option>
<%
  objRs.MoveNext()
Wend
If (objRs.CursorType > 0) Then
  objRs.MoveFirst
Else
  objRs.Requery
End If
End if
%>
</select></td></tr>
<tr><td colspan="2" class="MyTd"><input type="submit" name="Submit" value="Delete" /></td></tr>
</table></form>
    </div>
    <div class="col-sm-4">
      <h3>LISTADO DE DATOS</h3>        
     <%End if%>
<%'Here we are going to list all the Records in the Database, so we can then choose the one that we want to edit (UPDATE)
'This also will show you how to loop through the records and display all them to the page.%>
<table class="auto-style8">
<caption>SELECCIONA UN REGISTRO PARA ACTUALIZAR</caption>
  <tr>
    <td class="MyTdTop">ID</td>
    <td class="MyTdTop">Names</td>
  </tr>
   <%While Not objRs.EOF%>
  <tr>
 
    <td class="MyTd"><%=objRS("ID")%></td>
    <td class="MyTd"><a href="?Update=<%=objRS("ID")%>"><%=objRS("NOMBRE")&" "&objRs("APELLIDOS")%></a></td>
  </tr>
  
  <%' Always close out of your RecordSets and your DB Connection after you are finished with them, and no longer ar in need of them.
    objRs.MoveNext
    Wend
    objRs.Close
    Set objRs=Nothing
	objConn.close
	set objConn = nothing
%>
</table>
    </div>
  </div>
</div>

</body>
</html>

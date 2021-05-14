<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%' The above line, only goes in this file, and this file MUST BE the 1 INCLUDE FILE of every page that needs to have database connection.

' This page contains the link to the ADOVBS.inc file, which contains all your Parameters
' This is very important in the battle to combact SQL Injection.
%>
<!--#include file="ADOVBS.inc"-->
<%' This is our Connections string. Using Access Databse, we want to make it as Fast as Possible, so we use the: JET Engine.
Set objConn = CreateObject("ADODB.Connection")'TIPO DE CONEXION
objConn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & _ 
Server.MapPath ("MI_DATA.mdb") & ";"
objConn.Open
%>

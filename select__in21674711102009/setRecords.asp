<!--#include file="cons.asp"-->
<%
'Here we have all of our database statements. We keep them in a single page and choose which one that we wish to use by using a simple IF STATEMENT. Using the IF statement, we can have multiple statements in the same page, this cuts down on the paper trail and makes it easier to work with. 

'Always keep everything together, and put other items in other places, like for Example: our database connection is in a file called cons.asp which stands for: Connections

'The Parameters that we are using here will help in the combat against SQL INJECTION and also makes for a better code presentation for yourself and future developers that will come in later on to work with your code.

'Using Parameters makes sure that you set them in order. For Example
'UpCom.CommandText = "Update Teaching set [MyFirst]=?, [MySecond]=? WHERE ID=?"
'UpCom.Parameters.Append UpCom.CreateParameter("@MyFirst", adChar, adParamInput, 255, UpF)
'UpCom.Parameters.Append UpCom.CreateParameter("@MySecond", adChar, adParamInput, 255, UpS
'UpCom.Parameters.Append UpCom.CreateParameter("@ID", adInteger, adParamInput, , UpID)

'In the above, each line corresponds with the way it is presented in the statement, make sure that you do not get them mixed up, as you can mess up your records (Or) it will generate an error.

'I am pretty sure that you will grasp the concept here. It is easy to use and understand.
'The file ADOVBS.inc holds the values for all the Parameters  that are located in your statements CreateParameter.

'Good Luck
'Carrzkiss (Wayne Barron – Carrz-Fox-Fire Promotions)


'====================================================================================================
if request.Form("MyRecord")="Delete" then
Set DelCom=Server.CreateObject("ADODB.Command")
DelCom.ActiveConnection=objConn
Del = Int(request.form("DelCom"))
DelCom.CommandText = "DELETE FROM INFORMACION WHERE ID=?"
DelCom.Parameters.Append DelCom.CreateParameter("@ID", adInteger, adParamInput, , Del)
DelCom.Execute
response.Write"Record Deleted Successfully!<br /><a href=""Q_24801116.asp"" />Go Back to main page</a>"
end if

' To update an item we do this
if request.Form("MyRecord")="Update" then
Set UpCom=Server.CreateObject("ADODB.Command")
UpCom.ActiveConnection=objConn
UpF = Trim(request.Form("MyFirst"))
UpF = replace(UpF,"'","''") ' Replace all single Quotes with double quotes for insert
UpS = Trim(request.Form("MySecond"))
UpS = replace(UpS,"'","''")
UpID = Int(request.Form("MyID"))
UpCom.CommandText = "Update INFORMACION set [NOMBRE]=?, [APELLIDOS]=? WHERE ID=?"
UpCom.Parameters.Append UpCom.CreateParameter("@MyFirst", adVarChar, adParamInput, 255, UpF)
UpCom.Parameters.Append UpCom.CreateParameter("@MySecond", adVarChar, adParamInput, 255, UpS)
UpCom.Parameters.Append UpCom.CreateParameter("@ID", adInteger, adParamInput, , UpID)
UpCom.Execute
response.Write"Record Updated Successfully!<br /><a href=""Q_24801116.asp"" />Go Back to main page</a>"
end if

' To insert an item we do this
if request.Form("MyRecord")="Insert" then
Set InsCom=Server.CreateObject("ADODB.Command")
InsCom.ActiveConnection=objConn
InsF = Trim(request.Form("MyFirst"))
InsF = replace(InsF,"'","''")
InsS = Trim(request.Form("MySecond"))
InsS = replace(InsS,"'","''")
InsCom.CommandText = "Insert into Teaching(MyFirst, MySecond)Values(?,?) "
InsCom.Parameters.Append InsCom.CreateParameter("@MyFirst", adVarChar, adParamInput, 255, InsF)
InsCom.Parameters.Append InsCom.CreateParameter("@MySecond", adVarChar, adParamInput, 255, InsS)
InsCom.Execute
response.Write"Record Inserted Successfully!<br /><a href=""Q_24801116.asp"" />Go Back to main page</a>"
end if
%>

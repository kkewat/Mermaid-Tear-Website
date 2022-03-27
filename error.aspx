<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error!!</title>
    <style>
        div {
            height: 200px;
            width: 400px;
        }

        .container {
            min-height: 10em;
            display: table-cell;
            vertical-align: middle;
            font-family:'Times New Roman';
            color:crimson;
            
        }
    </style>
</head>
<body>
<center>
    <form id="form1" runat="server">
        <div>
            <div class="container" style="vertical-align:middle">
            <span style="font-size:24px"><b>
            <p >Something Went Wrong!!!</p>
            <p>Please Try Again!!!</p></b>
            </span>
            </div>
        </div>
    </form>
</center>
</body>
</html>

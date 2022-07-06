<%-- 
    Document   : UpdateUser
    Created on : 29/05/2022, 8:38:23 PM
    Author     : duynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="library/jquery.min.js" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

        <style>
            body{
                background-color: #212A37;
            }
            .mainform{
                position: relative;
                display: block;
                width: 500px;
                height:auto;
                margin-top: 100px;
                margin-left: 30%;
                background:#111720;
                border-radius: 25px;
                padding-bottom:20px;
            }
            td{color:white;}
            .update-title{
                text-align: center;
                color:white;
            }
            input[type=text]{
                margin-bottom: 20px;
                width: 100%;
                overflow:hidden;
            }
            .move-content{
                align-content: center;
                display: block;
                margin-left: 50%;
            }
            input[type=date]{
                margin-bottom: 20px;
            }
        </style>
        <<script>
            function returntoUser(){
                location.replace("viewProfile");
            }
        </script>
    </style>
    <title>JSP Page</title>
</head>
<body>
    <div class ="container">
        <div class ="header">
            <script>

                ('#category').mouseenter(function () {
                    $("#navigation").slideDown();
                });
                $("#navigation").mouseleave(function () {
                    ("#navigation").slideUp();
                });
            </script>
            <jsp:include page='../../resource/components/category.jsp'/>
        </div>
        <div class="mainform"><div class ="update-title"><h1>Update Information</h1></div>
            <form action="updateUser" action="post" class="fix-form">
                <table>
                    <tr>
                        <td class="move-content">Display name : <input type="text" value="${userAccount.getDisplayname()}"></td>
                    </tr>
                    <tr>
                        <td class="move-content">Gender: <input type="text" value="${userAccount.getGender()}"></td>    
                    </tr>
                    <tr>
                        <td class="move-content">Date of Birth: <input type="date" value="${userAccount.getDob()}"></td>
                    </tr>
                    <tr>
                        <td class="move-content"><input type="button" value="Cancel" onclick="returntoUser()"/> <input type="submit" value="Save"/></td> 
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>

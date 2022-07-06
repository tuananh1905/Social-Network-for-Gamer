<%-- 
    Document   : userProfile
    Created on : 27/05/2022, 7:14:56 AM
    Author     : duynh
--%>

<%@page import="modal.Friend"%>
<%@page import="modal.Post"%>
<%@page import="modal.Game"%>
<%@page import="modal.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile</title>
        <link href="library/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="library/bootstrap.min.js" type="text/javascript"></script>
        <script src="library/jquery.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type ="text/css" href="resource/css/userProfile.css">
        <script type="text/javascript" src="js/mainFunction.js"></script>
        <style>

            /*
            To change this license header, choose License Headers in Project Properties.
            To change this template file, choose Tools | Templates
            and open the template in the editor.
            */
            /* 
                Created on : 27/05/2022, 7:22:51 AM
                Author     : duynh
            */
            body{
                background-color: #212A37;
            }
            /*Profile container*/
            .display-Profile{
                grid-area: Profiles;
                position: relative ;
                display: block;
                width: 450px;
                height:350px;
                background: #111720;
                float:left;
                border-radius: 25px;
                top:70px;
                right:100px;
            }

            /*Product container*/
            .display-product{
                grid-area:Products;
                position: relative ;
                display: block;
                width: 450px;
                height:350px;
                background: #111720;
                float:left;
                border-radius: 25px;
                top:90px;
                right:95px;
            }


            /*Post container*/
            .display-post{
                grid-area:Posts;
                position: relative;
                display: block;
                width: 500px;
                height:auto;        
                top: 70px;
                right:50px;
                background:#111720;
                border-radius: 25px;

            }

            /*Game container*/
            .display-game{
                grid-area:Games;
                position: relative;
                display: block;
                width: 450px;
                height:350px;
                right:15px;
                top: 70px;
                background: #111720;
                float:right;
                border-radius: 25px;
            }

            /*Friend container*/
            .display-friend{
                grid-area:Friends;
                position: relative;
                display: block;
                width: 450px;
                height:350px;
                top:85px;
                right: 15px;
                background: #111720;
                float:right;
                border-radius: 25px;
            }

            /*view User container*/
            .container{
                display: grid;
                width: 100%;
                grid-template-column: repeat(3,1fr);
                grid-template-row:auto;
                gap:5px;
                grid-template-areas:
                    "Profiles Posts Games"
                    "Profiles Posts Games"
                    "Products Posts Friends"
                    "Products Posts Friends"
                    ".  Posts ."
                    ".  Posts ."
                    ".  Posts ."
                    ".  Posts ."
                    ".  Posts ."
                    ;
            }



            .userinfo{
                display: flex; 
                align-content: center;
                float: left;
                padding-right:10%;
                border-radius: 25px;

            }

            .userinfo .infono1{
                display: block;
                height: 10%;
                width: 200px;
                border-radius: 15px;
                margin-top: 20px;
            }

            .userinfo .infono1 h4{
                color:white;
                font-family: sans-serif;
                font-weight: 100;
                font-size: 20px;

            }

            .profile-container{
                float:right;
                margin-right: 10%;
                margin-top: 5%;

            }

            .display-Profile .user-Avatar .user-pic{
                display: block;
                position: relative;
                float: left;
                margin-top: 18%;
                margin-left: 7%;
                margin-right: 3%;
                overflow-x: hidden;
                border-radius: 50%;
                width: 150px;
                height: 150px;
            }
            .display-Profile .user-Avatar .user-pic img{
                object-fit: contain;
                height: 100%;
                width: 100%;
                cursor: pointer;

            }
            .display-friend .friendPic{
                display: block;
                position: relative;
                float: left;
                margin-top: 20%;
                margin-left: 10%;
                margin-right: 5%;
                overflow-x: hidden;
                border-radius: 50%;
                width: 100x;
                height: 100px;
            }


            .display-friend .friendPic img{
                object-fit: contain;
                height: 100%;
                width: 100%;

            }

            .display-game .display-title{
                margin-top: 10px;
                margin-left: 20px;
                font-weight: bold;
                font-family: sans-serif;
                color:white;
            }


            .display-Profile .user-pic input[type = file]{
                -webkit-user-select: none;
                display: inline-block;
                outline: none;
                font-weight: 700;
                font-size: 10pt;

            }
            .display-friend .friend-title{
                margin-top: 10px;
                margin-left: 20px;
                font-weight: bold;
                font-family: sans-serif;
                color:white;
            }

            .display-friend .friend-container{
                display: inline-block;
                position: relative;
                margin-right: 10px;

            }


            .display-friend .friend-container .friendPic{
                display:inline;
                position: relative;
                margin-top: 20px;
                margin-left: 20px;
            }
            .display-friend .friend-container .friendname{
                display: block;
                text-align: center;
                color:white;

            }
            .display-friend .seeMore{
                float:right;
                margin-right: 20px;
                margin-top: 10px;

            }

            .display-friend .seeMore a{
                text-decoration: none;
                display: block;
                font-size: 20px;
            }

            .display-friend .seeMore a:hover{
                text-decoration: underline;
                display: block;
            }

            .display-game .game-container{
                display: inline-block;
                position: relative;
                text-align: center;
                margin-right: 10px;
                padding-left: 5%;


            }
            .gamePic{
                display: block;
                position: relative;
                float: left;
                margin-top: 10%;
                margin-left: 6%;
                margin-right: 5%;
                overflow-x: hidden;
                width: 150px;
                height: 150px;
            }
            .gamename{
                display: block;
                text-align: center;
                color:white;
                padding-left: 2%;
            }
            .display-game .gamePic img{
                object-fit: contain;
                height: 100%;
                width: 100%;

            }

            .display-Profile .user-pic .user-pic-UpdateTable{
                display: relative;
                border-radius: 25px;
                background-color:white;
            }
            .list-product{
                margin-top:30px;
                display: block;
                position: relative;
                overflow-y: scroll;
                background-color:#48494a;
                margin-left: 30px;
                margin-right: 30px;
                height: 270px;
            }
            .post-container{
                margin-top:30px;
                display: block;
                position: relative;
                overflow-y: scroll;
                background-color:#48494a;
                margin-left: 30px;
                margin-right: 30px;
                height: 90%;
            }

            .friendname a{
                color:white;
                text-decoration: none;
            }

            .friendname a:hover{
                color:white;
                text-decoration: underline;
                font-weight: bold;
            }

        </style>
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
            <div class="display-Profile">
                <div class="user-Avatar">
                    <div class="user-pic" id="picture" onclick="Opentable" enctype="multipart/form-data">
                        <c:set value= "${userAccount.getAvatar()}" var="userAvatar"></c:set>                            
                        <c:choose>
                            <c:when test="${userAvatar == null}"> <img src="<c:url value="resource/img/istockphoto-1206037167-612x612.jpg"></c:url>"> </c:when>
                            <c:otherwise><img src="data:image/jpeg;base64,${userAccount.getAvatar()}"/></c:otherwise>
                        </c:choose>
                        <br>
                    </div>
                </div>
                <div class ="profile-container">
                    <div class ="edit-button">

                    </div>
                    <div class="something">
                        <div class ="userinfo">
                            <div class ="infono1"><<h4>${userAccount.getDisplayname()}</h4></div>
                        </div>
                        <br>
                        <div class ="userinfo">
                            <div class ="infono1">
                                <c:set var="genderx" value="${userAccount.getGender()}"> </c:set>
                                <c:choose> 
                                    <c:when test="${genderx == 1}"> <h4>Female</h4></c:when>
                                    <c:when test="${genderx == 0}"> <h4>Male</h4></c:when>
                                    <c:otherwise> <h4>${userAccount.getGender()}</h4></c:otherwise>
                                </c:choose>
                            </div>
                        </div><br>
                        <div class ="userinfo">
                            <div class ="infono1">
                                <c:set var="dob" value="${userAccount.getDob()}"> </c:set>
                                <c:choose> 
                                    <c:when test="${dob == null}"> <h4>dd/MM/yyyy</h4></c:when>
                                    <c:otherwise> <h4><fmt:formatDate type = "date" value = "${userAccount.getDob()}"/></h4></c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <br>
                        <div class ="userinfo">                       
                            <div class ="infono1"><h4>Posted:
                                <c:set var="x" value="${totalpost}"></c:set>
                                <c:choose>
                                    <c:when test="${x<100}">${totalpost}</c:when>
                                    <c:otherwise>99+</c:otherwise>
                                </c:choose></h4>
                            </div>
                                </div><br>
                        <div class ="userinfo">
                            <c:choose> 
                                <c:when test="${user.getID() == friend.getUserID2().getID()}"> </c:when>
                                <c:otherwise><a href ="updateUser">Edit</a></c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
            <div class ="display-product">
                <div class = "Product-container">   
                    <c:choose>  
                        <c:when test="${userProduct == null}"><div class="no-product"> <h3 style="align-content: center;text-align: center;color:#ffffff;margin-left: 30px;margin-right:30px;margin-top: 150px">User dont have any product for sale </h3></c:when>
                            <c:otherwise>   
                                <div class="list-product">         
                                    <ul>
                                        <c:forEach var="product" items="userProduct"> 
                                            <li>hi</li><br>    
                                            </c:forEach>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class ="display-post">
                <div class="post-container">

                </div>
            </div>
            <div class ="display-game">
                <div class="display-title"><h1>Game</h1></div>
                <c:choose>
                    <c:when test="${gamelist eq null}"><h1 style="color:white; text-align: center;">Find more game</h1> </c:when>
                    <c:otherwise>
                        <c:forEach var="game" end="3" items="${gamelist}">
                            <div class ="game-container">
                                <span class = "gamePic">
                                    <c:choose>
                                        <c:when test="${game.getImage()==null}">
                                            <img src ="<c:url value="resource/img/game-icon.png"></c:url>">
                                        </c:when>
                                        <c:otherwise> 
                                            <img src="data:image/jpeg;base64,${game.getImage()}">
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <div class = "gamename">
                                    ${game.getName()}
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

            </div>

            <div class ="display-friend">
                <div class="friend-title"><h1>Friends <small>${countFriend}</small><span class="seeMore"><a href="GetAllFriendList">See more</a></span></h1>
                </div>
                <c:choose>
                    <c:when test="${countFriend == 0}"><h1 style="color:white; text-align: center;">Please make more friends</h1></c:when>
                    <c:otherwise>
                        <c:forEach items="${friendlist}" var="friend" end="4">                    
                            <div class="friend-container">
                                <span class="friendPic">
                                    <c:choose>
                                        <c:when test="${friend.getUserID2().getAvatar() == null}"> <img src="<c:url value="resource/img/istockphoto-1206037167-612x612.jpg"></c:url>"> </c:when>
                                        <c:otherwise> <img src="data:image/jpeg;base64,${friend.getUserID2().getAvatar()}"/> </c:otherwise>
                                    </c:choose>
                                </span>
                                <div class="friendname">
                                    <c:url var="userProfile" value="viewProfile">  
                                        <c:param name="id" value="${friend.getUserID2().getID()}">

                                        </c:param>
                                    </c:url>
                                    <a href="${userProfile}">${friend.getUserID2().getDisplayname()}</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>

</body>
</html>

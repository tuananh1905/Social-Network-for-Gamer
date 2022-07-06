<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />

        <title>Admin</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <link href="<c:url value="library/bootstrap.min.css"></c:url>" rel="stylesheet" id="bootstrap-css">
        <script src="<c:url value="library/bootstrap.min.js"></c:url>"></script>
        <script src="<c:url value="library/jquery.min.js"></c:url>"></script> 
        <script src="<c:url value = "resource/js/admin.js"/>" type="text/javascript"></script>
        <link href="<c:url value = "resource/css/admin.css"/>" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>

        <script>
            $('#header').mouseenter(function () {
                $("#navigation").slideDown(250);

            });
            $("#header").mouseleave(function () {
                $("#navigation").slideUp(250);
            });
        </script>
        <style>
            .box-icon-chat {
                position: relative;
            }
            #numberOfNewMsg{
                position: absolute;
                top: 1px;
                right: 22px;
                font-size: 12px;
                background-color: white;
                border-radius: 5px;
                width: 16px;
            }
        </style> 

    </head>

    <body style="background-color: #212A37;">
        <%@include file ="../../resource/components/category.jsp" %>
        <div class="container-fluid h-90" style="margin-top: 100px;">
            <div class="row justify-content-center h-100">
                <div class="col-sm-3 col-md-3 col-lg-3">
                    <div class="navbar_admin_left">
                        <ul class="list-group manage_box">
                            <li class="list-group-item manage_item"><a>Statistic</a></li>
                            <li class="list-group-item manage_item" onclick="selectManage(2)"><a >Manage type of game</a></li>
                            <li class="list-group-item manage_item"><a>Manage report</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-9 col-md-8 col-lg-9">
                    <div id="content" class="content_admin_right">

                    </div>
                </div>
            </div>
        </div>  
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 id="titlePopup" class="modal-title">Modal Heading</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div  id="formContent"class="modal-body">

                    </div>

                    <!-- Modal footer -->
                    <div id="modalFooter"class="modal-footer">
                        <button type="button" class="btn btn-danger" id="closeBtn" data-bs-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>

    </body>



    <!--===============================================================================================-->



</html>

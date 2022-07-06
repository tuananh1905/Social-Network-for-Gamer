<%-- 
    Document   : Purchase
    Created on : Jun 7, 2022, 3:04:23 PM
    Author     : LENNOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel= "stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
        <link href="library/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="library/bootstrap.min.js" type="text/javascript"></script>
        <script src="library/jquery.min.js" type="text/javascript"></script>

    </head>
    <body style="background-color: #212A37;">

        <div>
            <jsp:include page='../../resource/components/category.jsp'/>
        </div>

        <div class="purchase-box row" id="purchase" style="margin-top: 7%; text-align: center">
            <div class="col-md-2">
                <jsp:include page='../../resource/components/PopUpCreateProduct.jsp'/>
                <form action="viewpurchase" method="GET">
                    <div class="container mt-3" style="margin-top: 6%" id="slt">
                        <div style="text-align: left;">
                            <a style="color: Red; text-align: left; font-size: 16px">Search Product By:</a>
                        </div>

                        <select class="form-select" name="selectid" id="selectsortproduct">
                            <option value="${search}" hidden>${search}</option>
                            <option value="Price Decrease">Price Decrease</option>
                            <option value="Price Increase">Price Increase</option>
                            <option value="Oldest">Oldest </option>
                            <option value="Newest">Newest </option>
                        </select>

                        <div style="text-align: left; margin-top: 10px">
                            <a style="color: Red; text-align: left; font-size: 17px">Price:</a>
                        </div>  
                        <div >
                            <table>
                                <tr>

                                <div style="display: flex; width: 90%; margin-right: 10px;">
                                    <td>
                                        <div style="text-align: left;">
                                            <a style="color: Red; text-align: left; font-size: 16px">From:</a>
                                        </div>
                                    </td>
                                    <td>
                                        <select class="form-select" name="pricefrom" style="font-size: 14px">
                                            <option value="${pricefrom}" hidden>${pricefrom}$</option>
                                            <option value="0">0$</option>
                                            <option value="100">100$</option>
                                            <option value="250">250$</option>
                                            <option value="1000">1000$</option>
                                            <option value="5000">5000$</option>
                                        </select>
                                    </td>
                                </div>

                                </tr>
                                <tr>

                                <div style="display: flex; width: 90%">
                                    <td>
                                        <div style="text-align: left;">
                                            <a style="color: Red; text-align: left; font-size: 16px">To:</a>
                                        </div>
                                    </td>
                                    <td>
                                        <select class="form-select" name="priceto" style="font-size: 14px">
                                            <option value="${priceto}" hidden>${priceto}$</option>
                                            <option value="100">100$</option>
                                            <option value="250">250$</option>
                                            <option value="1000">1000$ </option>
                                            <option value="5000">5000$</option>
                                            <option value="More than 5000">More than 5000$</option>
                                        </select>
                                    </td>
                                </div>

                                </tr>
                            </table>>
                        </div>
                    </div>

                    <button id="searchbutton" style="background: #3AAA23; color: white; border: 1px solid white; width: 50%; padding: 5px 0">Search</button>
                </form>
            </div>

            <div style="color: white" class="col-md-10 row" id="result1"> 
                <c:forEach items="${p}" var="listP">
                    <div class="col-md-2 product" id="cardproduct_${listP.purID}">
                        <div class="image" style="" id="imageGame${listP.purID}">

                            <div style="text-align: right;">
                                <div class="dropdown">

                                    <i data-toggle="dropdown" type="button" class="fa fa-ellipsis-v" style="position:absolute ; margin-top: 7px;"></i>

                                    <div class="dropdown-menu" >
                                        <c:if test="${sessionScope.account.ID==listP.userID}">
                                            <a onclick="UpdateProduct(${listP.purID})" data-bs-toggle="modal" data-bs-target="#exampleModal" class="dropdown-item" href="">Update/Edit</a>
                                            <a onclick="DeleteProduct(${listP.purID})" data-bs-toggle="modal" data-bs-target="#modalConfirmDelete" class="dropdown-item" href="">Remove</a>
                                        </c:if>
                                        <c:if test="${sessionScope.account.ID!=listP.userID}">
                                            <a class="dropdown-item">Report</a>
                                        </c:if>
                                    </div>

                                </div>

                            </div>

                            <c:forEach items="${g}" var="listG">
                                <c:if test="${listG.ID == listP.gameID}">
                                    <img src="data:image/jpeg;base64, ${listG.image}" style="width: 100%; height: 100%; margin: 5px 0">
                                </c:if>
                            </c:forEach>

                        </div>
                        <div class="body-content">
                            <div class="" style="display: flex; justify-content: space-between">
                                <div class="content">

                                    <c:forEach items="${u}" var="listU">
                                        <c:if test="${listU.ID == listP.userID}">
                                            <p>Seller: ${listU.displayname}</p>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <div class="content"id="priceProduct${listP.purID}" >
                                    <p>Price: ${listP.price}$<p>

                                </div>
                            </div>

                            <div class="">
                                <div class="content" style="text-align: left">
                                    <p>Release Day: ${listP.time}</p>
                                </div>
                            </div>
                            <div class="">
                                <div class="nameProduct" style="text-align: left"id="nameProduct${listP.purID}">
                                    Product Name: ${listP.name}
                                </div>
                            </div>
                        </div>
                        <div class="purchase-button row" style="text-align: center; margin-bottom: 10px; margin-top: 10px">
                            <div style="display: flex">
                                <a style="background: #3AAA23; color: white;text-decoration: none; border: 1px solid white; padding: 5px 5px 5px 5px; width: 90%; margin-right: 5px" href="chat?id=${listP.userID}">
                                    Contact
                                </a>
                                <button onclick="detailProduct(${listP.purID})" id="detail" data-bs-toggle="modal" data-bs-target="#detailModal" style="margin-left: 5px;background: #3AAA23; color: white; border: 1px solid white; padding: 5px 5px 5px 5px;width: 90%">
                                    Detail
                                </button>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" id="contentModalProduct">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">${sessionScope.account.displayname}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <label>Name Product: </label>
                        <input class="form-control" id="nameProduct" name="nameProduct" rows="3">
                        <label>Description: </label>
                        <input class="form-control" id="description" name="description" rows="3">
                        <label>Price: </label>
                        <input class="form-control" id="price" name="price" rows="3">

                        <label class="mt-3">Choose Image: </label>
                        <input type="file" name="photo"id="uploadImage"multiple="true" size="50" onchange="loadFile()"/>
                        <div id="images" class="mt-3">

                        </div>
                        Type of game: <div id="selectGame" ></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>
                        <button id="btnUpdateProduct" class="btn btn-primary" >Save</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal" tabindex="-1" id="modalConfirmDelete">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you want to delete this product ?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="confirmDelete">Delete</button>
                    </div>
                </div>
            </div>
        </div>              
        <!--show detail product-->
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <span id="result"></span>
                </div>
            </div>
        </div>

        <!--pagination-->
        <div style="margin-left: 42%; margin-top: 10px; position: fixed" id="page"> 
            <nav  style="background: transparent">
                <ul class="pagination" >
                    <li style="border:1px solid red"><a style="background: black; color: red; border: none" class="page-link" href="?page=1&selectid=${search}&pricefrom=${pricefrom}&priceto=${priceto}">First</a></li>
                        <c:if test="${page!=1}">
                            <c:if test="${page!=2}">
                            <li style="border:1px solid red; margin: 0 5px;"><a id="pagenext" style="background: black; color: red; border: none" class="page-link" href="?page=${page-2}&selectid=${search}&pricefrom=${pricefrom}&priceto=${priceto}">${page-2}</a></li>
                            </c:if>
                        <li style="border:1px solid red; margin: 0 5px;"><a id="pagenext" style="background: black; color: red; border: none" class="page-link" href="?page=${page-1}&selectid=${search}&pricefrom=${pricefrom}&priceto=${priceto}">${page-1}</a></li>
                        </c:if>
                    <li style="border:1px solid red; margin: 0 5px;"><a style="background:white ; color: red; border: none" class="page-link" href="?page=${page}&selectid=${search}&pricefrom=${pricefrom}&priceto=${priceto}">${page}</a></li>
                        <c:if test="${page != totalpage}">
                        <li style="border:1px solid red; margin: 0 5px;"><a id="pagenext" style="background: black; color: red; border: none" class="page-link" href="?page=${page+1}&selectid=${search}&pricefrom=${pricefrom}&priceto=${priceto}">${page+1}</a></li>
                        </c:if>
                        <c:if test="${page != (totalpage-1) && page != totalpage}">
                        <li style="border:1px solid red; margin: 0 5px;"><a id="pagenext" style="background: black; color: red; border: none" class="page-link" href="?page=${page+2}&selectid=${search}&pricefrom=${pricefrom}&priceto=${priceto}">${page+2}</a></li>
                        </c:if>
                    <li style="border:1px solid red"><a style="background: black; color: red; border: none" class="page-link" href="?page=${totalpage}&selectid=${search}&pricefrom=${pricefrom}&priceto=${priceto}">Last</a></li>
                </ul>
            </nav>
        </div>
        <script>

        </script>

        <script>
            $('#header').mouseenter(function () {
                $("#navigation").slideDown(250);

            });
            $("#header").mouseleave(function () {
                $("#navigation").slideUp(250);
            });
            function detailProduct(id) {

                $.ajax({
                    type: 'POST',
                    url: 'viewpurchase',
                    data: {productID: id},
                    success: function (data) {
                        //                        $('#result').html(result);
                        console.log(data);

                        var html = "";
                        html += "                    <div class=\"modal-header\">\n"
                                + "                        <h5 class=\"modal-title\" style=\"font-size:25px\" id=\"exampleModalLabel\">Detail Information Of Product</h5>\n"
                                + "                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n"
                                + "                    </div>\n"
                                + "                    <div class=\"modal-body\">\n"
                                + "                        <div class=\"container\">\n"
                                + "                            <div class=\"card\">\n"
                                + "                                <div class=\"container-fliud\">\n"
                                + "                                    <div class=\"wrapper row\">\n"
                                + "                                        <div class=\"preview col-md-6\">\n"
                                + "<div id=\"carouselExampleControls\" class=\"carousel slide\" data-bs-ride=\"carousel\">\n"
                                + "  <div class=\"carousel-inner\">\n"
                                + "    <div class=\"carousel-item active\">\n"
                                + "<img class=\"d-block w-100\" alt=\"...\" style=\"width:100%;height:384px\"src=\"data:image/jpeg;base64," + data.images[0] + "\">\n"
                                + "    </div>\n";
                        for (let i = 1; i < data.images.length; i++) {
                            html += "<div class=\"carousel-item\">\n"
                                    + "<img class=\"d-block w-100\" alt=\"...\" style=\"width:100%;height:384px\"src=\"data:image/jpeg;base64," + data.images[i] + "\">\n"
                                    + "    </div>"
                        }
                        html +=
                                "  </div>\n"
                                + "  <button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"prev\">\n"
                                + "    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n"
                                + "    <span class=\"visually-hidden\">Previous</span>\n"
                                + "  </button>\n"
                                + "  <button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"next\">\n"
                                + "    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n"
                                + "    <span class=\"visually-hidden\">Next</span>\n"
                                + "  </button>\n"
                                + "</div>"
                                + "                                        </div>\n"
                                + "                                        <div class=\"details col-md-6\">\n"
                                + "                                            <h3 class=\"product-title\">" + data.name + "</h3>\n"
                                + "                                            <p class=\"release-date\">Release Date:" + data.time + "</p>\n"
                                + "                                            <p class=\"product-description\">" + data.description + "</p>\n"
                                + "                                            <h4 class=\"price\">Current price: <span>" + data.price + "$</span></h4>\n"
                                + "                                        </div>\n"
                                + "                                    </div>\n"
                                + "                                </div>\n"
                                + "                            </div>\n"
                                + "                        </div>\n"
                                + "                    </div>\n"
                                + "<div class=\"modal-footer action\">\n"
                                + "        <a class=\"contact-chat btn btn-default\" type=\"button\" href=\"chat?id=" + data.userID + "\">Contact</a>\n"
                                + "      </div>"
                        document.getElementById('result').innerHTML = html;
                    }
                });
            }
            function UpdateProduct(id) {
                $.ajax({
                    type: 'GET',
                    url: "UpdateProduct",
                    data: {productID: id},
                    success: function (data) {
                        //$('#showtoupdate').html(html);

                        //                        var html = "<form enctype=\"multipart/form-data\">\n" +
                        //                                "                        <div class=\"modal-header\">\n" +
                        //                                "\n" +
                        //                                "                            <input type=\"hidden\" name=\"uID\" value=\"" + data.UserID + "\"/>\n" +
                        //                                "                            <h4 class=\"modal-title\">" + data.UserID + "</h4>\n" +
                        //                                "                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\"></button>\n" +
                        //                                "                        </div>\n" +
                        //                                "                        <div class=\"modal-body\">\n" +
                        //                                "                            <label>Name Product: </label>\n" +
                        //                                "                            <input class=\"form-control\" id=\"nameProduct\" name=\"nameProduct\"value=\"" + data.name + "\" rows=\"3\">\n" +
                        //                                "                            <label>Description: </label>\n" +
                        //                                "                            <input class=\"form-control\" id=\"description\" name=\"description\"value=\"" + data.description + "\" rows=\"3\">\n" +
                        //                                "                            <label>Price: </label>\n" +
                        //                                "                            <input class=\"form-control\" id=\"price\" name=\"price\"value=\"" + data.price + "\" rows=\"3\">\n" +
                        //                                "\n" +
                        //                                "                            <label class=\"mt-3\">Choose Image: </label>\n" +
                        //                                "                            <input type=\"file\" name=\"photo\"id=\"uploadImage\"multiple=\"true\" size=\"50\" onchange=\"loadFile()\"/>\n" +
                        //                                "                            <div id=\"images\" class=\"mt-3\">\n" +
                        ////                                "\n" + "<img style=\"width:50px\"src=\"" + data.images + "\">\n" +
                        //                                "                            </div>\n" +
                        //                                "\n" +
                        //                                "                        </div>\n" +
                        //                                "                        <div class=\"modal-body\">\n" +
                        //                                "                            Type of game: <div id=\"selectGame\" ></div>\n" +
                        //                                "                           \n" +
                        //                                "                        </div>\n" +
                        //                                "<div class=\"modal-footer\">\n" +
                        //                                "<button id=\"creatPostbutton\"class=\"btn\">Save</button></div>\n"
                        let text = "";
                        for (let i = 0; i < data.images.length; i++) {
                            text += "<img style=\"width:50px\"src=\"data:image/jpeg;base64," + data.images[i] + "\">\n"
                        }
                        var listOptionGame = "";
                        listOptionGame += "<select name=\"gID\" id=\"gID\">";
            <c:forEach items="${g}" var="ga">
                        var gId = '${ga.getID()}'
                        var gName = '${ga.name}'
                        var selected = gId == data.gameID ? "selected='selected'" : ""
                        listOptionGame += "<option " + selected + "  value=" + gId + ">" + gName + "</option>";
            </c:forEach>
                        listOptionGame += "</select>";
                        var html = "";
                        html +=
                                "                    <div class=\"modal-header\">\n" +
                                "                            <input type=\"hidden\" name=\"uID\" value=\"" + data.UserID + "\"/>\n" +
                                "                        <h5 class=\"modal-title\" id=\"exampleModalLabel\">${sessionScope.account.displayname}</h5>\n" +
                                "                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n" +
                                "                    </div>\n" +
                                "                    <div class=\"modal-body\">\n" +
                                "                        <input type=\"hidden\" id=\"productID\" name=\"productID\" value=\"" + data.PurID + "\"/>\n" +
                                "                        <label>Name Product: </label>\n" +
                                "                            <input class=\"form-control\" id=\"nameproduct\" name=\"nameProduct\"value=\"" + data.name + "\" rows=\"3\">\n" +
                                "                            <label>Description: </label>\n" +
                                "                            <input class=\"form-control\" id=\"descriptionProduct\" name=\"description\"value=\"" + data.description + "\" rows=\"3\">\n" +
                                "                            <label>Price: </label>\n" +
                                "                            <input class=\"form-control\" id=\"priceProduct\" name=\"price\"value=\"" + data.price + "\" rows=\"3\">\n" +
                                "\n" +
                                "                            <label class=\"mt-3\">Choose Image: </label>\n" +
                                "                            <input type=\"file\" name=\"photo\"id=\"uploadImage\"multiple=\"true\" size=\"50\" onchange=\"loadFile()\"/>\n" +
                                "                            <div id=\"images\" class=\"mt-3\">\n" +
                                "\n" + text +
                                "                            </div>\n" +
                                "                             Type of game: <div id=\"selectGame\" ></div>\n" + listOptionGame +
                                "                    </div>\n" +
                                "                    <div class=\"modal-footer\">\n" +
                                "                        <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\" id=\"closeModal\">Close</button>\n" +
                                "                        <button class=\"btn btn-primary\" id=\"btnUpdateProduct\">Save</button>\n" +
                                "                    </div>\n"


                        document.getElementById('contentModalProduct').innerHTML = html
                        console.log(data);
                    }
                });

                $(document).ready(function () {
                    $(document).on("click", "#btnUpdateProduct", function () {

                        $.ajax({
                            type: 'POST',
                            url: 'UpdateProduct',

                            data: {
                                "productID": $('#productID').val(),
                                "nameProduct": $('#nameproduct').val(),
                                "description": $('#descriptionProduct').val(),
                                "price": $('#priceProduct').val(),
                                "gID": $('#gID').val(),
                            },
                            success: function () {
                                console.log("update successfuly");

                                var nameProduct = $('#nameproduct').val()
                                document.getElementById("nameProduct" + id).innerHTML = "Product Name: " + nameProduct
                                var priceProduct = $('#priceProduct').val()
                                document.getElementById("priceProduct" + id).innerHTML = "Price: " + priceProduct
                                var GameID = $('#gID').val()
                                var imageGame = ""
            <c:forEach items="${g}" var="listG">
                                var gID = '${listG.ID}'
                                if (gID == GameID) {
                                    imageGame += "<img src=\"data:image/jpeg;base64, ${listG.image}\" style=\"width: 100%; height: 100%; margin: 5px 0\">"
                                }
            </c:forEach>
                                document.getElementById("imageGame" + id).innerHTML = imageGame
                                document.getElementById("closeModal").click();
                            }
                        });
                    });
                });

            }
            function DeleteProduct(id) {

                if ($(document).on('click', '#confirmDelete', function () {
                    $.ajax({
                        type: 'GET',
                        url: 'DeleteProduct',
                        data: {productID: id},
                        success: function () {
                            console.log("delete successfuly")
                            $("#cardproduct_" + id).remove();
                        }
                    });
                }))
                    ;
            }

        </script>
    </script>
    <style>
        html {
            height: 100%;
        }
        body {
            margin:0;
            padding:0;
            font-family: sans-serif;
            /*                overflow-x: hidden;*/
        }
        .body-content{
            box-sizing: border-box;
        }
        .product{
            margin-bottom: 5px; 
            margin-right: 5px; 
            border: 0.5px solid rgba(0,0,0,0.5);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.6);
        }
        .purchase-box{
            font-size: 16px;
        }
        .create-button-product{
            border: 0.5px solid rgba(150,35,50,0.5);
            background: #000000; 
            color: #ff0000;
            margin-top: 9%;
            padding: 5px 5px 5px 5px;
            font-size: 18px;
            border-radius: 10px;
        }
        .nameProduct{
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 200px;
        }
        .nameProduct:hover { 
            overflow: visible;
            width: 500px;
        }
        .nameProductdetail{
            border: 1px;
        }
        img {
            max-width: 100%; }
        .card {
            margin-top: 50px;
            background: #eee;
            padding: 3em;
            line-height: 1.5em; }

        @media screen and (min-width: 997px) {
            .wrapper {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex; } }

        .details {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column; }

        .price {
            font-size: 18px;
            color: red;
        }
        .product-title{
            text-transform: uppercase;
            font-size: 30px;
            font-weight: bold;
        }

        .checked, .price span {
            color: red; }

        .product-title, .product-description, .price{
            margin-bottom: 15px; }

        .product-title {
            margin-top: 0; }
        .product-description{
            font-size: 16px;
        }
        .contact-chat {
            background: #ff9f1a;
            padding: 0.6em 0.9em;
            border: none;
            text-transform: UPPERCASE;
            font-weight: bold;
            color: #fff;
            -webkit-transition: background .3s ease;
            transition: background .3s ease; }
        .contact-chat:hover{
            background: #b36800;
            color: #fff; }
        .release-date{
            color: gray;
            font-style: italic;
            font-size: 12px;
        }
        .page-link{
            
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

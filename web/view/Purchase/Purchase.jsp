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

        <div class="purchase-box row" id="purchase" style="margin-top: 8%; text-align: center">
            <div class="col-md-2">
                <jsp:include page='../../resource/components/PopUpCreateProduct.jsp'/>

            </div>

            <div style="color: white" class="col-md-10 row"> 
                <c:forEach items="${p}" var="listP">
                    <div class="col-md-2 product" id="cardproduct_${listP.purID}">
                        <div class="image" id="imageGame${listP.purID}">
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
                                <div class="content" id="priceProduct${listP.purID}">
                                    <p>Price: ${listP.price}đ<p>

                                </div>
                            </div>

                            <div class="">
                                <div class="content" style="text-align: left">
                                    <p>Release Day: ${listP.time}</p>
                                </div>
                            </div>
                            <div class="">
                                <div class="nameProduct" id="nameProduct${listP.purID}" style="text-align: left">
                                    Product Name: ${listP.name}
                                </div>
                            </div>
                        </div>
                        <div class="purchase-button row" style="text-align: center; margin-bottom: 10px; margin-top: 10px">
                            <div class="col-md-6">
                                <button style="background: #3AAA23; color: white; border-radius: 10px; border: none; padding: 5px 5px 5px 5px">
                                    Contact
                                </button>
                            </div>
                            <div class="col-md-6">
                                <button onclick="detailProduct(${listP.purID})" id="detail" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background: #3AAA23; color: white; border-radius: 10px; border: none; padding: 5px 10px 5px 10px;">
                                    Detail
                                </button>
                            </div>
                            <div class="col-md-6">
                                <button onclick="UpdateProduct(${listP.purID})" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Update
                                </button>      
                            </div>
                            <div class="col-md-6">
                                <button onclick="DeleteProduct(${listP.purID})" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalConfirmDelete">
                                    Delete
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
                        <input type="file" name="photo"id="uploadImage"multiple="true" size="50" onchange="loadFile()" />
                        <div id="images" class="mt-3">

                        </div>
                        Type of game: <div id="selectGame" ></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeModal">Close</button>
                        <button id="btnUpdateProduct" class="btn btn-primary">Save</button>
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

        <span id="result"></span>

        <!--create product-->
        <!--        <form onsubmit="createProduct(event)">
                    <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Create Product</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
        
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Create</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>-->
        <script>
            $('#header').mouseenter(function () {
                $("#navigation").slideDown(250);

            });
            $("#header").mouseleave(function () {
                $("#navigation").slideUp(250);
            });
            function detailProduct(id) {

                $.ajax({
                    type: 'GET',
                    url: 'detailproduct',
                    data: {productID: id},

                    success: function (result) {
                        $('#result').html(result);
                    }
                });
            }
            $(document).on('click', '#btnPopUpMoDal', function () {
                var listOptionGame = "";
                listOptionGame += "<select name=\"gID\" id=\"gID\">";
            <c:forEach items="${g}" var="g">
                listOptionGame += "<option value=${g.ID}>${g.name}</option>";
            </c:forEach>
                listOptionGame += "</select>";

                $('#selectGame').html(listOptionGame);
            });
//            function createProduct(e) {
//                e.preventDefault();
//                var imageList = [];
//                var fileElement = document.getElementById("productImage");
//                console.log(fileElement.files);
//                if (fileElement.files.length != 0) {
//                    for (let i = 0; i < fileElement.files.length; i++) {
//                        var reader = new FileReader();
//
//                        reader.onload = function (e) {
//                            imageList.push(e.target.result);
//                        };
//                        reader.readAsDataURL(fileElement.files[i]);
//                    }
//                }
//                console.log(imageList);
//
////                var dataInp = {
////                    "name": $('#name-product').val(),
////                    "image": $
////                }
//                $.ajax({
//                    type: 'POST',
//                    url: 'createproduct',
//                    data: JSON.stringify({"image": imageList}),
//                    success: function () {
//
//                    }
//                });
//            }
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
                                "                        <button type=\"button\"id=\"closeModal\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\n" +
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
                                document.getElementById("nameProduct"+id).innerHTML = "Product Name: "+nameProduct
                                var priceProduct = $('#priceProduct').val()
                                document.getElementById("priceProduct"+id).innerHTML = "Price: "+priceProduct
                                var GameID =$('#gID').val()
                                var imageGame =""
                                <c:forEach items="${g}" var="listG">
                                var gID = '${listG.ID}'
                                if(gID == GameID){
                                    imageGame+="<img src=\"data:image/jpeg;base64, ${listG.image}\" style=\"width: 100%; height: 100%; margin: 5px 0\">"
                                }
                                </c:forEach>
                                document.getElementById("imageGame"+id).innerHTML = imageGame
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
            function loadFile() {
                var fileEle = document.getElementById("uploadImage");
                var imgagesBox = document.getElementById("images");
                imgagesBox.innerHTML =""
                if (fileEle) {
                    for (let i = 0; i < fileEle.files.length; i++) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                         
                           
                            imgagesBox.innerHTML += '<img style="width:50px"src='+e.target.result+'>';
                        };

                        reader.readAsDataURL(fileEle.files[i]);
                    }

                }
            }
        </script>
        <style>
            html {
                height: 100%;
            }
            body {
                margin:0;
                padding:0;
                font-family: sans-serif;
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
                font-size: 12px;
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
            div.nameProduct {
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;

            }.nameProductdetail{
                border: 1px;
            }
        </style>
    </body>
</html>

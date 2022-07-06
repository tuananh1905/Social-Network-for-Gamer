<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modal.Question"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="library/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="library/bootstrap.min.js" type="text/javascript"></script>
        <link href="resource/css/login.css" rel="stylesheet" type="text/css"/>
        <link href="resource/css/login1.css" rel="stylesheet" type="text/css"/>
        <script src="library/jquery.min.js" type="text/javascript"></script>
        <link href="resource/css/forgetpassword.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="Logo" id="logo" style="display:<c:if test="${message2==null}">block</c:if><c:if test="${message2!=null}">none</c:if>">
                <a style="color: black">Logo</a>
            </div>

                <div class="login-box" style="display:<c:if test="${message2==null}">block</c:if><c:if test="${message2!=null}">none</c:if>" id="login">
                <form action="Login" method="POST" class="row g-3 needs-validation" novalidate>
                    <h2 style="color: White">Welcome!</h2>

                    <div class="user-box">
                        <input type="text" name="username" id="validationCustom01" required="">
                        <label class="form-label" for="validationCustom01">Username</label>
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>
                    </div>

                    <div class="user-box">
                        <input type="password" name="password" id="validationCustom01" required="">
                        <label class="form-label" for="validationCustom01">Password</label>
                            <p class="text-danger" >${message}</p>
                    <div class="invalid-feedback">
                        Cannot be blank!
                    </div>
                </div>

                <div class="remember-box">
                    <input type="checkbox" name="remember">
                    <label>Remember me!</label>
                </div>

                <div style="text-align: center">
                    <button>
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        Sign In
                    </button>
                </div>
            </form>
            <div class="forget-password" style="text-align: center">
                <a style="color: white; border: none; background: transparent" id="btn3" type="button">Forget Password?</a>
            </div>

            <div style="text-align: center">
                <p style="color: white;">-------------------------------------------</p>
            </div>

            <div class="create-account" style="text-align: right; margin-top: 10px">
                <button id="btn" style="color: white; background: #3AAA23; padding: 10px; border-radius: 10px;">Create Your Account</button>
            </div>

        </div>
        <!--Register -->
        <div class="register-box" style="display:<c:if test="${message2==null}">none</c:if><c:if test="${message2!=null}">block</c:if>" id="register" >

                <form action="Register" method="POST" class="row g-3 needs-validation" novalidate id="create-form">
                    <div>
                        <div class="header row">
                            <div class="col-md-10">
                                <h2>Create Account</h2>
                            </div>
                            <div class="col-md-1">
                                <button type="button" id="btn1" style="background: transparent; color: white; border: none; font-size: 25px">&times;</button>
                            </div>
                        </div>
                        <div class="user-box">
                            <label for="validationCustom01" class="form-label" style="color: white">Username<b style="color: red">*</b></label><br>
                            <input  type="text" name="username" placeholder="Enter Your Username..." id="myuser" required>
                                <span class="red-text accent-4" style="color: #dc3545"><c:if test="${message2!=null}">${message2}</c:if></span>
                            <div class="invalid-feedback">
                                Cannot be blank!
                            </div>
                        </div>

                        <div class="user-box">
                            <label for="validationCustom02" class="form-label" style="color: white">Gender<b style="color: red">*</b></label><br>
                            <input  type="text" name="gender" placeholder="Enter Your Gender..." id="validationCustom02" required>
                            <div class="invalid-feedback">
                                Cannot be blank!
                            </div>
                        </div>

                        <div class="user-box">
                            <label for="validationCustom02" class="form-label" style="color: white">Password<b style="color: red">*</b></label><br>
                            <input  type="password" name="password" placeholder="Enter Your Password..." id="register_password" required >
                            <div class="invalid-feedback">
                                Cannot be blank!
                            </div>
                        </div>

                        <div class="user-box">
                            <label for="validationCustom02" class="form-label" style="color: white">Re-password<b style="color: red">*</b></label><br>
                            <input  type="password" name="repassword" placeholder="Enter Re-password..." id="register_confirm_password" required onkeyup="validate_password()">
                            <span id="alert-pass"></span>
                            <div class="invalid-feedback">
                                Cannot be blank!
                            </div>

                        </div>

                        <div class="user-box">
                            <label for="validationCustom02" class="form-label" style="color: white">Date Of Birth<b style="color: red">*</b></label><br>
                            <input  type="date" name="dateofbirth" style="color: white" id="" required>
                            <div class="invalid-feedback">
                                Cannot be blank!
                            </div>

                        </div>


                        <div class="user-box">
                            <label class="label-form" style="color: white">Choose Your Security Question <a style="color: red">*</a></label>
                            <select name="question" class="form-control" style="outline: none; border: none;border-bottom: 1px solid #fff; margin-bottom: 10px;">
                            <c:forEach items="${quest}" var="q">
                                <option value="${q.ID}">${q.content}</option> 
                            </c:forEach>
                        </select>
                    </div>

                    <div class="user-box">
                        <label for="validationCustom02" class="form-label" style="color: white">Answer<b style="color: red">*</b></label><br>
                        <input  type="text" name="answer" placeholder="Your Answer..." id="validationCustom02" required >
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>
                    </div>
                </div>

                <div style="text-align: center; margin-top: 10px;">
                    <button class="btn" style="color: white; background: #3AAA23;" id="create-account1">Create</button>
                </div>
            </form>

        </div>
        <!--forget password -->
        <div style="display: none" class="forget-box" id="forget-form">
            <form action="ForgetPassword" method="POST" class="row g-3 needs-validation" novalidate id="forgetform">
                <div class="header row" style="margin-top: 10px;">
                    <div class="col-md-11">
                        <h2>Forget Password</h2>
                    </div>
                    <div class="col-md-1">
                        <button type="button" id="btn2" style="background: transparent; color: white; border: none; font-size: 25px">&times;</button>
                    </div>
                </div>
                <div class="tab">
                    <div class="user-box" style="margin-bottom: 15px;">
                        <label for="forgetuser" class="form-label" style="color: white">Username<b style="color: red">*</b></label><br>
                        <input  type="text" name="username" placeholder="Enter Your Username..." id="forgetuser" required>
                        <span class="red-text accent-4" style="color: #dc3545" id="result1"></span>
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>
                    </div>

                    <div class="user-box">
                        <label class="label-form" style="color: white">Choose Your Security Question <a style="color: red">*</a></label>
                        <select name="question" class="form-control" style="outline: none; border: none;border-bottom: 1px solid #fff; margin-bottom: 10px;" id="forgetquest">
                            <c:forEach items="${quest}" var="q">
                                <option value="${q.ID}">${q.content}</option> 
                            </c:forEach>
                        </select>
                    </div>

                    <div class="user-box">
                        <label for="validationCustom02" class="form-label" style="color: white">Answer<b style="color: red">*</b></label><br>
                        <input  type="text" name="answer" placeholder="Your Answer..." id="validationCustom02" required id="forgetanswer">
                        <span class="red-text accent-4" style="color: #dc3545" id="result2"></span>
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>
                    </div>
                </div>

                <div class="tab">
                    <div class="user-box">
                        <label for="validationCustom02" class="form-label" style="color: white">Password<b style="color: red">*</b></label><br>
                        <input  type="password" name="password" placeholder="Enter Your Password..." id="forget_password" required >
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>
                    </div>

                    <div class="user-box">
                        <label for="validationCustom02" class="form-label" style="color: white">Re-password<b style="color: red">*</b></label><br>
                        <input  type="password" name="repassword" placeholder="Enter Re-password..." id="forget_confirm_password" required onkeyup="validate_password1()">
                        <span id="alert-pass1"></span>
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>

                    </div>
                </div>

                <div style="text-align: center">
                    <div class="row">
                        <div class="col-md-6">
                            <button type="submit" id="prevBtn" onclick="nextPrev(-1)" style="background: #3AAA23; color: white; border: none; padding: 5px 25px; border-radius: 8px;">Prev</button>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" id="nextBtn" onclick="nextPrev(1)" style="background: #3AAA23; color: white; border: none; padding: 5px 25px; border-radius: 8px;">Next</button>
                        </div>
                    </div>
                </div>
                <!-- Circles which indicates the steps of the form: -->
                <div style="text-align:center;margin-top:20px;">
                    <span class="step"></span>
                    <span class="step"></span>
                </div>

            </form>

        </div>
        <script>
            $(document).ready(function () {
                $('#forgetuser').change(function () {
                    var forgetuser = $('#forgetuser').val();
                    $.ajax({
                        type: 'POST',
                        data: {forgetuser: forgetuser},
                        url: 'Checkexist',
                        success: function (result1) {
                            $('#result1').html(result1);
                        }
                    });
                });
            });
        </script>

        <script src="resource/js/newjavascript.js" type="text/javascript"></script>
    </body>
</html>

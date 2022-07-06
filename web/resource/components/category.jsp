<%-- 
    Document   : category
    Created on : 25-05-2022, 02:52:56
    Author     : TuanAnh
--%>
<div class="fixed-top" id="header">
    <nav class="navbar navbar-expand-lg navbar-dark" id="category" style="background-color: #5865F2;">
        <div class="container-fluid row">
            <a class="navbar-brand col-1" onClick="window.location.href = 'viewNewsfeed'">logo</a>
            <button class="navbar-toggler collapsed col-1" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation" style="margin-bottom: 8px;">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse col-10 row" id="navbarColor02" style="">
                <form class="d-flex col-lg-6">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light" type="submit">Search</button>
                </form>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 offset-lg-2 col-lg-4 row">
                    <li class="nav-item col-3" style="text-align: center">
                        <div class="box-icon-chat">
                            <a class="nav-link" href="chat"><i class="fas fa-comment-alt"></i></a>
                            <span id="numberOfNewMsg">0</span>
                        </div>

                    </li>
                    <li class="nav-item col-3"style="text-align: center">
                        <a class="nav-link" href="#"><i class="fas fa-bell"></i></a>
                    </li>
                    <li class="nav-item col-3">
                        <a class="nav-link" href="viewProfile"><img style="width:50%;border-radius: 50%;object-fit: contain;" id="meImage" src="data:image/jpg;base64,${sessionScope.account.avatar}"></a>
                    </li>
                    <li class="nav-item col-3">
                        <a class="nav-link" href="Logout">log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="navigation" class="row justify-content-between" style="margin-top: 5px; display: none;">
        <button class="btn col-lg-6" onClick="window.location.href = 'viewNewsfeed'" style="background-color: #5865F2; color:#FFFFFF; text-align: center; height: 50px; width: 49.8%; ">News Feed</button>   
        <button class="btn col-lg-6" onClick="window.location.href = 'viewpurchase'" style="background-color: #5865F2; color:#FFFFFF; text-align: center; height: 50px; width: 49.8%; ">View Market</button>   

    </div>
</div>

<!--add this code to show navigation
<link rel= "stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
$('#header').mouseenter(function () {
    $("#navigation").slideDown(250);

});
$("#header").mouseleave(function () {
    $("#navigation").slideUp(250);
});
add this to head tag
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
-->
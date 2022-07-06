var ws;
var senderID;
var receiveID;
var content;
var nameSender;
var avatarSender;
var nameReceive;
var avatarReceive;
var lastMessage;
var fileImage = null;
var lstFriend;
var newMessage;
var numberOfNewMsg = 0;
var oldSenderMsg = [];
// when load page will enable connect to socket
window.onload = function () {
    if ("WebSocket" in window) {

        senderID = document.getElementById("senderID").value
        avatarSender = document.getElementById("meImage").src

        if (senderID != null)
            fetchFriend()

        if (document.getElementById("receiveID") != null) {

            receiveID = document.getElementById("receiveID").value

            if (document.getElementById("recent" + receiveID) == null) {
                setNewRecieveForSender(receiveID)
            } else {
                document.getElementById("recent" + receiveID).click()
            }

        } else {
            if (document.getElementById("recent").firstElementChild != null) {
                document.getElementById("recent").firstElementChild.click()
            }
        }
        var host = document.location.host;
        var pathname = document.location.pathname;
        // connect to websocket
        ws = new WebSocket("ws://" + host + pathname + "/" + senderID);
        // recieve message
        ws.onmessage = function (event) {
            var message = JSON.parse(event.data);
            newMessage = message
            if (message.content != "Open" && message.content != "Close" && document.getElementById("recent" + message.senderID) == null) {
                setNewRecieveForReciever(message.senderID)
                if (oldSenderMsg.length == 0 || !oldSenderMsg.includes(message.senderID)) {
                    numberOfNewMsg++;
                    document.getElementById("numberOfNewMsg").innerHTML = numberOfNewMsg
                    oldSenderMsg.push(message.senderID)

                }

            }
            if (message.content != "Open" && message.content != "Close" && document.getElementById("recent" + message.senderID) != null) {
                document.getElementById("recent" + message.senderID).classList.add("newMessage");
                document.getElementById("lastMessage" + message.senderID).innerHTML = message.content
                document.getElementById("numberOfMessage").innerHTML = parseInt(document.getElementById("numberOfMessage").innerHTML) + 1
                if (oldSenderMsg.length == 0 || !oldSenderMsg.includes(message.senderID)) {
                    numberOfNewMsg++;
                    document.getElementById("numberOfNewMsg").innerHTML = numberOfNewMsg
                    oldSenderMsg.push(message.senderID)
                }

            }
            setMessage(message)

        };

    } else {
        console.log("Websockets not supported");
    }

}
// setting new conversation by side reciever
function setNewRecieveForReciever(id) {
    var url = "http://" + window.location.host + "/nhom-4-se1604ks-swp391-social-network-for-gamer" + "/get-infor-chat-with?id=" + id
    $.ajax({
        url: url,
        method: 'get',
        dataType: 'json',
        success: function (data) {

            var recentE = document.getElementById("recent")
            var html = '<li class="newMessage" onclick="setRecieve(' + newMessage.senderID + ', \'' + data.displayname + '\', \'' + data.avatar + '\')" id="recent' + newMessage.senderID + '">\n\
                         <div class="d-flex bd-highlight"><div class="img_cont">\n\
                    <img src="data:image/jpeg;base64,' + data.avatar + '" class="rounded-circle user_img">\n\
                    <span class="online_icon"></span></div> <div class="user_info"><span id="name_recent' + newMessage.senderID + '">' + data.displayname + '</span>\n\
                    <p id="lastMessage' + newMessage.senderID + '">' + newMessage.content + '</p>\n\
                     </div></div></li>'
            document.getElementById("numberOfMessage").innerHTML = 0
            recentE.innerHTML += html
            $("#recent" + newMessage.senderID).prependTo("#recent")

        }
    });


}
// setting new conversation by side sender
function setNewRecieveForSender(id) {
    var url = "http://" + window.location.host + "/nhom-4-se1604ks-swp391-social-network-for-gamer" + "/get-infor-chat-with?id=" + id
    $.ajax({
        url: url,
        method: 'get',
        dataType: 'json',
        success: function (data) {

            document.getElementById("chatWith").innerHTML = data.displayname
            document.getElementById("chatWithAvatar").src = 'data:image/jpeg;base64,' + data.avatar
            nameReceive = data.displayname
            avatarReceive = data.avatar
            document.getElementById("numberOfMessage").innerHTML = 0

        },
        error: function (request, status, error) {
            if (document.getElementById("recent").firstElementChild != null) {
                document.getElementById("recent").firstElementChild.click()
            }
        }
    });


}
// when user clicl and choose conversation
function setRecieve(id, name, avatar) {

    if (receiveID != null && receiveID != id) {

        var activeEle = document.getElementById("recent" + receiveID)

        if (activeEle != null) {


            activeEle.classList.remove("active");
            if (document.getElementById("recent" + id) != null) {
                activeEle = document.getElementById("recent" + id)
                activeEle.classList.add("active");
                if (activeEle.classList.contains("newMessage")) {
                    activeEle.classList.remove("newMessage");
                    numberOfNewMsg--;
                    document.getElementById("numberOfNewMsg").innerHTML = numberOfNewMsg
                    removeItemOnce(oldSenderMsg, parseInt(id))

                }
            }

        }
        receiveID = id


    } else {
        receiveID = id
        if (document.getElementById("recent" + receiveID) != null) {
            activeEle = document.getElementById("recent" + receiveID)
            activeEle.classList.add("active");
            if (activeEle.classList.contains("newMessage")) {
                activeEle.classList.remove("newMessage");
                numberOfNewMsg--;
                document.getElementById("numberOfNewMsg").innerHTML = numberOfNewMsg
                removeItemOnce(oldSenderMsg, parseInt(receiveID))

            }
        }

    }
    avatarReceive = avatar
    nameReceive = name
    document.getElementById("chatWith").innerHTML = name
    document.getElementById("chatWithAvatar").src = 'data:image/jpeg;base64,' + avatar
    document.getElementById("resultSearch").innerHTML = ""
    document.getElementById("inputSearch").value = ""

    loadMessages()
}
// handle image get file image and convert to base64
function handleFileSelect(e) {

    var file = document.getElementById("upload").files[0];

    getBase64(file).then(
            data => fileImage = data
    );


    if (file) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#insert_img').attr('src', e.target.result)
            $("#send_msg").css("display", "block");
        };

        reader.readAsDataURL(file);
    }
}
function getBase64(file) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = error => reject(error);
    });
}

// remmove conversation
function removeConversation() {
    var url = "http://" + window.location.host + "/nhom-4-se1604ks-swp391-social-network-for-gamer" + "/remove-conversation?sender=" + senderID
            + "&receiver=" + receiveID
    $.ajax({
        url: url,
        method: 'post',
        success: function () {
            // check tag conversation
            if (document.getElementById("recent" + receiveID) != null) {
                document.getElementById("recent" + receiveID).remove()
                // get next conversation
                if (document.getElementById("recent").firstElementChild != null) {
                    document.getElementById("recent").firstElementChild.click()
                }
            }

        }
    });
}
function enter(event) {

    if (event.key === "Enter") {
        event.preventDefault();
        document.getElementById("sendMessage").click();
    }
}
// handle when send message
function send() {

    var content = document.getElementById("content").value;
    if (content == "" && fileImage == null)
        return;

    document.getElementById("content").value = ""

    var message = buildMessageToJson(content)
    var json = JSON.stringify(message);
    // reset input file
    $("#send_msg").css("display", "none");
    $('#upload').val(null);
    document.getElementById("numberOfMessage").innerHTML = parseInt(document.getElementById("numberOfMessage").innerHTML) + 1
    fileImage = null
    // send message 
    ws.send(json);
    message.time = (new Date()).toLocaleDateString()
    setMessage(message)
    setRecentFirst(message);
}
// setting recent message when user sent message
function setRecentFirst(msg) {
    //case exist conversation
    if (document.getElementById("recent" + msg.receiveID) != null) {
        $("#recent" + msg.receiveID).prependTo("#recent")
        document.getElementById("lastMessage" + msg.receiveID).innerHTML = "You: " + msg.content
    } else {
        // case new conversation
        var recentE = document.getElementById("recent")
        var html = '<li  onclick="setRecieve(' + msg.receiveID + ', \'' + nameReceive + '\', \'' + avatarReceive + '\')" id="recent' + msg.receiveID + '">\n\
                         <div class="d-flex bd-highlight"><div class="img_cont">\n\
                    <img src="data:image/jpeg;base64,' + avatarReceive + '" class="rounded-circle user_img">\n\
                    <span class="online_icon"></span></div> <div class="user_info"><span>' + nameReceive + '</span>\n\
                    <p id="lastMessage' + msg.receiveID + '">You: ' + msg.content + '</p>\n\
                     </div></div></li>'
        recentE.innerHTML += html
        $("#recent" + msg.receiveID).prependTo("#recent")
    }

}
// covert to format json
function buildMessageToJson(message) {
    return {
        senderID: senderID,
        receiveID: receiveID,
        content: message,
        image: fileImage,
        time: null
    };
}


// set messsage
function setMessage(msg) {

    var log = document.getElementById("log");
    if (msg.content != 'Open' && msg.content != 'Close') {
        if (msg.receiveID != null) {
            // insert message to box conversation
            log.innerHTML += customLoadMessage(msg);
            goLastestMsg();
        }

    }
}
// search friend by name
function searchFriend(valueName) {
    var searchBox = document.getElementById("resultSearch")
    searchBox.innerHTML = ""
    if (valueName != "")
        for (var i = 0; i < lstFriend.length; i++) {
            if (lstFriend[i].displayname.toLowerCase().includes(valueName.toLowerCase())) {
                var html = ' <li onclick="setRecieve(' + lstFriend[i].ID + ', \'' + lstFriend[i].displayname + '\', \'' + lstFriend[i].avatar + '\')" class="search_item">\n\
                        <div class="search_image">\n\
                         <img src="data:image/jpg;base64,' + (lstFriend[i].avatar == undefined ? "" : lstFriend[i].avatar) + '" class="rounded-circle user_img">\n\
                        </div>\n\
                        <div class="search_name"><span>' + lstFriend[i].displayname + '</span></div>\n\
                        </li>'
                searchBox.innerHTML += html
            }
        }
}
// get list friend
function fetchFriend() {
    var url = "http://" + window.location.host + "/nhom-4-se1604ks-swp391-social-network-for-gamer" + "/get-friend?id=" + senderID

    $.ajax({
        url: url,
        method: 'get',
        dataType: 'json',
        success: function (data) {
            lstFriend = data
        }
    });

}
// load all message
function loadMessages() {

    var currentChatbox = document.getElementById("log");

    currentChatbox.innerHTML = ""
    var url = "http://" + window.location.host + "/nhom-4-se1604ks-swp391-social-network-for-gamer" + "/chat-rest-controller?sender=" + senderID
            + "&receiver=" + receiveID
    $.ajax({
        url: url,
        method: 'get',
        dataType: 'json',
        success: function (data) {
            document.getElementById("numberOfMessage").innerHTML = data.length

            data.forEach(msg => {
                // insert message to box conversation
                currentChatbox.innerHTML += customLoadMessage(msg);
            })
            goLastestMsg();

        }
    });



}
// show message 
function customLoadMessage(msg) {
    var msgDisplayImage = ''
    if (msg.image != null && !msg.image.includes('data:image/')) {
        msgDisplayImage = 'data:image/jpeg;base64,' + msg.image
    } else {
        msgDisplayImage = msg.image
    }
    var msgDisplay = ''
    if (msg.senderID == senderID) {

        if (msg.image != null && msg.content == "") {

            msgDisplay +=
                    '<div class="message" onclick="deleteMessage(' + msg.ID + ')">\n\
                        <div class="d-flex justify-content-end mb-4">' +
                    '<div class="msg_cotainer_send"><img class="msg-image" src="' + msgDisplayImage + '"><span class="msg_time_send">' + msg.time + '</span>\n\
                               </div>\n\
                            <div class="img_cont_msg">' +
                    '<img class="rounded-circle user_img_msg" src="' + avatarSender + '"</div></div></div>'
        } else if (msg.image != null && msg.content != "") {

            msgDisplay =
                    '<div class="message"><div class="d-flex justify-content-end mb-4">' +
                    '<div class="msg_cotainer_send">' + msg.content +
                    '<span class="msg_time_send">' + msg.time + '</span></div><div class="img_cont_msg">' +
                    '<img class="rounded-circle user_img_msg" src="' + avatarSender + '"</div></div></div>'
            msgDisplay +=
                    '<div class="message"><div class="d-flex justify-content-end mb-4">' +
                    '<div class="msg_cotainer_send"><img class="msg-image" src="' + msgDisplayImage + '">\n\
                        <span class="msg_time_send">' + msg.time + '</span> </div><div class="img_cont_msg">' +
                    '<img class="rounded-circle user_img_msg" src="' + avatarSender + '"</div></div></div>'
        } else if (msg.image == null && msg.content != "") {
            msgDisplay +=
                    '<div class="message"><div class="d-flex justify-content-end mb-4">' +
                    '<div class="msg_cotainer_send">' + msg.content +
                    '<span class="msg_time_send">' + msg.time + '</span></div><div class="img_cont_msg">' +
                    '<img class="rounded-circle user_img_msg" src="' + avatarSender + '"</div></div></div>'

        }


    } else if (msg.senderID == receiveID) {


        if (msg.image != null && msg.content == "") {
            msgDisplay += '<div class="message"><div class="d-flex justify-content-start mb-4">\n\
                    <div class="img_cont_msg">' +
                    '<img src="data:image/jpeg;base64,' + avatarReceive + '"class="rounded-circle user_img_msg">' +
                    '</div><div class="msg_cotainer"><img class="msg-image" src="' + msgDisplayImage + '"><span class="msg_time">' + msg.time + '</div></div></div>'

        } else if (msg.image != null && msg.content != "") {
            msgDisplay += '<div class="message"><div class="d-flex justify-content-start mb-4">\n\
                    <div class="img_cont_msg">' +
                    '<img src="data:image/jpeg;base64,' + avatarReceive + '"class="rounded-circle user_img_msg">' +
                    '</div><div class="msg_cotainer">' + msg.content + '<span class="msg_time">' + msg.time + '</div></div></div>'

            msgDisplay += '<div class="message"><div class="d-flex justify-content-start mb-4">\n\
                    <div class="img_cont_msg">' +
                    '<img src="data:image/jpeg;base64,' + avatarReceive + '"class="rounded-circle user_img_msg">' +
                    '</div><div class="msg_cotainer"><img class="msg-image" src="' + msgDisplayImage + '"><span class="msg_time">' + msg.time + '</div></div></div>'

        } else if (msg.image == null && msg.content != "") {
            msgDisplay += '<div class="message"><div class="d-flex justify-content-start mb-4">\n\
                    <div class="img_cont_msg">' +
                    '<img src="data:image/jpeg;base64,' + avatarReceive + '"class="rounded-circle user_img_msg">' +
                    '</div><div class="msg_cotainer">' + msg.content + '<span class="msg_time">' + msg.time + '</div></div></div>'


        }
    }

    return msgDisplay

}

// scroll in box conversation
function goLastestMsg() {
    var msgLiTags = document.querySelectorAll(".message");
    var last = msgLiTags[msgLiTags.length - 1];
    try {
        last.scrollIntoView();
    } catch (ex) {
    }
}

function removeItemOnce(arr, value) {
    var index = arr.indexOf(value);
    if (index > -1) {
        arr.splice(index, 1);
    }
    return arr;
}
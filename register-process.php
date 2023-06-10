<?php

session_start();
ob_start();
require_once('./connection.php');
include "./header.php";

if(isset($_POST["UserName"]) && isset($_POST["Password"])) {
    //get info
    $UserName = $_POST["UserName"]; 
    $Email = $_POST["Email"];
    $Password = $_POST["Password"];
    $ConfirmPassword = $_POST["ConfirmPassword"];
    $Address = $_POST["Address"];
    $PhoneNumber = $_POST["PhoneNumber"];
    $UserType = 1;
    $sql = "SELECT * FROM users WHERE Email='$Email' ";
    $result = mysqli_query($conn, $sql);

    if($UserName === '' || $Email === '' || $Password === ''){
        $message = "Nhập thiếu trường thông tin !";
    }else if($Password!==$ConfirmPassword){
        $message = "Nhập không khớp mật khẩu !";
    }else if(mysqli_num_rows($result) > 0) {
        $message = "Email đã được đăng ký !";
    }else{
        //insert database
            $sql = "INSERT INTO `users`(`UserName`, `Email`, `UserPassword`, `UserType`,`Address`,`PhoneNumber`) VALUES ('$UserName','$Email','$Password','$UserType','$Address','$PhoneNumber')";
            
            if(mysqli_query($conn, $sql)) {
                $message = "Đăng ký thành công!";
            } else {
                $message = "Đăng ký thất bại!";
             }
    }
   
}else{
    $message = "Bạn chưa nhập thông tin !";
}
echo "<center><h2>$message</h2><br></br><button class='btn btn-outline-info'><a href='dang-Nhap.php'> Trở lại </a></button></center><br></br>";
include "./footer.php";
<?php

session_start();
ob_start();
require_once('./connection.php');
include "./header.php";
if(isset($_SESSION["UserID"])){
    $message = "Bạn đang đăng nhập vui lòng đăng xuất !";
}else
if(isset($_POST["Email"]) && isset($_POST["Password"])) {
    $Email = $_POST["Email"]; 
    $Password = $_POST["Password"];
    $sql = "SELECT * FROM users WHERE Email='$Email' AND UserPassword='$Password'";
    $result = mysqli_query($conn, $sql);
    
    if(mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $_SESSION["UserID"] = $row["UserID"];
        $_SESSION["Email"] = $row["Email"];
        $_SESSION["Address"] = $row["Address"];
        $_SESSION["PhoneNumber"] = $row["PhoneNumber"];
        $_SESSION["UserName"] = $row["UserName"];
        $_SESSION["UserType"] = $row["UserType"];
        $message = "Đăng nhập thành công!";
    } else {
        $message = "Email hoặc mật khẩu không đúng!";
    }
}

echo "<center><h2>$message</h2><br></br><button class='btn btn-outline-info'><a href='dang-Nhap.php'> Trở lại </a></button></center><br></br>";
include "./footer.php";
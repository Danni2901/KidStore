<?php 
session_start();
ob_start();
require_once('./connection.php');
include "./header.php";

if(isset($_GET["id"])){
    $productId = $_GET["id"];
    $sql = "SELECT p.ProductID, p.CategoryID, p.ProductName, p.Price, p.Quantity, p.discription, i.ImageID, i.URL
            FROM products p 
            INNER JOIN images i ON p.ProductID = i.ProductID
            WHERE p.ProductID = $productId;";
    $result = mysqli_query($conn, $sql);
}else{
    echo "<center><h2>Không tìm thấy sản phẩm !</h2></center>";    
    include "./footer.php";
    die;

}

?>
<link rel="stylesheet" href="app.css">
<div class="container">
    <?php
    if(mysqli_num_rows($result) > 0){
        $row = mysqli_fetch_assoc($result);
    ?>
        <div class="product-info">
            <div class="product-image" style="margin: 10;">
                <img src="<?php echo $row['URL']; ?>" alt="product image" width="300" height="300">
            </div>
            <div class="product-details">                
                <p class="product-id">ID: <?php echo $row['ProductID'];?></p>
                <h1 class="product-name"><?php echo $row['ProductName'];?></h1>
                <p class="product-price">Giá: <?php echo $row['Price'];?>₫</p>
                <p><del class="pro-compare-price"><?php echo $row["Price"]*1.33 ?>₫</del></p>   
                <p class="product-quantity">Số lượng còn: <?php echo $row['Quantity']; ?></p>
                <p class="product-quantity">Mô tả: <?php echo $row['discription']; ?></p>
                <p><a href="gio-hang.php?id=<?php echo $row["ProductID"]; ?>" class="btn btn-info"><i class="fa fa-shopping-bag" aria-hidden="true"></i> Thêm Vào giỏ hàng</a></p>
            </div>
        </div>                                               

    <?php
    } else {
        echo "Product not found.";
    }
    ?>
</div>


<?php 
include "./footer.php";
?>

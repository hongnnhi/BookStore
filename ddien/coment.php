<?php
// Kết nối cơ sở dữ liệu
include './connect_db.php';

// Kiểm tra nếu người dùng gửi form bình luận
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Lấy dữ liệu từ form
    $productID = $_POST['product_id'];
    $userName = $_POST['user_name'];
    $comment = $_POST['comment'];

    // Thực hiện truy vấn để lưu bình luận vào cơ sở dữ liệu
    $query = "INSERT INTO comments (product_id, user_name, comment, created_at) VALUES ('$productID', '$userName', '$comment', NOW())";
    mysqli_query($con, $query);
}

// Lấy danh sách bình luận cho sản phẩm hiện tại
$productID = $_GET['id'];
$commentsQuery = mysqli_query($con, "SELECT * FROM comments WHERE product_id = '$productID' ORDER BY created_at DESC");

// Hiển thị thông tin sản phẩm

// Hiển thị form bình luận
?>
<h2>Bình luận:</h2>
<form method="POST" action="detail.php">
    <input type="hidden" name="product_id" value="<?php echo $productID; ?>">
    <label>Tên người dùng:</label>
    <input type="text" name="user_name" required>
    <br>
    <label>Nội dung bình luận:</label>
    <textarea name="comment" required></textarea>
    <br>
    <input type="submit" value="Gửi bình luận">
</form>

<h2>Các bình luận:</h2>
<?php
// Hiển thị danh sách bình luận
while ($commentRow = mysqli_fetch_array($commentsQuery)) {
    echo "<p><strong>{$commentRow['user_name']}:</strong> {$commentRow['comment']}</p>";
}
?>

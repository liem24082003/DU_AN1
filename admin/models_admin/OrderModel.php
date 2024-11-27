<?php
class OrderModel {

    // Lấy danh sách đơn hàng
    public function select_list_orders_admin() {
        $sql = "
            SELECT
                orders.order_id,
                orders.user_id,
                orders.date AS order_date,
                orders.total,
                orders.address AS order_address,
                orders.phone AS order_phone,
                orders.note,
                orders.status,
                users.full_name,
                users.email,
                users.phone AS user_phone
            FROM
                orders
            JOIN
                users ON orders.user_id = users.user_id
            ORDER BY orders.order_id DESC
        ";

        return pdo_query($sql);
    }

    // Lấy danh sách đơn hàng chưa xác nhận
    public function select_orders_unconfirmed() {
        $sql = "
            SELECT
                orders.order_id,
                orders.user_id,
                orders.date AS order_date,
                orders.total,
                orders.address AS order_address,
                orders.phone AS order_phone,
                orders.note,
                orders.status,
                users.full_name,
                users.email,
                users.phone AS user_phone
            FROM
                orders
            JOIN 
                users ON orders.user_id = users.user_id
            WHERE orders.status = 1
            ORDER BY orders.order_id DESC
        ";

        return pdo_query($sql);
    }

    // Lấy thông tin chi tiết đơn hàng
    public function getFullOrderInformation($order_id) {
        $sql = "
            SELECT
                orders.order_id,
                orders.user_id,
                orders.date AS order_date,
                orders.total,
                orders.address AS order_address,
                orders.phone AS order_phone,
                orders.note,
                orders.status,
                users.full_name,
                users.email,
                users.phone AS user_phone,
                orderdetails.product_id,
                orderdetails.quantity,
                orderdetails.price,
                products.name AS product_name,
                products.image AS product_image
            FROM
                orders
            JOIN
                users ON orders.user_id = users.user_id
            JOIN
                orderdetails ON orders.order_id = orderdetails.order_id
            JOIN
                products ON orderdetails.product_id = products.product_id
            WHERE orders.order_id = ?
        ";

        return pdo_query($sql, [$order_id]);
    }

    // Tổng doanh thu từ các đơn hàng đã hoàn thành
    public function total_revenue_orders() {
        $sql = "SELECT SUM(total) AS tong_doanh_thu FROM orders WHERE status = 4";
        return pdo_query_one($sql);
    }

    // Đếm số đơn hàng chưa xác nhận
    public function count_unconfirmed() {
        $sql = "SELECT COUNT(*) AS don_cho FROM orders WHERE status = 1";
        return pdo_query_one($sql);
    }

    // Thống kê số lượng sản phẩm theo danh mục
    public function get_statistics() {
        $sql = "SELECT 
                    categories.name AS cate_name, 
                    COUNT(products.product_id) AS count_products,
                    MIN(products.sale_price) AS min_price,
                    MAX(products.sale_price) AS max_price,
                    AVG(products.sale_price) AS avg_product
                FROM categories
                LEFT JOIN products ON categories.category_id = products.category_id
                GROUP BY categories.category_id
                ORDER BY count_products DESC";
        
        return pdo_query($sql);
    }
    
    

    // Cập nhật trạng thái đơn hàng
    public function update_status_order($status, $order_id) {
        $sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        pdo_execute($sql, [$status, $order_id]);
    }
}

$OrderModel = new OrderModel();
?>

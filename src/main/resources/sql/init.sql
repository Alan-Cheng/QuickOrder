USE QOD;

-- 創建 Customer 表
CREATE TABLE IF NOT EXISTS customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    table_number VARCHAR(10) NOT NULL -- 桌號
);

-- 創建 Item 表
CREATE TABLE IF NOT EXISTS item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,           -- 菜名
    description TEXT,                     -- 描述
    price DECIMAL(10, 2) NOT NULL,        -- 價格
    is_available BOOLEAN DEFAULT TRUE,    -- 是否供應
    image_path VARCHAR(255)               -- 商品圖片的檔案路徑
);

-- 創建 Orders 表
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,                      -- 客戶ID (可選)
    order_time DATETIME NOT NULL,         -- 下單時間
    status VARCHAR(20) NOT NULL,          -- 訂單狀態 (Pending, Completed, Cancelled)
    total_price DECIMAL(10, 2) NOT NULL,  -- 訂單總價
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE SET NULL
);

-- 創建 Order_Item 表
CREATE TABLE IF NOT EXISTS order_item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,                -- 訂單ID
    item_id INT NOT NULL,                 -- 菜單項目ID
    quantity INT NOT NULL,                -- 數量
    price DECIMAL(10, 2) NOT NULL,        -- 單價
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE CASCADE
);

-- 為 `order_time` 欄位建立索引
CREATE INDEX idx_order_time ON orders (order_time);

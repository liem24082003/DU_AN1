-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2024 at 11:54 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duan1`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` int NOT NULL,
  `product_quantity` int NOT NULL,
  `product_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `product_id`, `user_id`, `product_name`, `product_price`, `product_quantity`, `product_image`) VALUES
(80, 25, 9, 'Cây cam ngọt', 160000, 1, 'cay-cam-ngot.jpg'),
(81, 23, 9, 'Sách đất rừng', 120000, 1, 'dat-rung.jpg'),
(82, 27, 9, 'Người bà tài giỏi(tái bản 2022)', 180000, 1, 'nguoi-ba.jpg'),
(83, 2, 9, 'Sách mới', 110000, 3, 'book-2.png'),
(138, 32, 11, 'Kiếm Tiền Từ Tiktok', 100000, 1, 'kiem-tien-titok.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `image`, `status`) VALUES
(1, 'Chưa có danh mục', 'tieng-anh-nguoi-moi.jpg', 1),
(2, 'Tâm lý', 'ngon-tinh.jpg', 1),
(4, 'Tiểu thuyết', 'cay-cam-ngot.jpg', 1),
(6, 'Văn học', 'lam-ban.jpg', 1),
(16, 'Xu hướng kinh tế', 'xu-huong-kinh-te.jpg', 1),
(17, 'Tâm linh - Tôn Giáo', 'tam-linh.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 ẩn 1 hiện',
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `total`, `address`, `phone`, `note`, `status`) VALUES
(49, 15, '2024-11-26 07:24:53', 180000, 'Thường Tín Hà Nội Việt Nam', '0971415610', '', 1),
(50, 15, '2024-11-26 09:01:04', 126000, 'Thường Tín Hà Nội Việt Nam', '0971415610', '', 1),
(51, 15, '2024-11-26 09:01:41', 102000, 'Thường Tín Hà Nội Việt Nam', '0971415610', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `views` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `category_id`, `title`, `image`, `author`, `content`, `views`, `status`, `created_at`, `updated_at`) VALUES
(13, 9, 'Hạt Giống Tâm Hồn - Nhiều Tác Giả', 'hat-giong-tam-hon-nhieu-tac-gia-bai-1-212120.jpg', 'Liêm Nguyễn', '<p>Có những thời điểm trong cuộc sống khi chúng ta đối mặt với những khó khăn, tuyệt vọng và không biết làm thế nào để tiếp tục. Đó là lúc mà mọi ước mơ dường như tan biến, và chúng ta cảm thấy mất hứng thú với cuộc sống. Trong những khoảnh khắc như vậy, cuốn sách \'\'Hạt Giống Tâm Hồn\'\' là nguồn động viên, là người bạn đồng hành để giúp chúng ta đứng lên và vượt qua khó khăn.</p><p>\'\'Hạt Giống Tâm Hồn\'\' là một tác phẩm nổi tiếng với những câu chuyện sâu sắc về nghệ thuật sống và giá trị đạo đức, được tổng hợp bởi công ty First News Trí Việt. Cuốn sách này không chỉ là nguồn cảm hứng mà còn là nguồn động viên giúp con người nâng cao bản thân trong mọi tình huống, vượt qua chính mình và sống đáng giá với phẩm chất của mình.</p><p>\'\'Hạt Giống Tâm Hồn\'\' mang đến cho độc giả những trải nghiệm đầy cảm xúc, với những nhân vật đầy sức mạnh ý chí đối mặt với khó khăn. Cuốn sách không chỉ là nguồn cảm hứng mà tôi rút ra từ nó, mà còn là sự kiên cường và quyết tâm để đối mặt với thách thức. Tôi đã tìm thấy những bài học quý giá cho bản thân từ cuốn sách này.</p><p>Trước đây, tôi thường đặt ra hàng trăm câu hỏi về cách đạt được thành công và chọn lựa con đường tương lai. \'\'Hạt Giống Tâm Hồn\'\' không chỉ giúp tôi tìm thấy câu trả lời, mà còn dạy cho tôi về tầm quan trọng của nỗ lực. Cuốn sách này là một kỳ quan kì diệu, mở ra trước mắt tôi những giải pháp khi gặp khó khăn, những điều không tưởng trở thành hiện thực chỉ thông qua hai từ: nỗ lực.</p><p>\'\'Hạt Giống Tâm Hồn\'\' là nguồn động viên tuyệt vời, giúp chúng ta vượt qua thách thức và đạt được thành công. Cuốn sách này chứng minh rằng, bất kỳ khó khăn nào cũng có thể vượt qua nếu ta có ý chí và niềm tin. Nó là một phép màu kì diệu, mang lại niềm tin và hạnh phúc trong cuộc sống. Tôi biết thế nào là thất bại và muốn từ bỏ, nhưng cuốn sách đã giúp tôi bước lên và tin rằng: Đằng sau những giọt nước mắt là niềm vui và hạnh phúc.</p><p>\'\'Hạt Giống Tâm Hồn\'\' không chỉ là một cuốn sách, mà là một nguồn động viên, một người bạn đồng hành trung thành bên ta khi chúng ta cần. Cuốn sách này làm rơi nước mắt của cảm xúc trong trái tim đọc giả. Tôi đã hiểu thêm về ý nghĩa cuộc sống, và biết rằng, nếu chúng ta giữ vững ý chí, gạt đi những giọt nước mắt, chúng ta sẽ vượt qua mọi thách thức và chạm tới thành công.</p><p>Trong mọi tình huống, chỉ cần chúng ta giữ vững ý chí, vượt qua những thời kỳ khó khăn, chúng ta sẽ nhận thấy rằng sau những giọt nước mắt đau đớn, vẫn còn sự hạnh phúc và niềm vui. Ngược lại, nếu chúng ta dễ dàng buông xuôi, chúng ta chỉ đạt được thất bại và nỗi buồn kéo dài. \'\'Hạt Giống Tâm Hồn\'\' đã làm thay đổi cuộc đời tôi, giúp tôi nhận thức đúng giá trị bản thân và trở thành nguồn động viên không ngừng mỗi khi tôi gặp khó khăn, thất bại trong cuộc sống.</p>', 0, 1, '2024-11-27 18:53:02', '2024-11-27 18:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`) VALUES
(1, 'Chưa có chuyên mục'),
(2, 'Tác giả nổi tiếng'),
(9, 'Giới thiệu sách');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `sale_price` int NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `image`, `quantity`, `price`, `sale_price`, `create_date`, `views`, `details`, `short_description`, `status`) VALUES
(1, 2, 'Tâm Lý Học Thành Công', 'tam-ly-hoc-thanh-cong.jpg', 100, 199000, 159000, '2023-11-18 08:22:03', 0, '<p><strong>Nếu bạn vẫn luôn tin rằng chỉ những ai may mắn sở hữu trí thông minh bẩm sinh mới có thể thành công thì nhất định bạn phải đọc cuốn sách này.</strong></p><p>Có thể bạn chưa biết, “Mindset: Tâm lý học thành công” của Tiến sĩ tâm lý học Carol S. Dweck (ĐH Stanford) là một trong sáu quyển sách được tỷ phú Bill Gates review và khuyên đọc vào năm 2015. Không chỉ vậy, cuốn sách này cũng được Satya Nadella - vị CEO tài ba của Microsoft – xem như một \"hồi chuông đánh thức gã khổng lồ đang ngủ say\" bên trong con người ông. Và đây cũng chính là cuốn sách mà anh <strong>Hoàng N.Trung</strong> (Section Manager - VEU) đã “highly recommend” trong buổi Morning Speech về “Growth Mindset” ngày 28/4, bởi theo anh đây là <i><strong>“một cuốn sách cho ta hiểu rõ về mindset và vì sao mindset lại quan trọng đối với sự thành công của mỗi người”. </strong></i>Giờ cùng review về cuốn sách này nhé!</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Carol Dweck</strong></p>', 1),
(2, 2, 'Thuật thao túng', 'thuat-thao-tung.jpg', 100, 140000, 97000, '2023-11-18 10:15:54', 0, '<p>“Thuật Thao Túng – Góc Tối Ẩn Sau Mỗi Câu Nói” của tác giả <strong>Wladislaw Jachtchenko</strong> là một cuốn sách rất hữu ích để nâng cao kỹ năng và chiến lược giao tiếp của bạn. Cuốn sách cung cấp những kỹ năng và chiến lược giao tiếp cần thiết để đạt được sự thành công trong cuộc sống.</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Wladislaw Jachtchenko</strong></p>', 1),
(6, 2, 'Tâm Lý Học Tội Phạm', 'tam-ly-hoc-toi-pham.jpg', 50, 145000, 100000, '2023-11-20 22:23:49', 0, '', '', 1),
(14, 17, 'An Nhiên Giữa Những Thăng Trầm', 'an-nhien.jpg', 5, 120000, 102000, '2023-11-20 22:54:49', 0, '<p>Ai trong đời chẳng từng một lần rơi vào tận cùng nỗi cô đơn, chợt thấy mình yếu đuối, mong manh quá đỗi; chẳng từng một lần chực gục ngã, buông xuôi trong bão giông cuộc đời; chẳng từng một lần chán nản trước thế sự đổi thay, lòng người nguội lạnh; chẳng từng một lần cảm thấy tìm chút bình an trong cuộc đời vô thường sao khó quá…</p><p>Thế rồi bất chợt một ngày kia, đâu đó trên đoạn đường trần xuất hiện những bài thơ chân tình, mộc mạc, ẩn chứa cả ân tình chuyển hóa kiếp nhân sinh:</p><p><i>Em có biết, tình yêu mầu nhiệm lắm!</i></p><p><i>Nếu bàn tay quen nắm, biết buông ra Cứ thầm lặng, yêu đâu cần vội vã</i></p><p><i>Giữa muôn loài thấy lại bóng hình ta…</i></p><p>Những bài văn mang đậm chất triết lý, chất chứa các bài học trị liệu nỗi khổ niềm đau của kiếp sống con người: <i>“Khi đến với cuộc đời này, ta chẳng mang theo thứ gì, khi rời đi, ta chỉ như một làn khói. Ngẫm lại đời người thật đơn giản vậy! Vinh hoa phú quý rồi cũng thoáng qua theo ngày tháng, ân ái tình thù rồi cũng trở về với cát bụi”.</i></p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Như Nhiên Thích Tánh Tuệ</strong></p>', 1),
(15, 17, 'Hành Trình Về Phương Đông', 'hanh-trinh-ve-phuong-dong.jpg', 50, 118000, 95000, '2023-11-20 23:05:47', 0, '<p>Nếu là một mọt sách thì chắc hản chúng ta ít nhất đã từng nghe qua tên cuốn sách <i>Hành trình về phương Đông, </i>mình cũng vậy, cũng từng tò mò, từng có ham muốn mãnh liệt đọc cuốn sách được mệnh danh all time best selling book này, và quả thực trải nghiệm đọc cuốn sách này thật khó có thể truyền đạt bằng lời nói hay ngôn ngữ ký hiệu như chúng ta vẫn đang thấy ở đây. Nhưng quả thực mình vẫn muốn chia sẻ và để lại một chút gì đó cảm nhận của bản thân về những điều mình học được, mình suy ngẫm hay ít ra là cho rằng là những nội dung mà sách hướng tới.&nbsp;</p><p><strong>Về tác giả Baird Thomas Spalding</strong></p><p>Là một nhà văn tâm linh người Mĩ sống vào cuốn thế kỷ XVIII đầu thế kỷ IX, những thông tin vè quê quán của ông hiện nay vẫn còn nhiều tranh cãi. Ông là nhà văn tâm linh với tác phẩm nổi tiếng Life and Teachng of the Masters of the Far East (tạm dịch: Cuộc đời các chân sư phương Đông).</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Baird T Spalding</strong></p>', 1),
(16, 17, 'Huyền Thuật Và Các Đạo Sĩ Tây Tạng', 'huyen-thuat-tay-trang.jpg', 200, 110000, 90000, '2023-11-20 23:09:13', 0, '<p><strong>HÀNH TRÌNH 12 NĂM TRONG ĐẤT PHẬT HUYỀN BÍ&nbsp;</strong></p><p>Gần 100 năm kể từ ngày ra mắt, Mystyquet et Magiciens du Tibet, cuốn sách vang dội châu Âu của nữ tác giả người Pháp Alexandra David – Neel, mới có dịp đến tay bạn đọc Việt Nam với tên gọi&nbsp;Huyền thuật và các đạo sĩ Tây Tạng. Cuốn sách là một thiên phóng sự đáng kinh ngạc của tác giả trong hành trình xuyên qua vùng đất Tây Tạng để khám phá các huyền thuật của đạo sĩ nơi đây.&nbsp;</p><p>Với ý định tiếp kiến Đức Đạt Lai Lạt Ma đời thứ 13 đang lánh nạn tại Ấn Độ (vì xung đột chính trị với triều đại Mãn Thanh), Alexandra David – Neel không ngờ các bí mật về huyền thuật Tây Tạng lẫn lời chỉ dẫn sâu xa của những vị đạo sư đã dẫn bà đi xa hơn dự định ban đầu của mình. Sau 12 năm rong ruổi khắp Tây Tạng, Alexandra đã để lại tập sách Huyền thuật và các đạo sĩ Tây Tạng như một công trình nghiên cứu quan trọng về vùng đất đầy bí ẩn này.</p><p>&nbsp;</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Alexandra David Neel</strong></p>', 1),
(17, 17, 'Muôn Kiếp Nhân Sinh', 'muonkiepnhansinh.jpg', 30, 270000, 187000, '2023-11-20 23:12:48', 0, '<p><i><strong>Muôn kiếp nhân sinh</strong></i> là một bộ sách về <a href=\"https://vi.wikipedia.org/wiki/T%C3%A2m_linh\">tâm linh</a> do giáo sư John Vũ sáng tác dưới <a href=\"https://vi.wikipedia.org/wiki/B%C3%BAt_danh\">bút danh</a> Nguyên Phong và được công ty <a href=\"https://vi.wikipedia.org/wiki/First_News\">First News</a> phát hành năm 2020. Thông qua hành trình trải nghiệm quá khứ qua nhiều kiếp sống của một doanh nhân người Mỹ, tác phẩm bàn về <a href=\"https://vi.wikipedia.org/wiki/Quan_h%E1%BB%87_nh%C3%A2n_qu%E1%BA%A3\">luật nhân quả</a>, sự <a href=\"https://vi.wikipedia.org/wiki/Lu%C3%A2n_h%E1%BB%93i\">luân hồi</a>, <a href=\"https://vi.wikipedia.org/wiki/T%C3%A1i_sinh_(Ph%E1%BA%ADt_gi%C3%A1o)\">tái sinh</a> và cuộc sống của con người.</p><p>Sau thành công của tác phẩm phóng tác <i>Hành trình về phương Đông</i>, Nguyên Phong nhận được sự chú ý của độc giả Việt Nam qua những ấn phẩm dịch thuật về tâm linh. Điều này đã thu hút sự chú ý của Giám đốc công ty <a href=\"https://vi.wikipedia.org/wiki/First_News\">First News</a> Nguyễn Văn Phước, là tiền đề cho quá trình hợp tác lâu dài giữa Nguyên Phong với công ty này. Năm 2017, Nguyên Phong bắt tay vào sáng tác <i>Muôn kiếp nhân sinh</i>.</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Nguyên Phong</strong></p>', 1),
(18, 6, 'Thần thoại', 'than-thoai.jpg', 66, 150000, 120000, '2023-11-20 23:20:33', 0, '<figure class=\"table\"><table><tbody><tr><td>Ngày</td><td>THÁNG</td></tr><tr><td>10</td><td>11</td></tr></tbody></table></figure>', '<ul><li>ngay sx: 20 /11/2003</li><li>name 20336</li></ul>', 1),
(20, 2, 'Chưa kịp lớn', 'chua-kip-lon.jpg', 55, 200000, 160000, '2023-11-20 23:31:04', 0, '<h4>Chưa kịp lớn</h4>', '<ul><li>NXB: HCM</li><li>NXB: HCM</li></ul>', 1),
(21, 17, 'TalMud - Tinh Hoa Trí Tuệ Do Thái', 'tinh-hoa-tri-tue.jpg', 20, 110000, 88000, '2023-11-23 09:54:06', 0, '', '', 1),
(23, 6, 'Sách đất rừng', 'dat-rung.jpg', 30, 150000, 120000, '2023-11-23 12:19:16', 0, '', '<ul><li>Tác giả: Khoa Nguyễn</li><li>NXB: Kim Đồng 2023</li></ul>', 1),
(24, 6, 'Thể xác tâm hồn', 'the-xac.jpg', 123, 150000, 120000, '2023-11-23 12:20:16', 0, '<h4>Sách Thể xác tâm hồn</h4><p>&nbsp;</p>', '<ul><li>Tác giả: Khả Hi &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;NXB: Kim Đồng</li><li>Xuất xứ: Việt Nam &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Giấy phép: VN060503</li></ul>', 1),
(25, 4, 'Cây cam ngọt', 'cay-cam-ngot.jpg', 50, 200000, 160000, '2023-11-23 16:21:03', 2, '<p><strong>Bắt đầu viết sách từ năm 22 tuổi nhưng hơn 20 năm sau, José Mauro de Vasconcelos mới nổi tiếng nhờ tiểu thuyết Cây cam ngọt của tôi chỉ dày hơn 200 trang.</strong></p><p>Khi được dịch và phát hành năm 2020 tại Việt Nam, cuốn sách của José Mauro de Vasconcelos đã trở thành hiện tượng thu hút độc giả, lọt vào danh sách bán chạy của nhà sách Nhã Nam.&nbsp;</p><p>Suốt 50 năm qua, cuốn sách đã đem lại sự nổi tiếng cho tác giả. Đây là một phần của bộ tứ tiểu thuyết do Mauro viết, tập trung vào các giai đoạn khác nhau trong cuộc đời của nhân vật chính, Zezé.</p><p>Trong lần đầu xuất bản vào năm 1968, sách bán được hơn 200.000 bản, trở thành tác phẩm bán chạy nhất trong lịch sử của Brazil. Tác phẩm được đưa vào chương trình giảng dạy của các trường tiểu học và dịch ra 19 thứ tiếng phát hành ở Mỹ, châu Âu, châu Á.&nbsp;</p><p>Các nhà làm phim cũng chuyển thể <i>Cây cam ngọt của tôi </i>thành phim truyền hình dài tập và phim điện ảnh. Sau khi qua đời năm 1984, José Mauro de Vasconcelos được đặt tên cho nhiều thư viện và hiệp hội văn hóa trên khắp Brazil.&nbsp;</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Vasconcelos</strong></p>', 1),
(26, 2, 'Hai số phận bi đát(2022)', 'hai-so-phan.jpg', 50, 380000, 200000, '2023-11-23 16:23:55', 0, '<p>Hai số phận (có tên gốc tiếng Anh là: Kane and Abel) là một cuốn tiểu thuyết được sáng tác vào năm 1979 bởi nhà văn người Anh <strong>Jeffrey Archer</strong>. Tựa đề Kane and Abel dựa theo câu chuyện của anh em: Cain và Abel trong Kinh Thánh Cựu Ước.</p><p>Nội dung tác phẩm nói về hai số phận của hai người đàn ông khác nhau có tên Kane &amp; Abel, họ có lẽ sẽ có gì liên quan đến nhau ngoại trừ việc cùng được sinh ra cùng giờ, cùng ngày, cùng tháng và cùng năm. Tất nhiên, hai số phận của họ lại rẽ theo hai hướng hoàn toàn khác biệt nhau.&nbsp;</p>', '<p>Nhà xuất bản: <strong>Kim đồng&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Tác giả: <strong>Jeffrey Archer</strong></p>', 1),
(27, 4, 'Người bà tài giỏi(tái bản 2022)', 'nguoi-ba.jpg', 30, 250000, 180000, '2023-11-23 20:31:17', 2, '<p>Là câu chuyện về cậu bé Tokunaga Akihiro, học sinh lớp 2, chuyển từ Hiroshima về Saga để sống cùng bà ngoại (và dựa trên câu chuyện có thật của chính tác giả). Luôn có những cú đẩy quan trọng trong cuộc đời mỗi người, và \"cú đẩy\" (theo cả nghĩa đen lẫn nghĩa bóng) với Akihiro ở sân ga Hiroshima hôm ấy đã khiến cuộc đời cậu thay đổi hoàn toàn.</p><p>&nbsp;</p>', '<p>Nhà xuất bản: <strong>Kim đồng&nbsp;</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Tác giả: <strong>Yoshichi Shimada</strong></p>', 1),
(28, 16, 'Nghĩ Giàu Làm Giàu', 'nghi-giau.jpg', 500, 200000, 180000, '2023-11-29 20:36:43', 2, '<p>Think and Grow Rich (tạm dịch: Nghĩ Giàu Làm Giàu hoặc Suy Nghĩ và Làm Giàu) là cuốn sách được viết bởi <strong>Napoleon Hill</strong> vào năm 1937 và được quảng bá là một cuốn sách giúp phát triển cá nhân và tự lực bán chạy nhất thế giới(tham khảo tại Danh sách sách bán chạy nhất) .</p><p>Tất cả những bí mật làm giàu được Napoleon Hill chuyển tải thông qua 13 nguyên tắc quan trọng được ông đúc kết xuyên suốt gần 30 năm, 13 nguyên tắc này như một kim chỉ nam để mở toang cánh cửa giúp chúng ta đạt được những mục tiêu lớn lao của cuộc đời mình.</p><p>Đây cũng là cuốn sách đầu tiên đưa ra một triết lý đầy đủ và toàn diện về thành công của cá nhân, đồng thời cung cấp những phương pháp để tạo một ý thức thành công cũng như lập kế hoạch chi tiết để đạt được thành công đó. Các bí quyết thành công được đề cập trong cuốn sách này có thể được đúc kết ngắn gọn: tất cả bắt nguồn từ cách nghĩ. Do đó, cuốn sách này không chỉ thay đổi những điều bạn nghĩ mà còn thay đổi cả cách nghĩ của bạn; nó không dừng lại ở việc chỉ ra bạn phải làm gì mà còn cho bạn biết phải làm điều đó như thế nào để đạt được khát vọng của mình.</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Napoleon Hill</strong></p>', 1),
(29, 4, 'Nhà Giả Kim (Tái Bản 2020)', 'nha-gia-kim.jpg', 30, 80000, 50000, '2023-12-02 20:54:53', 1, '<h4>Giới thiệu sách “ Nhà giả kim - Tác giả: Paulo Coelho”</h4><p>&nbsp;</p><p>“Nhà Giả Kim” là một trong những tác phẩm hay nhất của tác giả <strong>Paulo Coelho</strong>. Cuốn sách bắt đầu bằng câu chuyện xoay quanh cậu bé chăn cừu có tên Santiago trong chuyến hành trình đi tìm kho báu của mình.</p><p>Mỗi người đều có những ước mơ và hoài bão của riêng mình. Đó có thể là những khát khao to lớn, vĩ đại hoặc là những mục tiêu tưởng chừng đơn giản, gần gũi nhưng khó có thể chinh phục. Và đặc biệt với các bạn trẻ hiện nay vẫn đang lạc hướng, hoang mang giữa dòng chảy cuộc đời bất tận, đầy cạm bẫy thử thách. Chính vì thế, hôm nay Thư viện UIT sẽ giới thiệu đến các bạn một quyển sách gối đầu giường của hàng triệu người trên thế giới và còn được mệnh danh là quyển sách bán chạy chỉ sau kinh thánh - Nhà giả kim của tác giả Paulo Coelho.</p><p>Đôi nét về tác giả Paulo Coelho, ông sinh ngày 24 tháng 8 năm 1947 ở thành phố xinh đẹp Rio de Janeiro, Brazil. Từ nhỏ, ông đã có ước mơ trở thành nhà văn nhưng bị bố mẹ ngăn cản nên ông đã theo lời bố mẹ học trường luật tại quê nhà. Những áp đặt của gia đình và xã hội lúc bấy giờ đã khiến Paulo Coelho quyết định bỏ học và bắt đầu đi du lịch. Trước khi chính thức theo đuổi sự nghiệp viết lách, ông đã làm qua rất nhiều nghề như soạn lời cho các ca sĩ, làm báo, diễn viên và giám đốc nhà hát.</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Paulo Coelho</strong></p>', 1),
(30, 4, 'Ngàn Mặt Trời Rực Rỡ', 'ngan-mat-troi.jpg', 50, 120000, 102000, '2023-12-02 20:56:21', 3, '<p><i><strong>Ngàn mặt trời rực rỡ</strong></i> là <a href=\"https://vi.wikipedia.org/wiki/Ti%E1%BB%83u_thuy%E1%BA%BFt\">tiểu thuyết</a> thứ hai phát hành năm <a href=\"https://vi.wikipedia.org/wiki/2007\">2007</a> của nhà văn <a href=\"https://vi.wikipedia.org/wiki/Khaled_Hosseini\">Khaled Hosseini</a>, một người <a href=\"https://vi.wikipedia.org/wiki/M%C4%A9\">Mĩ</a> gốc <a href=\"https://vi.wikipedia.org/wiki/Afghanistan\">Afghanistan</a>. Cuốn sách nhanh chóng trở thành tác phẩm bán chạy, tiếp nối sự thành công của tiểu thuyết <a href=\"https://vi.wikipedia.org/wiki/Ng%C6%B0%E1%BB%9Di_%C4%91ua_di%E1%BB%81u\"><i>Người đua diều</i></a> năm <a href=\"https://vi.wikipedia.org/wiki/2003\">2003</a> của ông. Cả hai cuốn tiểu thuyết gộp lại bán được 38 triệu bản trên toàn thế giới. Năm <a href=\"https://vi.wikipedia.org/wiki/2010\">2010</a>, <i>Ngàn mặt trời rực rỡ</i> được dịch sang <a href=\"https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Vi%E1%BB%87t\">tiếng Việt</a>.</p><p>Thời gian trong tiểu thuyết trải dài hơn 40 năm từ thập niên 60 thế kỷ 20 đến năm 2003. Bố cục tiểu thuyết chia làm bốn phần: Phần 1 tập trung miêu tả Mariam, phần 2 và 4 miêu tả Laila và phần 3 mô tả mối quan hệ giữa hai người phụ nữ.</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Khaled Hosseini</strong></p>', 1),
(31, 6, 'Phương Nam', 'dat-rung-phuong-nam_ban-dien-anh.jpg', 50, 180000, 126000, '2023-12-02 20:59:06', 1, '<p><i><strong>Đất rừng phương Nam</strong></i> (tựa <a href=\"https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Anh\">tiếng Anh</a>: <i><strong>Song of the South</strong></i>) là một bộ phim điện ảnh chuyển thể thành sách năm 2023</p><p>An là một cậu bé sinh sống ở đô thành của khu vực <a href=\"https://vi.wikipedia.org/wiki/Nam_K%E1%BB%B3_L%E1%BB%A5c_t%E1%BB%89nh\">Nam Kỳ Lục tỉnh</a> cùng với mẹ của mình vào những năm 1920&nbsp;– 1930. Ba của An là Hai Thành, một người đi theo <a href=\"https://vi.wikipedia.org/wiki/Vi%E1%BB%87t_Minh\">cách mạng</a> với mong muốn đánh đuổi thực dân Pháp ra khỏi Việt Nam. Khi danh tính của Hai Thành bị bại lộ, mẹ của An đã dẫn cậu rời khỏi đô thành dưới sự chỉ dẫn của thầy giáo Bảy. Trên đường đi thì một cuộc <a href=\"https://vi.wikipedia.org/wiki/Bi%E1%BB%83u_t%C3%ACnh\">biểu tình</a> của quần chúng nhân dân đã diễn ra khi Võ Tòng – một thành viên của tổ chức Nghĩa quân Lục tỉnh – bị bắt giữ. Tại đây, một vụ xô xát đã diễn ra giữa binh lính Pháp và những người biểu tình, dẫn đến việc mẹ của An vô tình đã bị lính Pháp bắn chết. Út Lục Lâm – một tên trộm trong thời chiến đã vô tình thấy cảnh tượng này nên hắn đã quyết định hỗ trợ An rời khỏi đó.</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Tô Ánh Nguyệt</strong></p>', 1),
(32, 16, 'Kiếm Tiền Từ Tiktok', 'kiem-tien-titok.jpg', 50, 120000, 100000, '2023-12-02 21:00:48', 0, '<p>TikTok là một ứng dụng mạng xã hội chuyên tạo và chia sẻ video ngắn dành cho giới trẻ. Người dùng có thể quay một video ngắn từ 15 giây, sau đó chỉnh sửa, thêm nhạc, chèn hiệu ứng… thông qua phần mềm này để tạo nên một video hoàn chỉnh cho chính mình. Không ít cá nhân thu được lợi tức trên TikTok. Ngoài ra, cũng có không ít công ty cũng xem TikTok như một địa điểm marketing mới của mình.</p><p>Nội dung sách chú ý đến mọi khía cạnh của nền tảng này kèm ví dụ đầy đủ, bắt đầu từ khái niệm TikTok đến kỹ xảo, thao tác thực tế cần có để có thể trở thành một ngôi sao trên bầu trời Tiktok với 8 nội dung đáng lưu ý:</p>', '<p>Nhà xuất bản: <strong>NXB Thế Giới</strong> &nbsp; &nbsp; &nbsp;Tác giả: <strong>Giang Trung</strong></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên đăng nhập',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Họ tên',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 là khách hàng 1 là nhân viên',
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `image`, `email`, `phone`, `address`, `role`, `active`) VALUES
(8, 'admin', '$2y$10$zwNwMKly8otZrxWr6BTTxuRdX5eGj/2FbZT3wI3TfQ6Io8/jgAlLC', 'Admin', 'user-default.png', 'khoacntt2003@gmail.com', '0336216559', 'Hà Nội', 1, 1),
(9, 'tranvana', '$2y$10$ts748iCUjwA5HpQBMLuROuAXa70addsKmfkMh9rYIw/PjhxLLwH8i', 'Trần Văn A', 'user-default.png', 'tranvana@gmail.com', '0909135969', 'Hải DUơng', 0, 1),
(11, 'tuankiet', '$2y$10$ENy4z0Infjac7VjlKYp2A.gqCBwc8N01tKGLT9A3buGdVoyd7sXnK', 'Đặng tuấn Kiệt', 'user-default.png', 'kietdtpc06764@fpt.edu.vn', '0909006764', 'Hà Nội', 0, 1),
(12, 'khoanguyen111', '$2y$10$ZPAY2O7ntfQ5/Huv3dUAIuY4qHuPD/DpRxiw11TurgYr3hCrWfnv2', 'Nguyễn Lê Anh Khoa', 'khoanguyen.jpg', 'khoanlapc1234@gmail.com', '0336216546', 'Hà Nội', 0, 1),
(13, 'khoanguyen001', '$2y$10$ptSvfsaT78h4LdZQNCrKdemlC.AqyZ/q5cudTk9/FKcbe6TtJDJAC', 'Nguyễn Lê Anh Khoa', 'user-default.png', 'khoanla113@gmail.com', '0336216555', 'Hà Nội', 0, 1),
(15, 'admin123', '$2y$10$aHhX0ZWQjp9Fe3x4EpsjCuMHWRy0v7YXUY/d1TV1es.nzBKCRUJge', 'Liêm Nguyễn Văn', 'user-default.png', 'ngliem2408@gmail.com', '0971415610', 'Thường Tín Hà Nội Việt Nam', 0, 1),
(16, 'liemdzai123', '$2y$10$opZ2nqPlErFGZeBm6bmg7eqlJ1wBNF8CD5DOF8b853MzO.DLipXrC', 'Liêm Nguyễn Văn', 'user-default.png', 'liemnvph48149@fpt.edu.vn', '0916618212', 'Thường Tín ', 1, 1),
(17, 'liem123', '$2y$10$uNs/Alxnr3PYKXdj9kl2NOE4wbXJ/o715Kik4ZxnMW2mG3n.nS7Ma', 'Liêm Nguyễn', 'user-default.png', 'liem2003@gmail.com', '0846013328', ' Hà Nội', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

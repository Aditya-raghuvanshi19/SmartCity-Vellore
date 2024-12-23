-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2024 at 09:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_city_vellore`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `aid` int(11) NOT NULL,
  `image` text NOT NULL,
  `published_date` date NOT NULL DEFAULT current_timestamp(),
  `title` text NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  `publisher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`aid`, `image`, `published_date`, `title`, `description`, `content`, `publisher`) VALUES
(13, '548011903Vellore_Fort_Main.jpg', '2024-11-10', 'History and Attractions of Vellore Fort', 'This article discusses the architecture, history, and main attractions of Vellore Fort, including the Jalakandeswarar Temple and St. John�s Church. The fort�s strategic structure, historical relevance, and preservation are explored in detail.', 'Vellore Fort, a historic monument built by the Vijayanagara kings, offers a rich glimpse into South India\'s past. Known for its architectural marvels, the fort includes the Jalakandeswarar Temple, renowned for intricate carvings dedicated to Lord Shiva, and St. John�s Church, a Gothic-style structure constructed by the British. There is also a museum showcasing artifacts from the fort\'s history, such as weaponry and sculptures, making it a prime destination for history enthusiasts. The fort\'s defensive design, including a 360-degree view from its hilltop, underscores its strategic importance in medieval warfare. ', 'Priya Desai'),
(14, 'drapt2.png', '2024-11-10', 'Healthcare and Education in Vellore: A Growing Hub', 'This article covers Vellore�s importance as a healthcare and education center, highlighting institutions like Christian Medical College and VIT University and medical tourism.', 'Vellore is recognized as a healthcare and education center, home to the prestigious Christian Medical College (CMC) and the VIT University. CMC, a pioneering institution in medical education and healthcare, attracts patients and students from across India and internationally. VIT University, known for its engineering and technology programs, draws a significant student population, contributing to the city\'s diverse, cosmopolitan vibe. The presence of these institutions has shaped Vellore�s development, bringing in an influx more about Vellore�s healthcare and education prominence', 'Arun Nair'),
(15, 'golden-temple.jpg', '2024-11-10', 'Exploring Vellore�s Spiritual Sites', 'This piece provides insight into Vellore�s spiritual heritage, including the Sripuram Golden Tam Temple, showcasing the city�s cultural and religious significance.', 'Besides the fort, Vellore has several spiritual sites, including the Sripuram Golden Temple, dedicated to the goddess Lakshmi. This temple, located 12 kilometers from the city center, is fully gold-plated and surrounded by beautiful landscapes, attracting numerous visitors year-round. Other sites like the Virinjipuram Temple showcase the region�s historic Dravi in cultural and spiritual experiences', 'Sanya Reddy'),
(16, 'OIP.jpg', '2024-11-11', 'The Evolving Cuisine of Vellore: A Culinary Journey', 'Vellore�s cuisine blends traditional Tamil flavors with influences from nearby regions. This article would take readers on a culinary journey through Vellore�s unique dishes, street food, and must-visit eateries. It would explore local specialties and feature insights from chefs and food enthusiasts on Vellore�s evolving food scene.', 'Vellore�s food culture offers a delightful fusion of flavors, from spicy chutneys to coconut-infused curries. Popular dishes like idiyappam (string hoppers) with coconut milk and varieties of dosa have put Vellore on the culinary map. Notable eateries, such as Murugan Dosa, offer an array of dosas that reflect the city�s rich culinary heritage. Recent influences from Chennai and Bangalore have added a modern twist to traditional recipes, making Vellore�s food scene vibrant and ever-evolving.', 'Sanjay Kumar'),
(17, 'vellore.jpg', '2024-11-16', 'Vellore: The Blend of History and Modernity', 'Explore the captivating charm of Vellore, a city that marries historical grandeur with modern progress. From the iconic Vellore Fort to world-renowned educational institutions and lush green landscapes, this article delves into the heart of Tamil Nadu\'s cultural and urban gem.', 'Nestled in the heart of Tamil Nadu, Vellore is a city that seamlessly blends its rich historical heritage with a modern urban pulse. Known for its iconic landmarks and cultural vibrancy, Vellore offers an enchanting experience for residents and visitors alike.\r\n\r\nHistorical Marvels\r\nAt the core of Vellore\'s charm lies the magnificent Vellore Fort, an architectural marvel from the 16th century. Surrounded by a glistening moat, the fort is a testament to the city\'s rich past. It houses temples, a mosque, and a church, symbolizing the harmony of diverse cultures.\r\n\r\nEducational Hub\r\nHome to esteemed institutions like Christian Medical College (CMC) and VIT University, Vellore attracts students and professionals from across the globe. These institutions have put Vellore on the map as a center of academic excellence.\r\n\r\nNatural Beauty\r\nThe serene hills surrounding the city and lush green parks provide a refreshing escape from urban hustle. The Amirthi Zoological Park and Yelagiri Hills are popular spots for nature enthusiasts.\r\n\r\nCultural Significance\r\nVellore�s festivals and markets pulsate with life, offering a glimpse into Tamil Nadu\'s vibrant traditions. From exquisite silk to intricate jewelry, the city is a haven for shoppers.\r\n\r\nFuture Prospects\r\nWith ongoing developments in infrastructure and technology, Vellore is poised for a bright future. Its strategic location makes it a crucial link between major cities like Chennai and Bengaluru.\r\n\r\nVellore is more than a city; it is a journey through time and tradition, with a promise of growth and innovation. A visit to this gem in Tamil Nadu will leave you captivated and inspired.', 'Shashi Tharoor');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `serviceName` varchar(45) NOT NULL,
  `location` text NOT NULL,
  `price` double NOT NULL,
  `total_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cid`, `bid`, `uid`, `serviceName`, `location`, `price`, `total_price`) VALUES
(23, 20, 1, 'Golden Temple - Sripuram', 'The temple is located on 100 acres of land and has been constructed by the Vellore-based charitable trust, Sri Narayani Peedam, headed by its spiritual leader Sri Sakthi Amma also known as �Narayani Amma�. The temple with its gold (1500 kg) covering, has intricate work done by artisans specialising in temple art using gold. Every single detail was manually created, including converting the gold bars into gold foils and then mounting the foils on copper. Gold foil from 9 layers to 10 layers has been mounted on the etched copper plates. Every single detail in the temple art has significance from the vedas.', 50000, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `name`) VALUES
(4, 'Emergency'),
(5, 'Hospitals'),
(6, 'Hotels'),
(7, 'Education'),
(8, 'Cafe'),
(9, 'Tourism');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `serviceId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `serviceId`, `userId`, `comment`) VALUES
(2, 18, 1, 'Good Ambience.');

-- --------------------------------------------------------

--
-- Table structure for table `service_dtls`
--

CREATE TABLE `service_dtls` (
  `serviceId` int(11) NOT NULL,
  `servicename` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `price` double NOT NULL,
  `category` varchar(45) NOT NULL,
  `status` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_dtls`
--

INSERT INTO `service_dtls` (`serviceId`, `servicename`, `location`, `price`, `category`, `status`, `photo`, `email`, `phone`) VALUES
(15, 'ARC International Fertility & Research Centre', '6 Casa Major Road, Chennai, Tamil Nadu 600008', 800, 'Hospitals', 'Active', '1hospital.png', 'admin', '078119 99999'),
(16, 'CMC Vellore', 'Ida Scudder Road, Vellore, Tamil Nadu 632004', 500000, 'Education', 'Active', 'image2.png', 'admin', '0416 222 2102'),
(17, 'The Vellore Cafe', '4, Muthannan Nagar, Kosapet, Vellore, Tamil Nadu', 500, 'Cafe', 'Active', 'cafe 5.jpeg.jpg', 'admin', '094433 30780'),
(18, 'Park Inn By Radisson Vellore', 'TS No-188, Palathoram, Near Green Circle New Katpadi Road, Vellore 632004 India', 50000, 'Hotels', 'Active', '16256-166947-f81803742_3xl (1).jpg', 'admin', '04163504444'),
(19, 'Police Helpline', 'Providing 24/7 assistance for law enforcement and public safety emergencies.', 0, 'Emergency', 'Active', 'police.jpg', 'admin', '04162220021'),
(20, 'Golden Temple - Sripuram', 'The temple is located on 100 acres of land and has been constructed by the Vellore-based charitable trust, Sri Narayani Peedam, headed by its spiritual leader Sri Sakthi Amma also known as �Narayani Amma�. The temple with its gold (1500 kg) covering, has intricate work done by artisans specialising in temple art using gold. Every single detail was manually created, including converting the gold bars into gold foils and then mounting the foils on copper. Gold foil from 9 layers to 10 layers has been mounted on the etched copper plates. Every single detail in the temple art has significance from the vedas.', 50000, 'Tourism', 'Active', '2018070999-olw89la2e5zsm4bp0jx3vb2hqrnmfxkutq5elu0wi2.jpg', 'admin', '0416 220 6500'),
(21, 'School ABC', 'KAtpadi', 1000, 'Education', 'Active', '16256-166947-f81803742_3xl (1).jpg', 'admin', '7894561230'),
(22, 'Ambulance', 'W4FP+MRC, Arcot Road Thottapalayam Near CMC Jubilee Gate, Vellore, Tamil Nadu 632004', 0, 'Emergency', 'Active', 'abmulace.jpg', 'admin', '095433 43442');

-- --------------------------------------------------------

--
-- Table structure for table `service_order`
--

CREATE TABLE `service_order` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phno` varchar(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `price` double NOT NULL,
  `payment` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_order`
--

INSERT INTO `service_order` (`id`, `order_id`, `user_name`, `email`, `address`, `phno`, `service_name`, `location`, `price`, `payment`, `status`, `phone`) VALUES
(6, 'BOOK-ORD-00324', 'Shreekant Kalwar', 'user123@gmail.com', 'Katpadi,Katpadi,Vellore,Tamil Nadu,741852', '1234567890', 'Golden Temple - Sripuram', 'The temple is located on 100 acres of land and has been constructed by the Vellore-based charitable trust, Sri Narayani Peedam, headed by its spiritual leader Sri Sakthi Amma also known as �Narayani Amma�. The temple with its gold (1500 kg) covering, has intricate work done by artisans specialising in temple art using gold. Every single detail was manually created, including converting the gold bars into gold foils and then mounting the foils on copper. Gold foil from 9 layers to 10 layers has been mounted on the etched copper plates. Every single detail in the temple art has significance from the vedas.', 50000, 'COD', 'Order Processing', '0416 220 6500'),
(9, 'BOOK-ORD-00507', 'Aditya', 'user@gmail.com', 'Katpadi,Katpadi,Vellore,Tamil Nadu,632014', '1234567890', 'Golden Temple - Sripuram', 'The temple is located on 100 acres of land and has been constructed by the Vellore-based charitable trust, Sri Narayani Peedam, headed by its spiritual leader Sri Sakthi Amma also known as �Narayani Amma�. The temple with its gold (1500 kg) covering, has intricate work done by artisans specialising in temple art using gold. Every single detail was manually created, including converting the gold bars into gold foils and then mounting the foils on copper. Gold foil from 9 layers to 10 layers has been mounted on the etched copper plates. Every single detail in the temple art has significance from the vedas.', 50000, 'COD', 'Order Processing', '0416 220 6500');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phno` varchar(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `name`, `email`, `phno`, `password`) VALUES
(1, 'Aditya', 'user@gmail.com', '1234567890', '123456'),
(2, 'Shreekant', 'user123@gmail.com', '1234567890', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_dtls`
--
ALTER TABLE `service_dtls`
  ADD PRIMARY KEY (`serviceId`);

--
-- Indexes for table `service_order`
--
ALTER TABLE `service_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_dtls`
--
ALTER TABLE `service_dtls`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `service_order`
--
ALTER TABLE `service_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

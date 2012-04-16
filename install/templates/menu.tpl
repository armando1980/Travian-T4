<?php
	if(isset($_GET['s'])) {
	switch($_GET['s']) {
		case 1:
		echo "<li class=\"c2 f9\"><a href=\"#\">شروع</a></li><li class=\"active\"><a href=\"#\">تنظیمات</a></li><li class=\"c1 f9\"><a href=\"#\">دیتابیس</a></li><li class= \"c1 f9\"><a href=\"#\">جدول ها</a></li><li class=\"c1 f9\"><a href=\"#\">مولتی هانتر</a></li><li class=\"c1 f9\"><a href=\"#\">آبادی ها</a></li><li class=\"c1 f9\"><a href=\"#\">پایان</a></li>";

		break;
		case 2:
		echo "<li class=\"c2 f9\"><a href=\"#\">شروع</a></li><li class=\"c1 f9\"><a href=\"#\">تنظیمات</a></li><li class=\"active\"><a href=\"#\">دیتابیس</a></li><li class= \"c1 f9\"><a href=\"#\">جدول ها</a></li><li class=\"c1 f9\"><a href=\"#\">مولتی هانتر</a></li><li class=\"c1 f9\"><a href=\"#\">آبادی ها</a></li><li class=\"c1 f9\"><a href=\"#\">پایان</a></li>";
		break;
		case 3:
		echo "<li class=\"c2 f9\"><a href=\"#\">شروع</a></li><li class=\"c1 f9\"><a href=\"#\">تنظیمات</a></li><li class=\"c1 f9\"><a href=\"#\">دیتابیس</a></li><li class= \"active\"><a href=\"#\">جدول ها</a></li><li class=\"c1 f9\"><a href=\"#\">مولتی هانتر</a></li><li class=\"c1 f9\"><a href=\"#\">آبادی ها</a></li><li class=\"c1 f9\"><a href=\"#\">پایان</a></li>";
		break;
		case 4:
		echo "<li class=\"c2 f9\"><a href=\"#\">شروع</a></li><li class=\"c1 f9\"><a href=\"#\">تنظیمات</a></li><li class=\"c1 f9\"><a href=\"#\">دیتابیس</a></li><li class= \"c1 f9\"><a href=\"#\">جدول ها</a></li><li class=\"active\"><a href=\"#\">مولتی هانتر</a></li><li class=\"c1 f9\"><a href=\"#\">آبادی ها</a></li><li class=\"c1 f9\"><a href=\"#\">پایان</a></li>";
		break;
        case 5:
		echo "<li class=\"c2 f9\"><a href=\"#\">شروع</a></li><li class=\"c1 f9\"><a href=\"#\">تنظیمات</a></li><li class=\"c1 f9\"><a href=\"#\">دیتابیس</a></li><li class= \"c1 f9\"><a href=\"#\">جدول ها</a></li><li class=\"c1 f9\"><a href=\"#\">مولتی هانتر</a></li><li class=\"active\"><a href=\"#\">آبادی ها</a></li><li class=\"c1 f9\"><a href=\"#\">پایان</a></li>";
		break;
        case 6:
        echo "<li class=\"c2 f9\"><a href=\"#\">شروع</a></li><li class=\"c1 f9\"><a href=\"#\">تنظیمات</a></li><li class=\"c1 f9\"><a href=\"#\">دیتابیس</a></li><li class= \"c1 f9\"><a href=\"#\">جدول ها</a></li><li class=\"c1 f9\"><a href=\"#\">مولتی هانتر</a></li><li class=\"c1 f9\"><a href=\"#\">آبادی ها</a></li><li class=\"active\"><a href=\"#\">پایان</a></li>";
        break;
	}
    
}
else {
	echo "<li class=\"active\"><a href=\"#\">شروع</a></li><li class=\"c1 f9\"><a href=\"#\">تنظیمات</a></li><li class=\"c1 f9\"><a href=\"#\">دیتابیس</a></li><li class= \"c1 f9\"><a href=\"#\">جدول ها</a></li><li class=\"c1 f9\"><a href=\"#\">مولتی هانتر</a></li><li class=\"c1 f9\"><a href=\"#\">آبادی ها</a></li><li class=\"c1 f9\"><a href=\"#\">پایان</a></li>";
}
?>
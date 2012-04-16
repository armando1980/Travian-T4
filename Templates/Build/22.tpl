<h1 class="titleInHeader">دارالفنون <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

<div id="build" class="gid22">
<div class="build_desc">
<a href="#" onClick="return Popup(22,4);" class="build_logo">

	<img class="building big white g22" src="img/x.gif" alt="دارالفنون" title="دارالفنون" />
</a>
در دارالفنون، نیروهای جدیدی می توانید تحقیق کنید. هر قدر سطح آن بالا باشد قادر به تحقیق نیروهای بهتری خواهید بود.
<br /><br />
بعد از تحقیق نیرو در دارالفنون می توانید آن نیرو را در این دهکده بسازید.</div>
<?php
include("upgrade.tpl"); ?>
<div class="clear"></div>

<?php
	if ($building->getTypeLevel(22) > 0) {
		include("22_".$session->tribe.".tpl");
	} else {
		echo "<p><b>نیروی جدیدی برای تحقیق کردن وجود ندارد.</b><br></p>\n";
	}

	
?>
         </div>
<div class="clear">&nbsp;</div>
    <div class="clear"></div>
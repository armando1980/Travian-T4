<h1 class="titleInHeader">آهنگری <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid13">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(12,4);" class="build_logo">
<img class="building big white g13" src="img/x.gif" alt="آهنگری" title="آهنگری" />
</a>
در آهنگری اسلحه ها و تجهیزات جنگی لشکریان شما ارتقاء داده می شود. هر قدر سطح آن بالا باشد بیشتر قادر به ارتقاء بیشتر اسلحه و تجهیزات خواهید بود.<?php
include("upgrade.tpl");
	if ($building->getTypeLevel(12) > 0) {
		include("12_upgrades.tpl");
	} else {
		echo "<p><b>به آخرین سطح ممکن رسیده است.</b><br>\n";
	}
?>
</div>
</div>

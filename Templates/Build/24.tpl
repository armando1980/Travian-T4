<h1 class="titleInHeader">تالار <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>

<div id="build" class="gid24">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(24,4);" class="build_logo">
	<img class="building big white g24" src="img/x.gif" alt="تالار" title="تالار" />
</a>
در تالار شما می توانید جشنهای پرشکوه برگزار کنید. این جشنها باعث افزایش امتیاز فرهنگی دهكده ي شما می شوند.
</div>

<?php
	include("upgrade.tpl");
	if ($building->getTypeLevel(24) > 0) {
		include("Templates/Build/24_1.tpl"); 
		include("Templates/Build/24_2.tpl");
	}
?>
</div>
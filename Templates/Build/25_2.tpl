<h1 class="titleInHeader">اقامتگاه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid25">
<div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(25,4, 'gid');" class="build_logo">
        <img class="building big white g25" src="img/x.gif" alt="اقامتگاه" title="اقامتگاه" /> </a>
        اقامتگاه قصر کوچکی است و هنگامی که پادشاه و یا ملکه از دهکده دیدن می کنند در آن می مانند. اقامتگاه از دهکده در مقابل افرادی که قصد تسخیر ان را دارند محافظت می کند.</div>

<?php
include("upgrade.tpl");
include("25_menu.tpl"); ?>

<p>برای توسعۀ امپراطوری خود، به امتیاز فرهنگی نیاز خواهید داشت. امتیاز فرهنگی با گذشت زمان بیشتر می شود و حتی قادر به افزایش سرعت آن با ارتقاء ساختمان ها نیز می باشید.</p>

<table cellpadding="1" cellspacing="1" id="build_value">
<tr>
        <th>تولید این دهکده:</th>
        <td><b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> امتياز فرهنگی در هر روز</td>
</tr>
<tr>
        <th>تولید تمامی دهکده ها:</th>
        <td><b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> امتياز فرهنگی در هر روز</td>
</tr>
</table><p>دهکده های شما <b><?php echo $database->getUserField($session->uid, 'cp',0); ?></b> امتیاز فرهنگی تولید کرده اند. برای تسخیر و یا بنای دهکدۀ جدید شما نیاز به <b><?php $mode = CP; $total = count($database->getProfileVillages($session->uid)); echo ${'cp'.$mode}[$total+1]; ?></b> امتیاز فرهنگی دارید. </p>
</div><div class="clear">&nbsp;</div>
    <div class="clear"></div>
<h1 class="titleInHeader">اقامتگاه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid25">
<div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(25,4, 'gid');" class="build_logo">
        <img class="building big white g25" src="img/x.gif" alt="اقامتگاه" title="اقامتگاه" /> </a>
        اقامتگاه قصر کوچکی است و هنگامی که پادشاه و یا ملکه از دهکده دیدن می کنند در آن می مانند. اقامتگاه از دهکده در مقابل افرادی که قصد تسخیر ان را دارند محافظت می کند.</div>

<?php
include("upgrade.tpl");
include("25_menu.tpl");
if ($village->capital == 1) {
        echo "<p class=\"none\">اینجا پایتخت شماست</p>";
}
if($village->resarray['f'.$id] >= 10){
        include ("25_train.tpl");
}
else{
        echo '<div class="c">برای بنا کردن دهکدۀ جدید شما نیاز به اقامتگاه سطح 10 و یا 20 و 3 مهاجر دارید. برای تسخیر دهکده ای شما نیاز به اقامتگاه سطح 10 و یا 20 و یک سناتور/رئیس/رئیس قبیله دارید.</div>';
}



?>
</div><div class="clear">&nbsp;</div>
    <div class="clear"></div>
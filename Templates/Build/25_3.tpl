<h1 class="titleInHeader">اقامتگاه <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid25">
<div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(25,4, 'gid');" class="build_logo">
        <img class="building big white g25" src="img/x.gif" alt="اقامتگاه" title="اقامتگاه" /> </a>
        اقامتگاه قصر کوچکی است و هنگامی که پادشاه و یا ملکه از دهکده دیدن می کنند در آن می مانند. اقامتگاه از دهکده در مقابل افرادی که قصد تسخیر ان را دارند محافظت می کند.</div>

<?php
include("upgrade.tpl"); include("25_menu.tpl"); ?>
می توانید با حمله ای که در آن از سناتور/رئیس قبیله/رئیس استفاده شده است وفاداری دهکده را کاهش داد. اگر وفاداری به 0 برسد دهکده از آن مهاجم خواهد شد. وفاداری این دهکده در حال حاضر <b><?php echo $database->getVillageField($village->wid, 'loyalty'); ?></b>% می باشد.</div>